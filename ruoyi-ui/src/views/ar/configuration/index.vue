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
      <el-form-item label="触发方式" prop="triggerMethod">
        <el-select
          v-model="queryParams.triggerMethod"
          placeholder="请选择触发方式"
          clearable
        >
          <el-option
            v-for="item in triggerMethods"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="呈现方式" prop="displayMethod">
        <el-select
          v-model="queryParams.displayMethod"
          placeholder="请选择呈现方式"
          clearable
        >
          <el-option
            v-for="item in displayMethods"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="屏幕分辨率" prop="screenResolution">
        <el-select
          v-model="queryParams.screenResolution"
          placeholder="请选择屏幕分辨率"
          clearable
          filterable
          allow-create
        >
          <el-option
            v-for="item in screenResolutions"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="视频分辨率" prop="videoResolution">
        <el-select
          v-model="queryParams.videoResolution"
          placeholder="请选择视频分辨率"
          clearable
        >
          <el-option
            v-for="item in videoResolutions"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="隐私设置" prop="privacySettings">
        <el-select
          v-model="queryParams.privacySettings"
          placeholder="请选择隐私设置"
          clearable
        >
          <el-option
            v-for="item in privacySettings"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="应用ID" prop="appId">
        <el-input
          v-model="queryParams.appId"
          placeholder="请输入应用ID"
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
          v-hasPermi="['ar:configuration:add']"
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
          v-hasPermi="['ar:configuration:edit']"
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
          v-hasPermi="['ar:configuration:remove']"
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
          v-hasPermi="['ar:configuration:export']"
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
      :data="configurationList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="触发方式" align="center" prop="triggerMethod" />
      <el-table-column label="呈现方式" align="center" prop="displayMethod" />
      <el-table-column
        label="屏幕分辨率"
        align="center"
        prop="screenResolution"
      />
      <el-table-column
        label="视频分辨率"
        align="center"
        prop="videoResolution"
      />
      <el-table-column label="隐私设置" align="center" prop="privacySettings" />
      <el-table-column label="应用ID" align="center" prop="appId" />
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
            v-hasPermi="['ar:configuration:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:configuration:remove']"
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

    <!-- 添加或修改出厂配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="触发方式" prop="triggerMethod">
          <el-select v-model="form.triggerMethod" placeholder="请选择触发方式">
            <el-option
              v-for="item in triggerMethods"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="呈现方式" prop="displayMethod">
          <el-select v-model="form.displayMethod" placeholder="请选择呈现方式">
            <el-option
              v-for="item in displayMethods"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="屏幕分辨率" prop="screenResolution">
          <el-select
            v-model="form.screenResolution"
            placeholder="请选择屏幕分辨率"
            filterable
            allow-create
          >
            <el-option
              v-for="item in screenResolutions"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="视频分辨率" prop="videoResolution">
          <el-select
            v-model="form.videoResolution"
            placeholder="请选择视频分辨率"
          >
            <el-option
              v-for="item in videoResolutions"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="隐私设置" prop="privacySettings">
          <el-select
            v-model="form.privacySettings"
            placeholder="请选择隐私设置"
          >
            <el-option
              v-for="item in privacySettings"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="应用ID" prop="appId">
          <el-input v-model="form.appId" placeholder="请输入应用ID" />
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
  listConfiguration,
  getConfiguration,
  delConfiguration,
  addConfiguration,
  updateConfiguration,
} from "@/api/ar/configuration";

export default {
  name: "Configuration",
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
      // 出厂配置表格数据
      configurationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        triggerMethod: null,
        displayMethod: null,
        screenResolution: null,
        videoResolution: null,
        privacySettings: null,
        appId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        triggerMethod: [
          { required: true, message: "触发方式不能为空", trigger: "blur" },
        ],
        displayMethod: [
          { required: true, message: "呈现方式不能为空", trigger: "blur" },
        ],
        screenResolution: [
          { required: true, message: "屏幕分辨率不能为空", trigger: "blur" },
        ],
        videoResolution: [
          { required: true, message: "视频分辨率不能为空", trigger: "blur" },
        ],
        privacySettings: [
          { required: true, message: "隐私设置不能为空", trigger: "blur" },
        ],
        appId: [{ required: true, message: "应用ID不能为空", trigger: "blur" }],
      },
      // 选项数据
      triggerMethods: ["二维码扫描", "AI识别"],
      displayMethods: ["纯文本", "图文", "视频"],
      screenResolutions: ["2800x1840", "2560x1440", "1920x1080", "1280x720"],
      videoResolutions: ["480p", "720p", "1080p", "1440p", "2160p"],
      privacySettings: ["自动开启相机服务", "询问是否开启相机服务"],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询出厂配置列表 */
    getList() {
      this.loading = true;
      listConfiguration(this.queryParams).then((response) => {
        this.configurationList = response.rows;
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
        id: null,
        triggerMethod: null,
        displayMethod: null,
        screenResolution: null,
        videoResolution: null,
        privacySettings: null,
        appId: null,
        createdAt: null,
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
      this.title = "添加出厂配置";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getConfiguration(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改出厂配置";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateConfiguration(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addConfiguration(this.form).then((response) => {
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
        .confirm('是否确认删除出厂配置编号为"' + ids + '"的数据项？')
        .then(function () {
          return delConfiguration(ids);
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
        "ar/configuration/export",
        {
          ...this.queryParams,
        },
        `configuration_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
