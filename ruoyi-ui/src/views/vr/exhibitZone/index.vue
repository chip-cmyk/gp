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
      <el-form-item label="展区名称" prop="exhibitZoneName">
        <el-input
          v-model="queryParams.exhibitZoneName"
          placeholder="请输入展区名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="展厅名称" prop="showroomId">
        <el-select
          v-model="queryParams.showroomId"
          placeholder="请选择展厅名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in showroomList"
            :key="item.showroomId"
            :label="item.showroomName"
            :value="item.showroomId"
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
          v-hasPermi="['vr:exhibitZone:add']"
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
          v-hasPermi="['vr:exhibitZone:edit']"
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
          v-hasPermi="['vr:exhibitZone:remove']"
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
          v-hasPermi="['vr:exhibitZone:export']"
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
      :data="exhibitZoneList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="展区编号" align="center" prop="exhibitZoneId" />
      <el-table-column label="展区名称" align="center" prop="exhibitZoneName" />
      <el-table-column label="简介" align="center" prop="description" />
      <el-table-column label="展厅名称" align="center" prop="showroomId">
        <template slot-scope="scope">
          <span>{{ getShowroomName(scope.row.showroomId) }}</span>
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
            v-hasPermi="['vr:exhibitZone:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['vr:exhibitZone:remove']"
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

    <!-- 添加或修改VR展区对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="展区名称" prop="exhibitZoneName">
          <el-input
            v-model="form.exhibitZoneName"
            placeholder="请输入展区名称"
          />
        </el-form-item>
        <el-form-item label="简介" prop="description">
          <el-input
            v-model="form.description"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
        <el-form-item label="展厅名称" prop="showroomId">
          <el-select
            v-model="form.showroomId"
            placeholder="请选择展厅名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in showroomList"
              :key="item.showroomId"
              :label="item.showroomName"
              :value="item.showroomId"
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
  listExhibitZone,
  getExhibitZone,
  delExhibitZone,
  addExhibitZone,
  updateExhibitZone,
} from "@/api/vr/exhibitZone";
import { listShowroom } from "@/api/vr/showroom";

export default {
  name: "ExhibitZone",
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
      // VR展区表格数据
      exhibitZoneList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        exhibitZoneName: null,
        showroomId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        exhibitZoneName: [
          { required: true, message: "展区名称不能为空", trigger: "blur" },
        ],
        description: [
          { required: true, message: "简介不能为空", trigger: "blur" },
        ],
        showroomId: [
          { required: true, message: "展厅名称不能为空", trigger: "blur" },
        ],
      },
      // 展厅列表
      showroomList: [],
    };
  },
  created() {
    this.getList();
    this.getShowroomList();
  },
  methods: {
    /** 查询VR展区列表 */
    getList() {
      this.loading = true;
      listExhibitZone(this.queryParams).then((response) => {
        this.exhibitZoneList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        exhibitZoneId: null,
        exhibitZoneName: null,
        description: null,
        showroomId: null,
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.exhibitZoneId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加VR展区";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const exhibitZoneId = row.exhibitZoneId || this.ids;
      getExhibitZone(exhibitZoneId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改VR展区";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.exhibitZoneId != null) {
            updateExhibitZone(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addExhibitZone(this.form).then((response) => {
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
      const exhibitZoneIds = row.exhibitZoneId || this.ids;
      this.$modal
        .confirm('是否确认删除VR展区编号为"' + exhibitZoneIds + '"的数据项？')
        .then(function () {
          return delExhibitZone(exhibitZoneIds);
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
        "vr/exhibitZone/export",
        {
          ...this.queryParams,
        },
        `exhibitZone_${new Date().getTime()}.xlsx`
      );
    },
    /** 获取展厅列表 */
    getShowroomList() {
      listShowroom(this.allQueryParams).then((response) => {
        this.showroomList = response.rows;
      });
    },
    /** 获取展厅名称 */
    getShowroomName(showroomId) {
      const showroom = this.showroomList.find(
        (item) => item.showroomId == showroomId
      );
      return showroom ? showroom.showroomName : "";
    },
  },
};
</script>
