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
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="!hasSubSelection"
          @click="handleDelete"
          v-hasPermi="['ar:arAssociation:remove']"
          >删除关联</el-button
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
      @expand-change="handleExpandChange"
      row-key="qrCodeId"
      ref="qrCodeTable"
      :row-class-name="tableRowClassName"
    >
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <el-table-column type="expand">
        <template slot-scope="scope">
          <el-table
            :data="scope.row.associationList"
            :row-class-name="rowArContentIndex"
            @selection-change="(sel) => handleSelectionChange(sel, scope.row)"
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
              <template slot-scope="subScope">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleDeleteAssociation(subScope.row, scope.$index)"
                  v-hasPermi="['ar:arAssociation:remove']"
                  >删除关联</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column
        label="二维码编号"
        align="center"
        prop="qrCodeId"
        :width="120"
      />
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
            @click="handleAddAssociation(scope.row)"
            v-hasPermi="['ar:arAssociation:edit']"
            >添加关联</el-button
          >
          <!-- <el-button -->
          <!-- size="mini" -->
          <!-- type="text" -->
          <!-- icon="el-icon-delete" -->
          <!-- @click="handleDelete(scope.row)" -->
          <!-- v-hasPermi="['ar:arAssociation:remove']" -->
          <!-- >删除</el-button -->
          <!-- > -->
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
        <!-- 添加AR内容下拉框 -->
        <el-form-item label="AR内容" prop="arContentId">
          <el-select
            v-model="form.arContentId"
            placeholder="请选择AR内容"
            filterable
            clearable
          >
            <el-option
              v-for="item in noQrCodeSubList"
              :key="item.arContentId"
              :label="item.name"
              :value="item.arContentId"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-divider content-position="center">已关联AR内容</el-divider>

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
          <el-table-column label="名称" prop="name" width="150" />
          <el-table-column label="类别" prop="category" width="150" />
          <el-table-column label="使用情况" prop="usageStatus" width="150">
            <template slot-scope="scope">
              <dict-tag
                :options="dict.type.use_status"
                :value="scope.row.usageStatus"
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
  listArAssociation,
  getArAssociation,
  delArAssociation,
  addArAssociation,
  updateArAssociation,
} from "@/api/ar/arAssociation";
import { listContent, updateContent } from "@/api/ar/content";

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
      // 存储所有子表格选中数据（
      allSelectedSubRows: {}, // key: qrCodeId, value: selectedRows
      // qrCodeId字段为null，即为还未关联二维码的子表列表
      noQrCodeSubList: [],
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
        arContentId: [
          { required: true, message: "AR内容不能为空", trigger: "change" },
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
        this.$refs.qrCodeTable?.toggleRowExpansion(item, false);
      });
      // 清空缓存
      this.cacheExpandedKeys.clear();
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
      // console.log(row, expandedRows, "handleExpandChange");
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
          // console.log(this.arAssociationList, "this.arAssociationList");
          this.subLoading = false;
        });
      }
    },
    handleDeleteAssociation(row, parentIndex) {
      this.$modal
        .confirm("是否确认删除AR内容名称为【" + row.name + "】的数据项？")
        .then(() => {
          updateContent({ arContentId: row.arContentId, qrCodeId: null }).then(
            (response) => {
              this.$modal.msgSuccess("删除关联成功");
              const index = this.arAssociationList[
                parentIndex
              ].associationList.findIndex(
                (item) => item.arContentId === row.arContentId
              );
              // 不知道为什么使用 splice 方法删除元素才能触发视图更新
              if (index !== -1) {
                this.arAssociationList[parentIndex].associationList.splice(
                  index,
                  1
                );
              }

              // 如果删除后没有关联的AR内容，则将关联的二维码状态设置为未使用
              if (
                this.arAssociationList[parentIndex].associationList.length === 0
              ) {
                // 折叠父级行
                this.$refs.qrCodeTable?.toggleRowExpansion(
                  this.arAssociationList[parentIndex],
                  false
                );
                this.arAssociationList[parentIndex].usageStatus = 0;
              }
            }
          );
        });
    },
    tableRowClassName({ row, rowIndex }) {
      if (row.usageStatus == 0) {
        return "hide-arrow";
      }
      return "";
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
    handleSelectionChange(selection, parentRow) {
      // 使用Map存储每个父级对应的选中项
      this.$set(this.allSelectedSubRows, parentRow.qrCodeId, selection);
    },
    /** 添加关联按钮操作 */
    handleAddAssociation(row) {
      this.reset();
      // 获取还未关联二维码的子表列表
      const qrCodeId = row.qrCodeId || this.ids;
      Promise.all([
        listContent({ qrCodeId: null }),
        getArAssociation(qrCodeId),
      ]).then(([listContentResponse, getArAssociationResponse]) => {
        this.noQrCodeSubList = listContentResponse.rows;
        this.form = getArAssociationResponse.data;
        this.arContentList = getArAssociationResponse.data.arContentList;
        this.open = true;
        this.title = "添加AR内容关联";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.qrCodeId != null) {
            updateContent({
              arContentId: this.form.arContentId,
              qrCodeId: this.form.qrCodeId,
            }).then((response) => {
              this.$modal.msgSuccess("添加关联成功");
              // 如果使用情况为未使用，则设为已使用
              if (this.form.usageStatus == 0) {
                this.arAssociationList.find(
                  (item) => item.qrCodeId === this.form.qrCodeId
                ).usageStatus = 1;
              }
              this.open = false;
              // this.getList();
              this.subLoading = true;
              getArAssociation(this.form.qrCodeId).then((response) => {
                // 把AR内容数据赋值给当前行的associationList属性
                this.arAssociationList.find(
                  (item) => item.qrCodeId === this.form.qrCodeId
                ).associationList = response.data.arContentList;
                this.subLoading = false;
                // 展开父级行
                this.$refs.qrCodeTable?.toggleRowExpansion(
                  this.arAssociationList.find(
                    (item) => item.qrCodeId === this.form.qrCodeId
                  ),
                  true
                );
              });
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    async handleDelete() {
      // 正确遍历对象的方式
      const allSelected = [];

      // 使用 Object.entries 遍历对象
      Object.entries(this.allSelectedSubRows).forEach(
        ([qrCodeId, selectedRows]) => {
          selectedRows.forEach((row) => {
            allSelected.push({
              ...row,
              qrCodeId,
            });
          });
        }
      );

      if (allSelected.length === 0) {
        this.$message.warning("请先选择要删除的关联项");
        return;
      }
      this.loading = true;
      try {
        await this.$confirm("确定删除选中的关联项吗？", "警告", {
          type: "warning",
        });

        const deleteRequests = allSelected.map((item) =>
          updateContent({
            arContentId: item.arContentId,
            qrCodeId: "",
          })
        );

        await Promise.all(deleteRequests);
        this.$message.success("删除成功");

        // 清空选中状态（对象用赋值方式）
        this.allSelectedSubRows = {};
        // 清除表格选中状态
        this.$refs.qrCodeTable?.clearSelection();

        await this.getList();
      } catch (error) {
        if (error !== "cancel") {
          this.$message.error("删除失败");
        }
      } finally {
        this.loading = false;
      }
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
    /** 复选框选中数据 */
    handleArContentSelectionChange(selection) {
      this.checkedArContent = selection.map((item) => item.index);
      console.log(
        selection,
        this.checkedArContent,
        "selection",
        "this.checkedArContent"
      );
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
  computed: {
    hasSubSelection() {
      return Object.values(this.allSelectedSubRows).some(
        (selection) => selection?.length > 0
      );
    },
  },
};
</script>

<style scoped>
.sub-table {
  width: 100%;
}
.sub-table ::v-deep th.el-table__cell {
  font-size: 0.9em;
}
.sub-table ::v-deep td.el-table__cell .cell {
  font-size: 13px;
}

::v-deep td.el-table__cell.el-table__expanded-cell {
  padding: 0 0 12px 0;
}

.sub-table ::v-deep tr .th.el-table__cell {
  padding-left: 80px;
  background-color: bule;
}

::v-deep .hide-arrow .el-table__expand-icon {
  visibility: hidden;
}
</style>
