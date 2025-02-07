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
      <el-form-item label="素材名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入素材名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="场景名称" prop="sceneId">
        <el-select
          v-model="queryParams.sceneId"
          placeholder="请选择场景名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in sceneList"
            :key="item.sceneId"
            :label="item.sceneName"
            :value="item.sceneId"
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
          v-hasPermi="['school:material:add']"
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
          v-hasPermi="['school:material:edit']"
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
          v-hasPermi="['school:material:remove']"
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
          v-hasPermi="['school:material:export']"
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
      :data="materialList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="VR素材编号" align="center" prop="vrMaterialId" />
      <el-table-column label="素材名称" align="center" prop="name" />
      <el-table-column label="类别" align="center" prop="category" />
      <el-table-column label="文件URL" align="center" prop="fileUrl" />
      <el-table-column label="简介" align="center" prop="description" />
      <el-table-column label="场景名称" align="center" prop="sceneId">
        <template slot-scope="scope">
          <span>{{ getSceneName(scope.row.sceneId) }}</span>
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
            v-hasPermi="['school:material:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['school:material:remove']"
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

    <!-- 添加或修改VR素材对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="场景名称" prop="sceneId">
          <el-select
            v-model="form.sceneId"
            placeholder="请选择场景名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in sceneList"
              :key="item.sceneId"
              :label="item.sceneName"
              :value="item.sceneId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="素材名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入素材名称" />
        </el-form-item>
        <el-form-item label="类别" prop="category">
        <el-input
          v-model="queryParams.category"
          placeholder="请输入类别"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
        <el-form-item label="文件URL" prop="fileUrl">
          <el-input
            v-model="form.fileUrl"
            type="textarea"
            placeholder="请输入内容"
          />
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
  listMaterial,
  getMaterial,
  delMaterial,
  addMaterial,
  updateMaterial,
} from "@/api/school/material";
import { listScene } from "@/api/school/scene";

export default {
  name: "Material",
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
      // VR素材表格数据
      materialList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        category: null,
        fileUrl: null,
        description: null,
        sceneId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "素材名称不能为空", trigger: "blur" },
        ],
        category: [
          { required: true, message: "类别不能为空", trigger: "blur" },
        ],
        description: [
          { required: true, message: "简介不能为空", trigger: "blur" },
        ],
        fileUrl: [
          { required: true, message: "文件URL不能为空", trigger: "blur" },
        ],
        sceneId: [
          { required: true, message: "场景名称不能为空", trigger: "blur" },
        ],
      },
      // 场景列表数据
      sceneList: [],
    };
  },
  created() {
    this.getList();
    this.getSceneList();
  },
  methods: {
    /** 查询VR素材列表 */
    getList() {
      this.loading = true;
      listMaterial(this.queryParams).then((response) => {
        this.materialList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 获取场景列表
    getSceneList() {
      listScene(this.allQueryParams).then((response) => {
        this.sceneList = response.rows;
      });
    },
    // 根据场景编号回显对应的场景名称
    getSceneName(sceneId) {
      const scene = this.sceneList.find((item) => item.sceneId == sceneId);
      return scene ? scene.sceneName : "";
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        vrMaterialId: null,
        name: null,
        category: null,
        fileUrl: null,
        description: null,
        sceneId: null,
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
      this.ids = selection.map((item) => item.vrMaterialId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加VR素材";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const vrMaterialId = row.vrMaterialId || this.ids;
      getMaterial(vrMaterialId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改VR素材";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.vrMaterialId != null) {
            updateMaterial(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMaterial(this.form).then((response) => {
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
      const vrMaterialIds = row.vrMaterialId || this.ids;
      this.$modal
        .confirm('是否确认删除VR素材编号为"' + vrMaterialIds + '"的数据项？')
        .then(function () {
          return delMaterial(vrMaterialIds);
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
        "school/material/export",
        {
          ...this.queryParams,
        },
        `material_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
