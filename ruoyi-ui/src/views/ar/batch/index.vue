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
      <el-form-item label="数量" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入数量"
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
      <el-form-item label="生产日期" prop="productionDate">
        <el-date-picker
          clearable
          v-model="queryParams.productionDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择生产日期"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="保质期" prop="shelfLife">
        <el-input
          v-model="queryParams.shelfLife"
          placeholder="请输入保质期"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="产品名称" prop="productId">
        <el-select
          v-model="queryParams.productId"
          placeholder="请选择产品名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in productList"
            :key="item.productId"
            :label="item.productName"
            :value="item.productId"
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
          v-hasPermi="['ar:batch:add']"
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
          v-hasPermi="['ar:batch:edit']"
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
          v-hasPermi="['ar:batch:remove']"
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
          v-hasPermi="['ar:batch:export']"
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
      :data="batchList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="批号" align="center" prop="batchId" />
      <el-table-column label="产品名称" align="center" prop="productId">
        <template slot-scope="scope">
          <span>{{ getProductName(scope.row.productId) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="数量" align="center" prop="quantity" />
      <el-table-column label="计量单位" align="center" prop="unit" />
      <el-table-column
        label="生产日期"
        align="center"
        prop="productionDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.productionDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="保质期" align="center" prop="shelfLife" />
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
            v-hasPermi="['ar:batch:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:batch:remove']"
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

    <!-- 添加或修改生产批次对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="产品名称" prop="productId">
          <el-select
            v-model="form.productId"
            placeholder="请选择产品名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in productList"
              :key="item.productId"
              :label="item.productName"
              :value="item.productId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="数量" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="计量单位" prop="unit">
          <el-input v-model="form.unit" placeholder="请输入计量单位" />
        </el-form-item>
        <el-form-item label="生产日期" prop="productionDate">
          <el-date-picker
            clearable
            v-model="form.productionDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择生产日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="保质期" prop="shelfLife">
          <el-input v-model="form.shelfLife" placeholder="请输入保质期" />
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
  listBatch,
  getBatch,
  delBatch,
  addBatch,
  updateBatch,
} from "@/api/ar/batch";
import { listProduct } from "@/api/ar/product";

export default {
  name: "Batch",
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
      // 生产批次表格数据
      batchList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        quantity: null,
        unit: null,
        productionDate: null,
        shelfLife: null,
        productId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        quantity: [
          { required: true, message: "数量不能为空", trigger: "blur" },
        ],
        unit: [
          { required: true, message: "计量单位不能为空", trigger: "blur" },
        ],
        productionDate: [
          { required: true, message: "生产日期不能为空", trigger: "blur" },
        ],
        shelfLife: [
          { required: true, message: "保质期不能为空", trigger: "blur" },
        ],
        productId: [
          { required: true, message: "产品名称不能为空", trigger: "blur" },
        ],
      },
      // 产品列表
      productList: [],
    };
  },
  created() {
    this.getList();
    this.getProductList();
  },
  methods: {
    /** 查询生产批次列表 */
    getList() {
      this.loading = true;
      listBatch(this.queryParams).then((response) => {
        this.batchList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 获取产品列表
    getProductList() {
      listProduct(this.allQueryParams).then((response) => {
        this.productList = response.rows;
      });
    },
    // 根据产品编号回显对应的产品名称
    getProductName(productId) {
      const product = this.productList.find(
        (item) => item.productId == productId
      );
      return product ? product.productName : "";
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        batchId: null,
        quantity: null,
        unit: null,
        productionDate: null,
        shelfLife: null,
        productId: null,
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
      this.ids = selection.map((item) => item.batchId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加生产批次";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const batchId = row.batchId || this.ids;
      getBatch(batchId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改生产批次";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.batchId != null) {
            updateBatch(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addBatch(this.form).then((response) => {
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
      const batchIds = row.batchId || this.ids;
      this.$modal
        .confirm('是否确认删除生产批次编号为"' + batchIds + '"的数据项？')
        .then(function () {
          return delBatch(batchIds);
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
        "ar/batch/export",
        {
          ...this.queryParams,
        },
        `batch_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
