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
      <el-form-item label="能耗" prop="energyConsumed">
        <el-input
          v-model="queryParams.energyConsumed"
          placeholder="请输入能耗"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="计量单位" prop="unit">
        <el-input
          v-model="queryParams.unit"
          placeholder="请输入计量单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="类型" prop="type">
        <el-select
          v-model="queryParams.type"
          placeholder="请选择类型"
          clearable
        >
          <el-option
            v-for="dict in dict.type.ar_energy_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="年度" prop="year">
        <el-date-picker
          clearable
          v-model="queryParams.year"
          type="year"
          format="yyyy年"
          value-format="yyyy"
          placeholder="请选择年度"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="月份" prop="month">
        <el-date-picker
          popper-class="due_month"
          clearable
          v-model="queryParams.month"
          type="month"
          format="M月"
          value-format="M"
          placeholder="请选择月份"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="工厂名称" prop="factoryId">
        <el-select
          v-model="queryParams.factoryId"
          placeholder="请选择工厂名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in factoryList"
            :key="item.factoryId"
            :label="item.name"
            :value="item.factoryId"
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
          v-hasPermi="['ar:consumption:add']"
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
          v-hasPermi="['ar:consumption:edit']"
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
          v-hasPermi="['ar:consumption:remove']"
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
          v-hasPermi="['ar:consumption:export']"
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
      :data="consumptionList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="能耗" align="center" prop="energyConsumed" />
      <el-table-column label="计量单位" align="center" prop="unit" />
      <el-table-column label="类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.ar_energy_type"
            :value="scope.row.type"
          />
        </template>
      </el-table-column>
      <el-table-column label="年度" align="center" prop="year" width="180">
        <template slot-scope="scope"> {{ scope.row.year }}年 </template>
      </el-table-column>
      <el-table-column label="月份" align="center" prop="month" width="180">
        <template slot-scope="scope"> {{ scope.row.month }}月 </template>
      </el-table-column>
      <el-table-column label="工厂名称" align="center" prop="factoryId">
        <template slot-scope="scope">
          {{ getFactoryName(scope.row.factoryId) }}
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
            v-hasPermi="['ar:consumption:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:consumption:remove']"
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

    <!-- 添加或修改能耗清单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="工厂名称" prop="factoryId">
          <el-select
            v-model="form.factoryId"
            placeholder="请选择工厂名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in factoryList"
              :key="item.factoryId"
              :label="item.name"
              :value="item.factoryId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="能耗" prop="energyConsumed">
          <el-input v-model="form.energyConsumed" placeholder="请输入能耗" />
        </el-form-item>
        <el-form-item label="计量单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入计量单位" />
        </el-form-item>
        <el-form-item label="类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择类型">
            <el-option
              v-for="dict in dict.type.ar_energy_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="年度" prop="year">
          <el-date-picker
            clearable
            v-model="form.year"
            type="year"
            format="yyyy年"
            value-format="yyyy"
            placeholder="请选择年度"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="月份" prop="month">
          <el-date-picker
            popper-class="due_month"
            clearable
            v-model="form.month"
            type="month"
            format="M月"
            value-format="M"
            placeholder="请选择月份"
          >
          </el-date-picker>
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
  listConsumption,
  getConsumption,
  delConsumption,
  addConsumption,
  updateConsumption,
} from "@/api/ar/consumption";
import { listFactory } from "@/api/ar/factory";

export default {
  name: "Consumption",
  dicts: ["ar_energy_type"],
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
      // 能耗清单表格数据
      consumptionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        energyConsumed: null,
        unit: null,
        type: null,
        year: null,
        month: null,
        factoryId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        energyConsumed: [
          { required: true, message: "能耗不能为空", trigger: "blur" },
        ],
        unit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" },
        ],
        type: [{ required: true, message: "类型不能为空", trigger: "change" }],
        year: [{ required: true, message: "年度不能为空", trigger: "blur" }],
        month: [{ required: true, message: "月份不能为空", trigger: "blur" }],
        factoryId: [
          { required: true, message: "工厂名称不能为空", trigger: "blur" },
        ],
      },
      // 工厂列表
      factoryList: [],
    };
  },
  created() {
    this.getList();
    this.getFactoryList();
  },
  methods: {
    /** 查询能耗清单列表 */
    getList() {
      this.loading = true;
      listConsumption(this.queryParams).then((response) => {
        this.consumptionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询工厂列表 */
    getFactoryList() {
      listFactory(this.allQueryParams).then((response) => {
        this.factoryList = response.rows;
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
        id: null,
        energyConsumed: null,
        unit: null,
        type: null,
        year: null,
        month: null,
        factoryId: null,
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
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加能耗清单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getConsumption(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改能耗清单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateConsumption(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addConsumption(this.form).then((response) => {
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
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除能耗清单编号为"' + ids + '"的数据项？')
        .then(function () {
          return delConsumption(ids);
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
        "ar/consumption/export",
        {
          ...this.queryParams,
        },
        `consumption_${new Date().getTime()}.xlsx`
      );
    },
    /** 获取工厂名称 */
    getFactoryName(factoryId) {
      const factory = this.factoryList.find(
        (item) => item.factoryId == factoryId
      );
      return factory ? factory.name : "";
    },
  },
};
</script>

<style lang="scss">
.due_month .el-date-picker__header {
  display: none;
}
</style>
