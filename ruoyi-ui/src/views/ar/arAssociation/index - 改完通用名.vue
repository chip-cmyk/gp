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
          :v-hasPermi="`['${moduleKey}:remove']`"
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
          :v-hasPermi="`['${moduleKey}:export']`"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <nested-table
      ref="nestedTable"
      :data="mainList"
      :loading="loading"
      :sub-loading="subLoading"
      :row-key="mainId"
      :row-class-name="tableRowClassName"
      :get-sub-data="getSubData"
      :main-columns="mainColumns"
      :sub-columns="subColumns"
      :main-actions="mainActions"
      :sub-actions="subActions"
      @expand-change="handleExpandChange"
      @sub-selection-change="handleSelectionChange"
      @add-association="handleAddAssociation"
      @delete-association="handleDeleteAssociation"
    />

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改${this.associationName}关联对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <!-- 添加${this.associationName}下拉框 -->
        <el-form-item :label="`${associationName}`" :prop="subId">
          <el-select
            v-model="form[subId]"
            :placeholder="`请选择${associationName}`"
            filterable
            clearable
          >
            <el-option
              v-for="item in noQrCodeSubList"
              :key="item[subId]"
              :label="item.name"
              :value="item[subId]"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-divider content-position="center"
          >已关联{{ associationName }}</el-divider
        >

        <el-table
          :data="subList"
          :row-class-name="rowArContentIndex"
          ref="arContent"
        >
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
import NestedTable from "@/components/NestedTable";
import { listArAssociation, getArAssociation } from "@/api/ar/arAssociation";
import { listContent, updateContent } from "@/api/ar/content";

