<template>
  <div class="app-container">
    <el-table
      :data="tableData"
      style="width: 100%"
      row-key="qrCodeId"
      :default-expand-all="true"
    >
      <!-- 展开行显示子内容 -->
      <el-table-column type="expand">
        <template #default="{ row }">
          <el-table
            :data="row.children"
            style="width: 95%; margin: 10px auto"
            class="sub-table"
          >
            <el-table-column prop="name" label="内容名称" width="180" />
            <el-table-column prop="category" label="类型" width="120" />
            <el-table-column prop="description" label="描述" />
            <el-table-column
              prop="fileUrl"
              label="文件地址"
              show-overflow-tooltip
            />
            <el-table-column label="状态" width="100" align="center">
              <template #default="{ row }">
                <el-tag
                  :type="row.usageStatus ? 'success' : 'danger'"
                  size="small"
                >
                  {{ row.usageStatus ? "启用" : "停用" }}
                </el-tag>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>

      <!-- 父级信息列 -->
      <el-table-column
        prop="qrCodeName"
        label="区域名称"
        width="300"
        align="center"
      />
      <el-table-column label="二维码" width="300" align="center">
        <template #default="{ row }">
          <el-image
            style="width: 100px; height: 100px"
            :src="row.qrCode"
            :preview-src-list="[row.qrCode]"
            :fit="contain"
          />
        </template>
      </el-table-column>
      <el-table-column label="状态" width="200" align="center">
        <template #default="{ row }">
          <el-tag :type="row.usageStatus ? 'success' : 'danger'" size="small">
            {{ row.usageStatus ? "启用" : "停用" }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="内容数量" width="300" align="center">
        <template #default="{ row }">
          <el-tag type="info">{{ row.children.length }} 项</el-tag>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [
        // 这里直接使用你的假数据
        {
          qrCodeId: 3,
          qrCodeName: "原料区",
          qrCode:
            "https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a58442555494c5a76e8776.png",
          usageStatus: 1,
          children: [
            {
              arContentId: 31,
              name: "虚拟现实体验",
              category: "纯文本",
              fileUrl: "http://example.com/vr_experience",
              description: "这是一个虚拟现实体验的内容。",
              usageStatus: 1,
            },
            {
              arContentId: 31,
              name: "增强现实教育",
              category: "纯文本",
              fileUrl: "http://example.com/ar_education",
              description: "基于AR技术的互动教育应用。",
              usageStatus: 0,
            },
          ],
        },
        {
          qrCodeId: 4,
          qrCodeName: "生产区",
          qrCode:
            "https://schoolworkweb.oss-cn-beijing.aliyuncs.com/school-images/2025/02/07/67a58442555494c5a76e8776.png",
          usageStatus: 1,
          children: [
            {
              arContentId: 31,
              name: "虚拟现实体验",
              category: "纯文本",
              fileUrl: "http://example.com/vr_experience",
              description: "这是一个虚拟现实体验的内容。",
              usageStatus: 1,
            },
            {
              arContentId: 31,
              name: "增强现实教育",
              category: "纯文本",
              fileUrl: "http://example.com/ar_education",
              description: "基于AR技术的互动教育应用。",
              usageStatus: 0,
            },
          ],
        },
      ],
    };
  },
};
</script>

<style scoped>
.app-container {
  padding: 20px;
}

.sub-table {
  background: #f8f9fa;
  border-radius: 4px;
}

/* 子表格行样式 */
.sub-table ::v-deep .el-table__row {
  background-color: #f8f9fa !important;
}

/* 调整展开图标位置 */
.el-table__expand-icon {
  margin-top: -8px;
}
</style>
