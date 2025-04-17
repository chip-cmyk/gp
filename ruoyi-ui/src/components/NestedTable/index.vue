<!-- NestedTable.vue -->
<template>
  <div>
    <el-table
      v-loading="loading"
      :data="data"
      @expand-change="handleExpandChange"
      :row-key="rowKey"
      ref="mainTable"
      :row-class-name="rowClassName"
    >
      <el-table-column type="expand">
        <template slot-scope="scope">
          <el-table
            :data="getSubData(scope.row)"
            :row-class-name="subRowClassName"
            @selection-change="
              (sel) => $emit('sub-selection-change', sel, scope.row)
            "
            class="sub-table"
            :row-key="subRowKey"
            v-loading="subLoading"
          >
            <el-table-column width="80" />
            <el-table-column
              v-if="subSelectable"
              type="selection"
              width="50"
              align="center"
            />
            <el-table-column
              v-if="subIndex"
              label="序号"
              align="center"
              type="index"
              width="50"
            />
            <template v-for="col in subColumns">
              <el-table-column
                v-bind="col.props"
                :width="col.props.width || 150"
                :align="col.props.align || 'center'"
                :key="col.props.label"
              >
                <template slot-scope="subScope">
                  <template v-if="col.render">
                    <component
                      :is="col.render.component"
                      v-bind="col.render.props(subScope.row)"
                      v-on="col.render.events"
                    />
                  </template>
                  <span v-else>{{ subScope.row[col.prop] }}</span>
                </template>
              </el-table-column>
            </template>
            <el-table-column
              label="操作"
              align="center"
              class-name="small-padding fixed-width"
            >
              <template slot-scope="subScope">
                <template v-for="action in subActions">
                  <el-button
                    :key="action.event"
                    v-bind="action.props"
                    @click="$emit(action.event, subScope.row, scope.$index)"
                  >
                    {{ action.label }}
                  </el-button>
                </template>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>

      <template v-for="col in mainColumns">
        <el-table-column v-bind="col.props" :key="col.prop">
          <template slot-scope="scope">
            <template v-if="col.render">
              <component
                :is="col.render.component"
                v-bind="col.render.props(scope.row)"
                v-on="col.render.events"
              />
            </template>
            <span v-else>{{ scope.row[col.prop] }}</span>
          </template>
        </el-table-column>
      </template>

      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <template v-for="(action, index) in mainActions">
            <el-button
              :key="index"
              v-bind="action.props"
              @click="$emit(action.event, scope.row)"
            >
              {{ action.label }}
            </el-button>
          </template>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="currentPage"
      :limit.sync="pageSize"
      @pagination="$emit('pagination', $event)"
    />
  </div>
</template>

<script>
export default {
  name: "NestedTable",
  props: {
    data: Array,
    loading: Boolean,
    subLoading: Boolean,
    subIndex: {
      type: Boolean,
      default: true,
    },
    rowKey: {
      type: String,
      default: "id",
    },
    subRowKey: {
      type: String,
      default: "id",
    },
    getSubData: {
      type: Function,
      default: () => [],
    },
    rowClassName: Function,
    subRowClassName: Function,
    total: Number,
    currentPage: Number,
    pageSize: Number,
    mainColumns: {
      type: Array,
      default: () => [],
    },
    subColumns: {
      type: Array,
      default: () => [],
    },
    mainActions: {
      type: Array,
      default: () => [],
    },
    subActions: {
      type: Array,
      default: () => [],
    },
    subSelectable: {
      type: Boolean,
      default: true,
    },
  },
  methods: {
    handleExpandChange(row, expandedRows) {
      this.$emit("expand-change", row, expandedRows);
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
