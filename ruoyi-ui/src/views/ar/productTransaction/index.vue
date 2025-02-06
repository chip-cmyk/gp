<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="出入库" prop="transactionType">
        <el-select v-model="queryParams.transactionType" placeholder="请选择出入库" clearable>
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
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
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
        >新增</el-button>
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
        >修改</el-button>
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
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ar:productTransaction:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="productTransactionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="单号" align="center" prop="transactionId" />
      <el-table-column label="出入库" align="center" prop="transactionType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.transaction_type" :value="scope.row.transactionType"/>
        </template>
      </el-table-column>
      <el-table-column label="经办人" align="center" prop="operatorName" />
      <el-table-column label="库区管理员" align="center" prop="warehouseAdminName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ar:productTransaction:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:productTransaction:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
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
          <el-input v-model="form.warehouseAdminName" placeholder="请输入库区管理员" />
        </el-form-item>
        <el-divider content-position="center">产品清单明细信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddProductTransactionDetail">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteProductTransactionDetail">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="productTransactionDetailList" :row-class-name="rowProductTransactionDetailIndex" @selection-change="handleProductTransactionDetailSelectionChange" ref="productTransactionDetail">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="产品编号" prop="productId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productId" placeholder="请输入产品编号" />
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.quantity" placeholder="请输入数量" />
            </template>
          </el-table-column>
          <el-table-column label="日期" prop="transactionDate" width="240">
            <template slot-scope="scope">
              <el-date-picker clearable v-model="scope.row.transactionDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择日期" />
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
import { listProductTransaction, getProductTransaction, delProductTransaction, addProductTransaction, updateProductTransaction } from "@/api/ar/productTransaction";

export default {
  name: "ProductTransaction",
  dicts: ['transaction_type'],
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
        warehouseAdminName: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        transactionType: [
          { required: true, message: "出入库不能为空", trigger: "change" }
        ],
        operatorName: [
          { required: true, message: "经办人不能为空", trigger: "blur" }
        ],
        warehouseAdminName: [
          { required: true, message: "库区管理员不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询产品出入库单列表 */
    getList() {
      this.loading = true;
      listProductTransaction(this.queryParams).then(response => {
        this.productTransactionList = response.rows;
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
        transactionId: null,
        transactionType: null,
        operatorName: null,
        warehouseAdminName: null
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
      this.ids = selection.map(item => item.transactionId)
      this.single = selection.length!==1
      this.multiple = !selection.length
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
      const transactionId = row.transactionId || this.ids
      getProductTransaction(transactionId).then(response => {
        this.form = response.data;
        this.productTransactionDetailList = response.data.productTransactionDetailList;
        this.open = true;
        this.title = "修改产品出入库单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.productTransactionDetailList = this.productTransactionDetailList;
          if (this.form.transactionId != null) {
            updateProductTransaction(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProductTransaction(this.form).then(response => {
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
      const transactionIds = row.transactionId || this.ids;
      this.$modal.confirm('是否确认删除产品出入库单编号为"' + transactionIds + '"的数据项？').then(function() {
        return delProductTransaction(transactionIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 产品清单明细序号 */
    rowProductTransactionDetailIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 产品清单明细添加按钮操作 */
    handleAddProductTransactionDetail() {
      let obj = {};
      obj.productId = "";
      obj.quantity = "";
      obj.transactionDate = "";
      this.productTransactionDetailList.push(obj);
    },
    /** 产品清单明细删除按钮操作 */
    handleDeleteProductTransactionDetail() {
      if (this.checkedProductTransactionDetail.length == 0) {
        this.$modal.msgError("请先选择要删除的产品清单明细数据");
      } else {
        const productTransactionDetailList = this.productTransactionDetailList;
        const checkedProductTransactionDetail = this.checkedProductTransactionDetail;
        this.productTransactionDetailList = productTransactionDetailList.filter(function(item) {
          return checkedProductTransactionDetail.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleProductTransactionDetailSelectionChange(selection) {
      this.checkedProductTransactionDetail = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ar/productTransaction/export', {
        ...this.queryParams
      }, `productTransaction_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
