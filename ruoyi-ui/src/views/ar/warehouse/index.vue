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
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['ar:warehouse:add']"
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
          v-hasPermi="['ar:warehouse:edit']"
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
          v-hasPermi="['ar:warehouse:remove']"
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
          v-hasPermi="['ar:warehouse:export']"
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
      :data="warehouseList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="库区编号" align="center" prop="zoneId" />
      <el-table-column label="名称" align="center" prop="name" />
      <el-table-column label="简介" align="center" prop="description" />
      <el-table-column label="工厂名称" align="center" prop="factoryId">
        <template slot-scope="scope">
          <span>{{ getFactoryName(scope.row.factoryId) }}</span>
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
            v-hasPermi="['ar:warehouse:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:warehouse:remove']"
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

    <!-- 添加或修改库区对话框 -->
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
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="简介" prop="description">
          <el-input
            v-model="form.description"
            type="textarea"
            placeholder="请输入内容"
          />
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
  listWarehouse,
  getWarehouse,
  delWarehouse,
  addWarehouse,
  updateWarehouse,
} from "@/api/ar/warehouse";
import { listFactory } from "@/api/ar/factory";

export default {
  name: "Warehouse",
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
      // 库区表格数据
      warehouseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        description: null,
        factoryId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [{ required: true, message: "名称不能为空", trigger: "blur" }],
        description: [
          { required: true, message: "简介不能为空", trigger: "blur" },
        ],
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
    /** 查询库区列表 */
    getList() {
      this.loading = true;
      listWarehouse(this.queryParams).then((response) => {
        this.warehouseList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 获取工厂列表
    getFactoryList() {
      listFactory(this.allQueryParams).then((response) => {
        this.factoryList = response.rows;
      });
    },
    // 根据工厂编号回显对应的工厂名称
    getFactoryName(factoryId) {
      const factory = this.factoryList.find(
        (item) => item.factoryId == factoryId
      );
      return factory ? factory.name : "";
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        zoneId: null,
        name: null,
        description: null,
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
      this.ids = selection.map((item) => item.zoneId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加库区";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const zoneId = row.zoneId || this.ids;
      getWarehouse(zoneId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改库区";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.zoneId != null) {
            updateWarehouse(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addWarehouse(this.form).then((response) => {
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
      const zoneIds = row.zoneId || this.ids;
      this.$modal
        .confirm('是否确认删除库区编号为"' + zoneIds + '"的数据项？')
        .then(function () {
          return delWarehouse(zoneIds);
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
        "ar/warehouse/export",
        {
          ...this.queryParams,
        },
        `warehouse_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
