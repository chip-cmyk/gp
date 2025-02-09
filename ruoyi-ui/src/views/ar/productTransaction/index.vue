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
      <el-form-item label="出入库" prop="transactionType">
        <el-select
          v-model="queryParams.transactionType"
          placeholder="请选择出入库"
          clearable
        >
          <el-option
            v-for="dict in dict.type.transaction_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="经办人" prop="operatorName">
        <el-input
          v-model="queryParams.operatorName"
          placeholder="请输入经办人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="库区管理员" prop="warehouseAdminName">
        <el-input
          v-model="queryParams.warehouseAdminName"
          placeholder="请输入库区管理员"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['ar:productTransaction:add']"
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
          v-hasPermi="['ar:productTransaction:edit']"
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
          v-hasPermi="['ar:productTransaction:remove']"
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
          v-hasPermi="['ar:productTransaction:export']"
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
      :data="productTransactionList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="单号" align="center" prop="transactionId" />
      <el-table-column label="出入库" align="center" prop="transactionType">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.transaction_type"
            :value="scope.row.transactionType"
          />
        </template>
      </el-table-column>
      <el-table-column label="经办人" align="center" prop="operatorName" />
      <el-table-column
        label="库区管理员"
        align="center"
        prop="warehouseAdminName"
      />
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
            v-hasPermi="['ar:productTransaction:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:productTransaction:remove']"
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

    <!-- 添加或修改产品出入库单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="出入库" prop="transactionType">
          <el-select v-model="form.transactionType" placeholder="请选择出入库">
            <el-option
              v-for="dict in dict.type.transaction_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="经办人" prop="operatorName">
          <el-input v-model="form.operatorName" placeholder="请输入经办人" />
        </el-form-item>
        <el-form-item label="库区管理员" prop="warehouseAdminName">
          <el-input
            v-model="form.warehouseAdminName"
            placeholder="请输入库区管理员"
          />
        </el-form-item>
        <el-divider content-position="center">产品清单明细信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              icon="el-icon-plus"
              size="mini"
              @click="handleAddProductTransactionDetail"
              >添加</el-button
            >
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              @click="handleDeleteProductTransactionDetail"
              >删除</el-button
            >
          </el-col>
        </el-row>
        <el-table
          :data="productTransactionDetailList"
          :row-class-name="rowProductTransactionDetailIndex"
          @selection-change="handleProductTransactionDetailSelectionChange"
          ref="productTransactionDetail"
          class="transactionDetailTable"
        >
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column
            label="序号"
            align="center"
            prop="index"
            width="50"
          />
          <el-table-column label="产品名称" prop="productId" width="150">
            <template slot-scope="scope">
              <div
                v-if="
                  productTransactionDetailList[scope.$index].errors.productId
                "
                class="error-msg"
              >
                {{
                  productTransactionDetailList[scope.$index].errors.productId
                }}
              </div>
              <el-select
                v-model="scope.row.productId"
                placeholder="请选择产品名称"
                filterable
                clearable
                allow-create
                @change="validateProductId(scope.$index)"
              >
                <el-option
                  v-for="item in productList"
                  :key="item.productId"
                  :label="item.productName"
                  :value="item.productId"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity" width="150">
            <template slot-scope="scope">
              <div
                v-if="
                  productTransactionDetailList[scope.$index].errors.quantity
                "
                class="error-msg"
              >
                {{ productTransactionDetailList[scope.$index].errors.quantity }}
              </div>
              <el-input
                v-model="scope.row.quantity"
                placeholder="请输入数量"
                @blur="validateQuantity(scope.$index)"
              />
            </template>
          </el-table-column>
          <el-table-column label="日期" prop="transactionDate" width="240">
            <template slot-scope="scope">
              <div
                v-if="
                  productTransactionDetailList[scope.$index].errors
                    .transactionDate
                "
                class="error-msg"
              >
                {{
                  productTransactionDetailList[scope.$index].errors
                    .transactionDate
                }}
              </div>
              <el-date-picker
                clearable
                v-model="scope.row.transactionDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择日期"
                @blur="validateTransactionDate(scope.$index)"
              />
            </template>
          </el-table-column>
        </el-table>
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
  listProductTransaction,
  getProductTransaction,
  delProductTransaction,
  addProductTransaction,
  updateProductTransaction,
} from "@/api/ar/productTransaction";
import { listProduct } from "@/api/ar/product";

