<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="二维码名称" prop="qrCodeName">
        <el-input
          v-model="queryParams.qrCodeName"
          placeholder="请输入二维码名称"
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
          v-hasPermi="['ar:sandAssociation:add']"
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
          v-hasPermi="['ar:sandAssociation:edit']"
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
          v-hasPermi="['ar:sandAssociation:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ar:sandAssociation:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sandAssociationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="二维码编号" align="center" prop="qrCodeId" />
      <el-table-column label="二维码名称" align="center" prop="qrCodeName" />
      <el-table-column label="二维码" align="center" prop="qrCode" />
      <el-table-column label="使用情况" align="center" prop="usageStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ar:sandAssociation:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:sandAssociation:remove']"
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

    <!-- 添加或修改二维码_沙盘分区关联对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="二维码名称" prop="qrCodeName">
          <el-input v-model="form.qrCodeName" placeholder="请输入二维码名称" />
        </el-form-item>
        <el-form-item label="二维码" prop="qrCode">
          <el-input v-model="form.qrCode" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-divider content-position="center">沙盘分区信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddSandboxZone">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteSandboxZone">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="sandboxZoneList" :row-class-name="rowSandboxZoneIndex" @selection-change="handleSandboxZoneSelectionChange" ref="sandboxZone">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="名称" prop="name" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.name" placeholder="请输入名称" />
            </template>
          </el-table-column>
          <el-table-column label="工厂编号" prop="factoryId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.factoryId" placeholder="请输入工厂编号" />
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
import { listSandAssociation, getSandAssociation, delSandAssociation, addSandAssociation, updateSandAssociation } from "@/api/ar/sandAssociation";

export default {
  name: "SandAssociation",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedSandboxZone: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 二维码_沙盘分区关联表格数据
      sandAssociationList: [],
      // 沙盘分区表格数据
      sandboxZoneList: [],
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
        usageStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        qrCodeName: [
          { required: true, message: "二维码名称不能为空", trigger: "blur" }
        ],
        qrCode: [
          { required: true, message: "二维码不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询二维码_沙盘分区关联列表 */
    getList() {
      this.loading = true;
      listSandAssociation(this.queryParams).then(response => {
        this.sandAssociationList = response.rows;
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
        usageStatus: null
      };
      this.sandboxZoneList = [];
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
      this.ids = selection.map(item => item.qrCodeId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加二维码_沙盘分区关联";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const qrCodeId = row.qrCodeId || this.ids
      getSandAssociation(qrCodeId).then(response => {
        this.form = response.data;
        this.sandboxZoneList = response.data.sandboxZoneList;
        this.open = true;
        this.title = "修改二维码_沙盘分区关联";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.sandboxZoneList = this.sandboxZoneList;
          if (this.form.qrCodeId != null) {
            updateSandAssociation(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSandAssociation(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除二维码_沙盘分区关联编号为"' + qrCodeIds + '"的数据项？').then(function() {
        return delSandAssociation(qrCodeIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 沙盘分区序号 */
    rowSandboxZoneIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 沙盘分区添加按钮操作 */
    handleAddSandboxZone() {
      let obj = {};
      obj.name = "";
      obj.description = "";
      obj.factoryId = "";
      this.sandboxZoneList.push(obj);
    },
    /** 沙盘分区删除按钮操作 */
    handleDeleteSandboxZone() {
      if (this.checkedSandboxZone.length == 0) {
        this.$modal.msgError("请先选择要删除的沙盘分区数据");
      } else {
        const sandboxZoneList = this.sandboxZoneList;
        const checkedSandboxZone = this.checkedSandboxZone;
        this.sandboxZoneList = sandboxZoneList.filter(function(item) {
          return checkedSandboxZone.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleSandboxZoneSelectionChange(selection) {
      this.checkedSandboxZone = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ar/sandAssociation/export', {
        ...this.queryParams
      }, `sandAssociation_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
