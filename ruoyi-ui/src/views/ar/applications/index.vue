<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="名称" prop="Name">
        <el-input
          v-model="queryParams.Name"
          placeholder="请输入名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本号" prop="Version">
        <el-input
          v-model="queryParams.Version"
          placeholder="请输入版本号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发布时间" prop="ReleaseDate">
        <el-date-picker clearable
          v-model="queryParams.ReleaseDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择发布时间">
        </el-date-picker>
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
          v-hasPermi="['ar:applications:add']"
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
          v-hasPermi="['ar:applications:edit']"
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
          v-hasPermi="['ar:applications:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ar:applications:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="applicationsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="应用ID" align="center" prop="ApplicationID" />
      <el-table-column label="名称" align="center" prop="Name" />
      <el-table-column label="功能简介" align="center" prop="Description" />
      <el-table-column label="版本号" align="center" prop="Version" />
      <el-table-column label="发布时间" align="center" prop="ReleaseDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.ReleaseDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ar:applications:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:applications:remove']"
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

    <!-- 添加或修改AR应用对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="名称" prop="Name">
          <el-input v-model="form.Name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="功能简介" prop="Description">
          <el-input v-model="form.Description" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="版本号" prop="Version">
          <el-input v-model="form.Version" placeholder="请输入版本号" />
        </el-form-item>
        <el-form-item label="发布时间" prop="ReleaseDate">
          <el-date-picker clearable
            v-model="form.ReleaseDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择发布时间">
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
import { listApplications, getApplications, delApplications, addApplications, updateApplications } from "@/api/ar/applications";

export default {
  name: "Applications",
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
      // AR应用表格数据
      applicationsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        Name: null,
        Description: null,
        Version: null,
        ReleaseDate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        Name: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
        Description: [
          { required: true, message: "功能简介不能为空", trigger: "blur" }
        ],
        Version: [
          { required: true, message: "版本号不能为空", trigger: "blur" }
        ],
        ReleaseDate: [
          { required: true, message: "发布时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询AR应用列表 */
    getList() {
      this.loading = true;
      listApplications(this.queryParams).then(response => {
        this.applicationsList = response.rows;
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
        ApplicationID: null,
        Name: null,
        Description: null,
        Version: null,
        ReleaseDate: null
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
      this.ids = selection.map(item => item.ApplicationID)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加AR应用";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const ApplicationID = row.ApplicationID || this.ids
      getApplications(ApplicationID).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改AR应用";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.ApplicationID != null) {
            updateApplications(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addApplications(this.form).then(response => {
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
      const ApplicationIDs = row.ApplicationID || this.ids;
      this.$modal.confirm('是否确认删除AR应用编号为"' + ApplicationIDs + '"的数据项？').then(function() {
        return delApplications(ApplicationIDs);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ar/applications/export', {
        ...this.queryParams
      }, `applications_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
