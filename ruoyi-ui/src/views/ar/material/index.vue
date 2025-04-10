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
      <el-form-item label="库区名称" prop="warehouseZoneId">
        <el-select
          v-model="queryParams.warehouseZoneId"
          placeholder="请选择库区名称"
          filterable
          clearable
          allow-create
          @keyup.enter.native="handleQuery"
        >
          <el-option
            v-for="item in zoneList"
            :key="item.zoneId"
            :label="item.name"
            :value="item.zoneId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="材料名称" prop="materialName">
        <el-input
          v-model="queryParams.materialName"
          placeholder="请输入材料名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="材料型号" prop="materialModel">
        <el-input
          v-model="queryParams.materialModel"
          placeholder="请输入材料型号"
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
          v-hasPermi="['ar:material:add']"
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
          v-hasPermi="['ar:material:edit']"
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
          v-hasPermi="['ar:material:remove']"
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
          v-hasPermi="['ar:material:export']"
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
      <el-table-column label="材料编号" align="center" prop="materialId" />
      <el-table-column label="材料名称" align="center" prop="materialName" />
      <el-table-column label="材料型号" align="center" prop="materialModel" />
      <el-table-column
        label="材料简介"
        align="center"
        prop="materialDescription"
      />
      <el-table-column label="库存量" align="center" prop="stockAmount" />
      <el-table-column label="库区名称" align="center" prop="warehouseZoneId">
        <template slot-scope="scope">
          {{ getZoneName(scope.row.warehouseZoneId) }}
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
            v-hasPermi="['ar:material:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:material:remove']"
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

    <!-- 添加或修改材料信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库区名称" prop="warehouseZoneId">
          <el-select
            v-model="form.warehouseZoneId"
            placeholder="请选择库区名称"
            filterable
            clearable
            allow-create
          >
            <el-option
              v-for="item in zoneList"
              :key="item.zoneId"
              :label="item.name"
              :value="item.zoneId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="材料名称" prop="materialName">
          <el-input v-model="form.materialName" placeholder="请输入材料名称" />
        </el-form-item>
        <el-form-item label="材料型号" prop="materialModel">
          <el-input v-model="form.materialModel" placeholder="请输入材料型号" />
        </el-form-item>
        <el-form-item label="材料简介" prop="materialDescription">
          <el-input
            v-model="form.materialDescription"
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
} from "@/api/ar/material";
import { listWarehouse } from "@/api/ar/warehouse";

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
      // 材料信息表格数据
      materialList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        materialName: null,
        materialModel: null,
        warehouseZoneId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        materialName: [
          { required: true, message: "材料名称不能为空", trigger: "blur" },
        ],
        materialModel: [
          { required: true, message: "材料型号不能为空", trigger: "blur" },
        ],
        materialDescription: [
          { required: true, message: "材料简介不能为空", trigger: "blur" },
        ],
        warehouseZoneId: [
          { required: true, message: "库区名称不能为空", trigger: "blur" },
        ],
      },
      // 库区列表
      zoneList: [],
    };
  },
  created() {
    this.getList();
    this.getZoneList();
  },
  activated() {
    this.getList();
  },
  methods: {
    /** 查询材料信息列表 */
    getList() {
      this.loading = true;
      listMaterial(this.queryParams).then((response) => {
        this.materialList = response.rows;
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
        materialId: null,
        materialName: null,
        materialModel: null,
        materialDescription: null,
        stockAmount: null,
        warehouseZoneId: null,
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
      this.ids = selection.map((item) => item.materialId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加材料信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const materialId = row.materialId || this.ids;
      getMaterial(materialId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改材料信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.materialId != null) {
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
      const materialIds = row.materialId || this.ids;
      this.$modal
        .confirm('是否确认删除材料信息编号为"' + materialIds + '"的数据项？')
        .then(function () {
          return delMaterial(materialIds);
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
        "ar/material/export",
        {
          ...this.queryParams,
        },
        `material_${new Date().getTime()}.xlsx`
      );
    },
    // 获取库区列表
    getZoneList() {
      listWarehouse(this.allQueryParams).then((response) => {
        this.zoneList = response.rows;
        console.log(this.zonList, "zonList");
      });
    },
    // 根据库区编号回显对应的库区名称
    getZoneName(zoneId) {
      const zone = this.zoneList.find((item) => item.zoneId == zoneId);
      return zone ? zone.name : "";
    },
  },
};
</script>
