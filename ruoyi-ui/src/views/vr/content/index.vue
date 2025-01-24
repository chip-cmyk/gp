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
      <el-form-item label="类别" prop="category">
        <el-select
          v-model="queryParams.category"
          placeholder="请选择类别"
          clearable
          filterable
          allow-create
        >
          <!-- <el-option -->
          <!-- v-for="dict in dict.type.vr_content_category" -->
          <!-- :key="dict.value" -->
          <!-- :label="dict.label" -->
          <!-- :value="dict.value" -->
          <!-- /> -->
          <el-option
            v-for="item in allCategoryList"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
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
      <el-form-item label="载体名称" prop="carrierId">
        <el-select
          v-model="queryParams.carrierId"
          placeholder="请选择载体名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in carrierList"
            :key="item.carrierId"
            :label="item.carrierName"
            :value="item.carrierId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="作品标题" prop="workId">
        <el-select
          v-model="queryParams.workId"
          placeholder="请选择作品标题"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in workList"
            :key="item.workId"
            :label="item.title"
            :value="item.workId"
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
          v-hasPermi="['vr:content:add']"
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
          v-hasPermi="['vr:content:edit']"
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
          v-hasPermi="['vr:content:remove']"
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
          v-hasPermi="['vr:content:export']"
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
      :data="contentList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="VR内容编号" align="center" prop="vrContentId" />
      <el-table-column label="名称" align="center" prop="name" />
      <el-table-column label="类别" align="center" prop="category">
        <!-- <template slot-scope="scope"> -->
        <!-- <dict-tag -->
        <!-- :options="dict.type.vr_content_category" -->
        <!-- :value="scope.row.category" -->
        <!-- /> -->
        <!-- </template> -->
      </el-table-column>
      <el-table-column label="文件URL" align="center" prop="fileUrl" />
      <el-table-column label="简介" align="center" prop="description" />
      <el-table-column label="使用情况" align="center" prop="usageStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.use_status"
            :value="scope.row.usageStatus"
          />
        </template>
      </el-table-column>
      <el-table-column label="载体名称" align="center" prop="carrierId">
        <template slot-scope="scope">
          <span>{{ getCarrierName(scope.row.carrierId) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="作品标题" align="center" prop="workId">
        <template slot-scope="scope">
          <span>{{ getWorkTitle(scope.row.workId) }}</span>
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
            v-hasPermi="['vr:content:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['vr:content:remove']"
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

    <!-- 添加或修改VR内容对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="类别" prop="category">
          <el-select
            v-model="form.category"
            placeholder="请选择类别"
            filterable
            clearable
            allow-create
          >
            <!-- <el-option -->
            <!-- v-for="dict in dict.type.vr_content_category" -->
            <!-- :key="dict.value" -->
            <!-- :label="dict.label" -->
            <!-- :value="dict.value" -->
            <!-- ></el-option> -->
            <el-option
              v-for="item in allCategoryList"
              :key="item"
              :label="item"
              :value="item"
            />
          </el-select>
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
        <el-form-item label="使用情况" prop="usageStatus">
          <el-radio-group v-model="form.usageStatus">
            <el-radio
              v-for="dict in dict.type.use_status"
              :key="dict.value"
              :label="dict.value"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
        <el-form-item label="载体名称" prop="carrierId">
          <el-select
            v-model="form.carrierId"
            placeholder="请选择载体名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in carrierList"
              :key="item.carrierId"
              :label="item.carrierName"
              :value="item.carrierId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="作品标题" prop="workId">
          <el-select
            v-model="form.workId"
            placeholder="请选择作品标题"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in workList"
              :key="item.workId"
              :label="item.title"
              :value="item.workId"
            ></el-option>
          </el-select>
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
  listContent,
  getContent,
  delContent,
  addContent,
  updateContent,
} from "@/api/vr/content";
import { listCarrier } from "@/api/vr/carrier";
import { listWork } from "@/api/vr/work";

export default {
  name: "Content",
  dicts: ["use_status", "vr_content_category"],
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
      // VR内容表格数据
      contentList: [],
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
        description: null,
        usageStatus: null,
        carrierId: null,
        workId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [{ required: true, message: "名称不能为空", trigger: "blur" }],
        category: [
          { required: true, message: "类别不能为空", trigger: "change" },
        ],
        fileUrl: [
          { required: true, message: "文件URL不能为空", trigger: "blur" },
        ],
        description: [
          { required: true, message: "简介不能为空", trigger: "blur" },
        ],
      },
      // 类别列表
      allCategoryList: [],
      // 载体列表
      carrierList: [],
      // 作品列表
      workList: [],
    };
  },
  created() {
    this.getList();
    this.getCategory();
    this.getCarrierList();
    this.getWorkList();
  },
  methods: {
    /** 查询VR内容列表 */
    getList() {
      this.loading = true;
      listContent(this.queryParams).then((response) => {
        this.contentList = response.rows;
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
        vrContentId: null,
        name: null,
        category: null,
        fileUrl: null,
        description: null,
        usageStatus: null,
        carrierId: null,
        workId: null,
        createdAt: null,
        updatedAt: null,
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
      this.ids = selection.map((item) => item.vrContentId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加VR内容";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const vrContentId = row.vrContentId || this.ids;
      getContent(vrContentId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改VR内容";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.vrContentId != null) {
            updateContent(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
              this.getCategory();
            });
          } else {
            addContent(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
              this.getCategory();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const vrContentIds = row.vrContentId || this.ids;
      this.$modal
        .confirm('是否确认删除VR内容编号为"' + vrContentIds + '"的数据项？')
        .then(function () {
          return delContent(vrContentIds);
        })
        .then(() => {
          this.getList();
          this.getCategory();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "vr/content/export",
        {
          ...this.queryParams,
        },
        `content_${new Date().getTime()}.xlsx`
      );
    },
    // 计算出类别列表（this.dict.type.vr_content_category加上this.contentList.category中的数据，然后去重）
    getCategory() {
      // 延迟0.8秒才能取出this.dict.type.vr_content_category的值(ob_observer只能异步取值)
      setTimeout(() => {
        const categorySet = new Set();
        this.dict.type.vr_content_category.forEach((item) => {
          categorySet.add(item.value);
        });
        listContent({
          pageNum: 1,
          pageSize: 10000,
        }).then((response) => {
          response.rows.forEach((item) => {
            categorySet.add(item.category);
          });
          this.allCategoryList = Array.from(categorySet);
        });
      }, 800);
    },
    getCarrierList() {
      listCarrier().then((response) => {
        this.carrierList = response.rows;
      });
    },
    getCarrierName(carrierId) {
      const carrier = this.carrierList.find(
        (item) => item.carrierId === carrierId
      );
      return carrier ? carrier.carrierName : "";
    },
    getWorkList() {
      listWork().then((response) => {
        this.workList = response.rows;
      });
    },
    getWorkTitle(workId) {
      const work = this.workList.find((item) => item.workId === workId);
      return work ? work.title : "";
    },
  },
};
</script>
