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
      <el-form-item label="二维码名称" prop="qrCodeName">
        <el-input
          v-model="queryParams.qrCodeName"
          placeholder="请输入二维码名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="使用情况" prop="usageStatus">
        <el-select
          v-model="queryParams.usageStatus"
          placeholder="请选择使用情况"
          clearable
        >
          <el-option
            v-for="dict in dict.type.use_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
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
          v-hasPermi="['ar:code:add']"
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
          v-hasPermi="['ar:code:edit']"
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
          v-hasPermi="['ar:code:remove']"
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
          v-hasPermi="['ar:code:export']"
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
      :data="codeList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="二维码编号" align="center" prop="qrCodeId" />
      <el-table-column label="二维码名称" align="center" prop="qrCodeName" />
      <el-table-column
        label="二维码内容"
        align="center"
        prop="qrCode"
        width="100"
      >
        <template slot-scope="scope">
          <image-preview :src="scope.row.qrCode" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="使用情况" align="center" prop="usageStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.use_status"
            :value="scope.row.usageStatus"
          />
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
            v-hasPermi="['ar:code:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:code:remove']"
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

    <!-- 添加或修改二维码对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="二维码名称" prop="qrCodeName">
          <el-input v-model="form.qrCodeName" placeholder="请输入二维码名称" />
        </el-form-item>
        <el-form-item label="二维码内容" prop="qrCode">
          <image-upload v-model="form.qrCode" />
        </el-form-item>
        <!-- <el-form-item label="使用情况" prop="usageStatus"> -->
        <!-- <el-radio-group v-model="form.usageStatus"> -->
        <!-- <el-radio -->
        <!-- v-for="dict in dict.type.use_status" -->
        <!-- :key="dict.value" -->
        <!-- :label="dict.value" -->
        <!-- >{{dict.label}}</el-radio> -->
        <!-- </el-radio-group> -->
        <!-- </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCode, getCode, delCode, addCode, updateCode } from "@/api/ar/code";

export default {
  name: "Code",
  dicts: ["use_status"],
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
      // 二维码表格数据
      codeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        qrCodeName: null,
        qrCode: null,
        usageStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        qrCodeName: [
          { required: true, message: "二维码名称不能为空", trigger: "blur" },
        ],
        qrCode: [
          { required: true, message: "二维码内容不能为空", trigger: "blur" },
        ],
        // usageStatus: [
        //   { required: true, message: "使用情况不能为空", trigger: "change" }
        // ]
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询二维码列表 */
    getList() {
      this.loading = true;
      listCode(this.queryParams).then((response) => {
        this.codeList = response.rows;
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
        qrCodeId: null,
        qrCodeName: null,
        qrCode: null,
        usageStatus: null,
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
      this.ids = selection.map((item) => item.qrCodeId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加二维码";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const qrCodeId = row.qrCodeId || this.ids;
      getCode(qrCodeId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改二维码";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.qrCodeId != null) {
            updateCode(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCode(this.form).then((response) => {
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
      const qrCodeIds = row.qrCodeId || this.ids;
      this.$modal
        .confirm('是否确认删除二维码编号为"' + qrCodeIds + '"的数据项？')
        .then(function () {
          return delCode(qrCodeIds);
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
        "ar/code/export",
        {
          ...this.queryParams,
        },
        `code_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
