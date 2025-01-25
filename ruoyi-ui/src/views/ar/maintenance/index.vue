<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="日期">
        <el-date-picker
          v-model="daterangeDate"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="维护负责人" prop="maintainerName">
        <el-input
          v-model="queryParams.maintainerName"
          placeholder="请输入维护负责人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备名称" prop="equipmentId">
        <el-select
          v-model="queryParams.equipmentId"
          placeholder="请选择设备名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in deviceList"
            :key="item.deviceNumber"
            :label="item.name"
            :value="item.deviceNumber"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ar:maintenance:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ar:maintenance:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ar:maintenance:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ar:maintenance:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="maintenanceList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="运维记录编号" align="center" prop="recordId" />
      <el-table-column label="运维日记" align="center" prop="maintenanceLog" />
      <el-table-column label="日期" align="center" prop="date" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="维护负责人"
        align="center"
        prop="maintainerName"
      />
      <el-table-column label="设备名称" align="center" prop="equipmentId">
        <template slot-scope="scope">
          <span>{{ getDeviceName(scope.row.equipmentId) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ar:maintenance:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:maintenance:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改运维记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="运维日记" prop="maintenanceLog">
          <el-input
            v-model="form.maintenanceLog"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="日期" prop="date">
          <el-date-picker
            clearable
            v-model="form.date"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="维护负责人" prop="maintainerName">
          <el-input
            v-model="form.maintainerName"
            placeholder="请输入维护负责人"
          />
        </el-form-item>
        <el-form-item label="设备名称" prop="equipmentId">
          <el-select
            v-model="form.equipmentId"
            placeholder="请选择设备名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in deviceList"
              :key="item.deviceNumber"
              :label="item.name"
              :value="item.deviceNumber"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listMaintenance,
  getMaintenance,
  delMaintenance,
  addMaintenance,
  updateMaintenance,
} from "@/api/ar/maintenance";
import { listDevice } from "@/api/ar/device";

export default {
  name: "Maintenance",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 运维记录表格数据
      maintenanceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 设备编号时间范围
      daterangeDate: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        maintenanceLog: null,
        date: null,
        maintainerName: null,
        equipmentId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        maintenanceLog: [
          { required: true, message: "运维日记不能为空", trigger: "blur" },
        ],
        date: [{ required: true, message: "日期不能为空", trigger: "blur" }],
        maintainerName: [
          { required: true, message: "维护负责人不能为空", trigger: "blur" },
        ],
        equipmentId: [
          { required: true, message: "设备名称不能为空", trigger: "blur" },
        ],
      },
      // 设备列表
      deviceList: [],
    };
  },
  created() {
    this.getList();
    this.getDeviceList();
  },
  methods: {
    /** 查询运维记录列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeDate && "" != this.daterangeDate) {
        this.queryParams.params["beginDate"] = this.daterangeDate[0];
        this.queryParams.params["endDate"] = this.daterangeDate[1];
      }
      listMaintenance(this.queryParams).then((response) => {
        this.maintenanceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 获取设备列表
    getDeviceList() {
      listDevice(this.allQueryParams).then((response) => {
        this.deviceList = response.rows;
      });
    },
    // 根据设备编号回显对应的设备名称
    getDeviceName(deviceNumber) {
      const device = this.deviceList.find(
        (item) => item.deviceNumber == deviceNumber
      );
      return device ? device.name : "";
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        recordId: null,
        maintenanceLog: null,
        date: null,
        maintainerName: null,
        equipmentId: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeDate = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.recordId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加运维记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const recordId = row.recordId || this.ids;
      getMaintenance(recordId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改运维记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.recordId != null) {
            updateMaintenance(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMaintenance(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const recordIds = row.recordId || this.ids;
      this.$modal
        .confirm('是否确认删除运维记录编号为"' + recordIds + '"的数据项？')
        .then(function () {
          return delMaintenance(recordIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "ar/maintenance/export",
        {
          ...this.queryParams,
        },
        `maintenance_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
