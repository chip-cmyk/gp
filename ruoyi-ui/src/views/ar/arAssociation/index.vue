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
          v-hasPermi="['ar:arAssociation:add']"
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
          v-hasPermi="['ar:arAssociation:edit']"
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
          v-hasPermi="['ar:arAssociation:remove']"
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
          v-hasPermi="['ar:arAssociation:export']"
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
      :data="arAssociationList"
      @selection-change="handleSelectionChange"
      @expand-change="handleExpandChange"
      row-key="qrCodeId"
      ref="qrCodeTable"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column type="expand">
        <template slot-scope="scope">
          <el-table
            :data="scope.row.associationList"
            :row-class-name="rowArContentIndex"
            @selection-change="handleArContentSelectionChange"
            class="sub-table"
            row-key="arContentId"
            v-loading="subLoading"
          >
            <!-- 子表格缩进 -->
            <el-table-column width="80" />
            <el-table-column type="selection" width="50" align="center" />
            <el-table-column
              label="序号"
              align="center"
              prop="index"
              width="50"
            />
            <el-table-column
              label="名称"
              prop="name"
              width="150"
              align="center"
            />
            <el-table-column
              label="类别"
              prop="category"
              width="150"
              align="center"
            />
            <!-- 描述 -->
            <el-table-column
              label="描述"
              prop="description"
              width="220"
              align="center"
            />
            <el-table-column
              label="使用情况"
              prop="usageStatus"
              width="150"
              align="center"
            >
              <!-- <template slot-scope="scope"> -->
              <!-- <el-select -->
              <!-- v-model="scope.row.usageStatus" -->
              <!-- placeholder="请选择使用情况" -->
              <!-- > -->
              <!-- <el-option -->
              <!-- v-for="dict in dict.type.use_status" -->
              <!-- :key="dict.value" -->
              <!-- :label="dict.label" -->
              <!-- :value="dict.value" -->
              <!-- ></el-option> -->
              <!-- </el-select> -->
              <!-- </template> -->
              <template slot-scope="scope">
                <dict-tag
                  :options="dict.type.use_status"
                  :value="scope.row.usageStatus"
                />
              </template>
            </el-table-column>
            <!-- 操作 删除关联 -->
            <el-table-column
              label="操作"
              align="center"
              class-name="small-padding fixed-width"
            >
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleDeleteAssociation(scope.row)"
                  v-hasPermi="['ar:arAssociation:remove']"
                  >删除关联</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="二维码编号" align="center" prop="qrCodeId" />
      <el-table-column label="二维码名称" align="center" prop="qrCodeName" />
      <el-table-column label="二维码" align="center" prop="qrCode">
        <template slot-scope="scope">
          <image-preview :src="scope.row.qrCode" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="使用情况" align="center" prop="usageStatus"
        ><template slot-scope="scope">
          <dict-tag
            :options="dict.type.use_status"
            :value="scope.row.usageStatus"
          /> </template
      ></el-table-column>
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
            v-hasPermi="['ar:arAssociation:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ar:arAssociation:remove']"
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

    <!-- 添加或修改AR内容关联对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="二维码名称" prop="qrCodeName">
          <el-input v-model="form.qrCodeName" placeholder="请输入二维码名称" />
        </el-form-item>
        <el-form-item label="二维码" prop="qrCode">
          <el-input v-model="form.qrCode" placeholder="请输入二维码" />
        </el-form-item>
        <el-divider content-position="center">AR内容信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              icon="el-icon-plus"
              size="mini"
              @click="handleAddArContent"
              >添加</el-button
            >
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              @click="handleDeleteArContent"
              >删除</el-button
            >
          </el-col>
        </el-row>
        <el-table
          :data="arContentList"
          :row-class-name="rowArContentIndex"
          @selection-change="handleArContentSelectionChange"
          ref="arContent"
        >
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column
            label="序号"
            align="center"
            prop="index"
            width="50"
          />
          <el-table-column label="名称" prop="name" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.name" placeholder="请输入名称" />
            </template>
          </el-table-column>
          <el-table-column label="类别" prop="category" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.category" placeholder="请输入类别" />
            </template>
          </el-table-column>
          <el-table-column label="使用情况" prop="usageStatus" width="150">
            <template slot-scope="scope">
              <el-select
                v-model="scope.row.usageStatus"
                placeholder="请选择使用情况"
              >
                <el-option
                  v-for="dict in dict.type.use_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
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
  listArAssociation,
  getArAssociation,
  delArAssociation,
  addArAssociation,
  updateArAssociation,
} from "@/api/ar/arAssociation";