export default {
  name: "ArAssociation",
  dicts: ["use_status"],
  components: {
    NestedTable,
  },
  data() {
    return {
      // 可配置data
      mainListName: "arAssociationList",
      subListName: "arContentList",
      moduleKey: "ar:arAssociation",
      associationName: "AR内容",
      mainId: "qrCodeId",
      subId: "arContentId",
      exportName: "ar/arAssociation/",
      pageName: "arAssociation",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        qrCodeName: null,
        qrCode: null,
        usageStatus: null,
      },
      // 表单校验
      rules: {
        [this.subId]: [
          {
            required: true,
            message: `${this.associationName}不能为空`,
            trigger: "change",
          },
        ],
      },
      mainColumns: [
        {
          prop: "qrCodeId",
          props: { label: "二维码编号", align: "center", width: "120" },
        },
        {
          prop: "qrCodeName",
          props: { label: "二维码名称", align: "center" },
        },
        {
          prop: "qrCode",
          props: { label: "二维码", align: "center" },
          render: {
            component: "ImagePreview",
            props: (row) => ({ src: row.qrCode, width: 50, height: 50 }),
          },
        },
        {
          prop: "usageStatus",
          props: { label: "使用情况", align: "center" },
          render: {
            component: "dict-tag",
            props: (row) => ({
              options: this.dict.type.use_status,
              value: row.usageStatus,
            }),
          },
        },
      ],
      subColumns: [
        {
          prop: "name",
          props: { label: "名称" },
        },
        {
          prop: "category",
          props: { label: "类别", width: "150" },
        },
        {
          prop: "description",
          props: { label: "描述", width: "220" },
        },
        {
          prop: "usageStatus",
          props: { label: "使用情况", width: "150" },
          render: {
            component: "dict-tag",
            props: (row) => ({
              options: this.dict.type.use_status,
              value: row.usageStatus,
            }),
          },
        },
      ],
      mainActions: [
        {
          label: "添加关联",
          props: { type: "text", icon: "el-icon-edit", size: "mini" },
          event: "add-association",
          "v-hasPermi": `['${this.moduleKey}:edit']`,
        },
      ],
      subActions: [
        {
          label: "删除关联",
          props: { type: "text", icon: "el-icon-delete", size: "mini" },
          event: "delete-association",
          "v-hasPermi": `['${this.moduleKey}:remove']`,
        },
      ],
      // 通用data
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
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // ${this.associationName}关联表格数据
      mainList: [],
      // ${this.associationName}表格数据
      subList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 表单参数
      form: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 可配置methods
    listMain(params) {
      return listArAssociation(params);
    },
    getMainInfo(id) {
      return getArAssociation(id);
    },
    listSub(params) {
      return listContent(params);
    },
    updateSub(params) {
      return updateContent(params);
    },
    // 表单重置
    reset() {
      this.form = {
        qrCodeId: null,
        qrCodeName: null,
        qrCode: null,
        usageStatus: null,
      };
      this.subList = [];
      this.resetForm("form");
    },
    /** 查询${this.associationName}关联列表 */
    getList() {
      // 折叠所有行
      this.mainList.forEach((item) => {
        this.$refs?.nestedTable?.$refs?.mainTable.toggleRowExpansion(
          item,
          false
        );
      });
      // 清空缓存
      this.cacheExpandedKeys.clear();
      this.loading = true;
      this.listMain(this.queryParams).then((response) => {
        this.mainList = response.rows;
        // 增加associationList属性
        this.mainList.forEach((item) => {
          item[this.mainListName] = [];
        });
        this.total = response.total;
        this.loading = false;
      });
    },
    handleExpandChange(row, expandedRows) {
      // console.log(row, expandedRows, "handleExpandChange");
      if (
        expandedRows.length > 0 &&
        !this.cacheExpandedKeys.has(row[this.mainId])
      ) {
        this.subLoading = true;
        this.cacheExpandedKeys.add(row[this.mainId]);
        this.getMainInfo(row[this.mainId]).then((response) => {
          // 把${this.associationName}数据赋值给当前行的associationList属性
          const index = this.mainList.indexOf(row);
          this.mainList[index][this.mainListName] =
            response.data[this.subListName];

          this.subLoading = false;
        });
      }
    },
    handleDeleteAssociation(row, parentIndex) {
      this.$modal
        .confirm(
          `是否确认删除${this.associationName}名称为【${row.name}】的数据项？`
        )
        .then(() => {
          this.updateSub({
            [this.subId]: row[this.subId],
            [this.mainId]: null,
          }).then((response) => {
            this.$modal.msgSuccess("删除关联成功");
            const index = this.mainList[parentIndex][
              this.mainListName
            ].findIndex((item) => item[this.subId] === row[this.subId]);

            if (index !== -1) {
              this.mainList[parentIndex][this.mainListName].splice(index, 1);
            }

            // 如果删除后没有关联的${this.associationName}，则将关联的二维码状态设置为未使用
            if (this.mainList[parentIndex][this.mainListName].length === 0) {
              // 折叠父级行
              this.$refs?.nestedTable?.$refs?.mainTable.toggleRowExpansion(
                this.mainList[parentIndex],
                false
              );
              this.mainList[parentIndex].usageStatus = 0;
            }
          });
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
      this.$set(this.allSelectedSubRows, parentRow[this.mainId], selection);
    },
    /** 添加关联按钮操作 */
    handleAddAssociation(row) {
      this.reset();
      // 获取还未关联二维码的子表列表
      const mainId = row[this.mainId] || this.ids;
      Promise.all([
        this.listSub({ [this.mainId]: 0 }),
        this.getMainInfo(mainId),
      ]).then(([listMainRes, getMainInfoRes]) => {
        this.noQrCodeSubList = listMainRes.rows;
        this.form = getMainInfoRes.data;
        this.subList = getMainInfoRes.data[this.subListName];
        this.open = true;
        this.title = `添加${this.associationName}关联`;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form[this.mainId] != null) {
            this.updateSub({
              [this.subId]: this.form[this.subId],
              [this.mainId]: this.form[this.mainId],
            }).then((response) => {
              this.$modal.msgSuccess("添加关联成功");
              const item = this.mainList.find(
                (item) => item[this.mainId] === this.form[this.mainId]
              );
              // 如果使用情况为未使用，则设为已使用
              if (item.usageStatus == 0) {
                // this.$set触发视图更新
                this.$set(item, "usageStatus", 1);
              }
              this.open = false;
              // this.getList();
              this.subLoading = true;
              this.getMainInfo(this.form[this.mainId]).then((response) => {
                // 把${this.associationName}数据赋值给当前行的associationList属性
                this.mainList.find(
                  (item) => item[this.mainId] === this.form[this.mainId]
                )[this.mainListName] = response.data[this.subListName];
                this.subLoading = false;
                // 展开父级行
                this.$refs?.nestedTable?.$refs?.mainTable.toggleRowExpansion(
                  this.mainList.find(
                    (item) => item[this.mainId] === this.form[this.mainId]
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
        ([mainId, selectedRows]) => {
          selectedRows.forEach((row) => {
            allSelected.push({
              ...row,
              mainId,
            });
          });
        }
      );

      if (allSelected.length === 0) {
        this.$message.warning("请先选择要删除的关联项");
        return;
      }
      try {
        await this.$confirm("确定删除选中的关联项吗？", "警告", {
          type: "warning",
        });
        this.loading = true;

        const deleteRequests = allSelected.map((item) =>
          this.updateSub({
            [this.subId]: item[this.subId],
            [this.mainId]: 0,
          })
        );

        await Promise.all(deleteRequests);
        this.$message.success("删除成功");

        // 清空选中状态（对象用赋值方式）
        this.allSelectedSubRows = {};
        // 清除表格选中状态
        this.$refs?.nestedTable?.$refs?.mainTable.clearSelection();

        await this.getList();
      } catch (error) {
        if (error !== "cancel") {
          this.$message.error("删除失败");
        }
      } finally {
        this.loading = false;
      }
    },
    /** ${this.associationName}序号 */
    rowArContentIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        `${this.exportName}/export`,
        {
          ...this.queryParams,
        },
        `${this.pageName}_${new Date().getTime()}.xlsx`
      );
    },
    getSubData(row) {
      return row[this.mainListName] || [];
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
