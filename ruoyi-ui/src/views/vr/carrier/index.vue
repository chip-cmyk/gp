<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="载体名称" prop="carrierName">
        <el-input
          v-model="queryParams.carrierName"
          placeholder="请输入载体名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="载体类型" prop="carrierType">
        <el-select v-model="queryParams.carrierType" placeholder="请选择载体类型" clearable>
          <el-option
            v-for="dict in dict.type.vr_carrier_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="载体状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择载体状态" clearable>
          <el-option
            v-for="dict in dict.type.vr_carrier_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="展区编号" prop="exhibitZoneId">
        <el-input
          v-model="queryParams.exhibitZoneId"
          placeholder="请输入展区编号"
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
          v-hasPermi="['vr:carrier:add']"
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
          v-hasPermi="['vr:carrier:edit']"
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
          v-hasPermi="['vr:carrier:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['vr:carrier:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="carrierList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="载体编号" align="center" prop="carrierId" />
      <el-table-column label="载体名称" align="center" prop="carrierName" />
      <el-table-column label="载体类型" align="center" prop="carrierType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.vr_carrier_type" :value="scope.row.carrierType"/>
        </template>
      </el-table-column>
      <el-table-column label="载体状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.vr_carrier_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="规格" align="center" prop="specifications" />
      <el-table-column label="展区编号" align="center" prop="exhibitZoneId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['vr:carrier:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['vr:carrier:remove']"
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

    <!-- 添加或修改载体对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="载体名称" prop="carrierName">
          <el-input v-model="form.carrierName" placeholder="请输入载体名称" />
        </el-form-item>
        <el-form-item label="载体类型" prop="carrierType">
          <el-select v-model="form.carrierType" placeholder="请选择载体类型">
            <el-option
              v-for="dict in dict.type.vr_carrier_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="载体状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.vr_carrier_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="规格" prop="specifications">
          <el-input v-model="form.specifications" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="展区编号" prop="exhibitZoneId">
          <el-input v-model="form.exhibitZoneId" placeholder="请输入展区编号" />
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
import { listCarrier, getCarrier, delCarrier, addCarrier, updateCarrier } from "@/api/vr/carrier";

export default {
  name: "Carrier",
  dicts: ['vr_carrier_type', 'vr_carrier_status'],
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
      // 载体表格数据
      carrierList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        carrierName: null,
        carrierType: null,
        status: null,
        specifications: null,
        exhibitZoneId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        carrierName: [
          { required: true, message: "载体名称不能为空", trigger: "blur" }
        ],
        exhibitZoneId: [
          { required: true, message: "展区编号不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询载体列表 */
    getList() {
      this.loading = true;
      listCarrier(this.queryParams).then(response => {
        this.carrierList = response.rows;
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
        carrierId: null,
        carrierName: null,
        carrierType: null,
        status: null,
        specifications: null,
        exhibitZoneId: null
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
      this.ids = selection.map(item => item.carrierId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加载体";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const carrierId = row.carrierId || this.ids
      getCarrier(carrierId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改载体";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.carrierId != null) {
            updateCarrier(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCarrier(this.form).then(response => {
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
      const carrierIds = row.carrierId || this.ids;
      this.$modal.confirm('是否确认删除载体编号为"' + carrierIds + '"的数据项？').then(function() {
        return delCarrier(carrierIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('vr/carrier/export', {
        ...this.queryParams
      }, `carrier_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