export default {
  name: "ArAssociation",
  dicts: ["use_status"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 子表遮罩层
      subLoading: false,
      // 缓存展开行的key
      cacheExpandedKeys: new Set(),
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedArContent: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // AR内容关联表格数据
      arAssociationList: [],
      // AR内容表格数据
      arContentList: [],
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
          { required: true, message: "二维码不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询AR内容关联列表 */
    getList() {
      // 折叠所有行
      this.arAssociationList.forEach((item) => {
        this.$refs.qrCodeTable.toggleRowExpansion(item, false);
      });
      this.loading = true;
      listArAssociation(this.queryParams).then((response) => {
        this.arAssociationList = response.rows;
        // 增加associationList属性
        this.arAssociationList.forEach((item) => {
          item.associationList = [];
        });
        this.total = response.total;
        this.loading = false;
      });
    },
    handleExpandChange(row, expandedRows) {
      console.log(row, expandedRows, "expandedRows");
      if (
        expandedRows.length > 0 &&
        !this.cacheExpandedKeys.has(row.qrCodeId)
      ) {
        this.subLoading = true;
        this.cacheExpandedKeys.add(row.qrCodeId);
        getArAssociation(row.qrCodeId).then((response) => {
          // 把AR内容数据赋值给当前行的associationList属性
          const index = this.arAssociationList.indexOf(row);
          this.arAssociationList[index].associationList =
            response.data.arContentList;
          // this.arAssociationList.push({}); //触发vue更新视图
          // this.arAssociationList.pop(); //把最后添加的空对象删除掉
          console.log(this.arAssociationList, "this.arAssociationList");
          this.subLoading = false;
        });
      }
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
      this.arContentList = [];
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
      this.title = "添加AR内容关联";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const qrCodeId = row.qrCodeId || this.ids;
      getArAssociation(qrCodeId).then((response) => {
        this.form = response.data;
        this.arContentList = response.data.arContentList;
        this.open = true;
        this.title = "修改AR内容关联";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          this.form.arContentList = this.arContentList;
          if (this.form.qrCodeId != null) {
            updateArAssociation(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addArAssociation(this.form).then((response) => {
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
        .confirm('是否确认删除AR内容关联编号为"' + qrCodeIds + '"的数据项？')
        .then(function () {
          return delArAssociation(qrCodeIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** AR内容序号 */
    rowArContentIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** AR内容添加按钮操作 */
    handleAddArContent() {
      let obj = {};
      obj.name = "";
      obj.category = "";
      obj.fileUrl = "";
      obj.description = "";
      obj.usageStatus = "";
      this.arContentList.push(obj);
    },
    /** AR内容删除按钮操作 */
    handleDeleteArContent() {
      if (this.checkedArContent.length == 0) {
        this.$modal.msgError("请先选择要删除的AR内容数据");
      } else {
        const arContentList = this.arContentList;
        const checkedArContent = this.checkedArContent;
        this.arContentList = arContentList.filter(function (item) {
          return checkedArContent.indexOf(item.index) == -1;
        });
      }
    },
    /** 复选框选中数据 */
    handleArContentSelectionChange(selection) {
      this.checkedArContent = selection.map((item) => item.index);
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "ar/arAssociation/export",
        {
          ...this.queryParams,
        },
        `arAssociation_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>

<style scoped>
.sub-table {
  width: 100%;
  /* background: #f8f9fa !important; */
  border-radius: 4px;
}
.sub-table ::v-deep th.el-table__cell {
  /* background-color: #f8f9fa !important; */
  font-size: 0.9em;
}
.sub-table ::v-deep td.el-table__cell .cell {
  /* background-color: #f8f9fa !important; */
  font-size: 13px;
}

::v-deep td.el-table__cell.el-table__expanded-cell {
  padding: 0 0 12px 0;
}

.sub-table ::v-deep tr .th.el-table__cell {
  padding-left: 80px;
  background-color: bule;
}
</style>