export default {
  name: "ProductTransaction",
  dicts: ["transaction_type"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedProductTransactionDetail: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 产品出入库单表格数据
      productTransactionList: [],
      // 产品清单明细表格数据
      productTransactionDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        transactionType: null,
        operatorName: null,
        warehouseAdminName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        transactionType: [
          { required: true, message: "出入库不能为空", trigger: "change" },
        ],
        operatorName: [
          { required: true, message: "经办人不能为空", trigger: "blur" },
        ],
        warehouseAdminName: [
          { required: true, message: "库区管理员不能为空", trigger: "blur" },
        ],
      },
      // 产品列表
      productList: [],
    };
  },
  created() {
    this.getList();
    this.getProductList();
    // 初始化productTransactionDetailList的数据，添加errors对象
    this.productTransactionDetailList = this.productTransactionDetailList.map(
      (item) => ({
        ...item,
        errors: {
          productId: "",
          quantity: "",
          transactionDate: "",
        },
      })
    );
  },
  methods: {
    /** 查询产品出入库单列表 */
    getList() {
      this.loading = true;
      listProductTransaction(this.queryParams).then((response) => {
        this.productTransactionList = response.rows;
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
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        transactionId: null,
        transactionType: null,
        operatorName: null,
        warehouseAdminName: null,
      };
      this.productTransactionDetailList = [];
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
      this.ids = selection.map((item) => item.transactionId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加产品出入库单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const transactionId = row.transactionId || this.ids;
      getProductTransaction(transactionId).then((response) => {
        this.form = response.data;
        // 填充明细表格数据
        this.productTransactionDetailList =
          response.data.productTransactionDetailList.map((item) => ({
            ...item,
            errors: {
              productId: "",
              quantity: "",
              transactionDate: "",
            },
          }));
        this.open = true;
        this.title = "修改产品出入库单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          let hasError = false;
          // 遍历所有行的数据，检查是否存在错误信息
          this.productTransactionDetailList.forEach((row, index) => {
            this.validateProductId(index);
            this.validateQuantity(index);
            this.validateTransactionDate(index);
            if (
              row.errors.productId ||
              row.errors.quantity ||
              row.errors.transactionDate
            ) {
              hasError = true;
            }
          });
          if (hasError) {
            return;
          }
          this.form.productTransactionDetailList =
            this.productTransactionDetailList;
          if (this.form.transactionId != null) {
            updateProductTransaction(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProductTransaction(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    // 校验产品名称
    validateProductId(index) {
      const row = this.productTransactionDetailList[index];
      if (!row.productId) {
        row.errors.productId = "产品名称不能为空";
      } else {
        row.errors.productId = "";
      }
    },
    // 校验数量
    validateQuantity(index) {
      const row = this.productTransactionDetailList[index];
      if (!row.quantity) {
        row.errors.quantity = "数量不能为空";
      } else if (isNaN(row.quantity) || parseInt(row.quantity) <= 0) {
        row.errors.quantity = "数量必须为正整数";
      } else {
        row.errors.quantity = "";
      }
    },
    // 校验日期
    validateTransactionDate(index) {
      const row = this.productTransactionDetailList[index];
      if (!row.transactionDate) {
        row.errors.transactionDate = "日期不能为空";
      } else {
        row.errors.transactionDate = "";
      }
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const transactionIds = row.transactionId || this.ids;
      this.$modal
        .confirm(
          '是否确认删除产品出入库单编号为"' + transactionIds + '"的数据项？'
        )
        .then(function () {
          return delProductTransaction(transactionIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 产品清单明细序号 */
    rowProductTransactionDetailIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 产品清单明细添加按钮操作 */
    handleAddProductTransactionDetail() {
      let obj = {
        productId: "",
        quantity: "",
        transactionDate: "",
        errors: {
          productId: "",
          quantity: "",
          transactionDate: "",
        },
      };
      this.productTransactionDetailList.push(obj);
    },
    /** 产品清单明细删除按钮操作 */
    handleDeleteProductTransactionDetail() {
      if (this.checkedProductTransactionDetail.length == 0) {
        this.$modal.msgError("请先选择要删除的产品清单明细数据");
      } else {
        const productTransactionDetailList = this.productTransactionDetailList;
        const checkedProductTransactionDetail =
          this.checkedProductTransactionDetail;
        this.productTransactionDetailList = productTransactionDetailList.filter(
          function (item) {
            return checkedProductTransactionDetail.indexOf(item.index) == -1;
          }
        );
      }
    },
    /** 复选框选中数据 */
    handleProductTransactionDetailSelectionChange(selection) {
      this.checkedProductTransactionDetail = selection.map(
        (item) => item.index
      );
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "ar/productTransaction/export",
        {
          ...this.queryParams,
        },
        `productTransaction_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>

<style scoped>
.error-msg {
  position: absolute;
  bottom: 4px;
  color: #f56c6c;
  line-height: 1;
  font-size: 6px;
}
.transactionDetailTable ::v-deep .el-table__cell {
  padding: 20px 0;
}

/* 选择 .error-msg 前面同一层级的 .el-input__inner */
::v-deep .error-msg ~ .el-select .el-input .el-input__inner,
::v-deep .error-msg ~ .el-input .el-input__inner {
  border-color: #f56c6c;
}
</style>
