<template>
  <div>
    <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
      <el-row gutter="15">
        <el-col :span="12">
          <el-form-item label="课程编号" prop="classId">
            <el-input v-model="formData.classId" placeholder="请输入课程编号" clearable :style="{width: '100%'}">
            </el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="课程学科" prop="field106">
            <el-select v-model="formData.field106" placeholder="请选择课程学科" clearable :style="{width: '100%'}">
              <el-option v-for="(item, index) in field106Options" :key="index" :label="item.label"
                :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row gutter="15">
        <el-form-item label="级联选择" prop="field108">
          <el-cascader v-model="formData.field108" :options="field108Options" :props="field108Props"
            :style="{width: '100%'}" placeholder="请选择级联选择" clearable></el-cascader>
        </el-form-item>
      </el-row>
      <el-form-item label="滑块" prop="field109" required>
        <el-slider :max='100' :step='1' v-model="formData.field109"></el-slider>
      </el-form-item>
      <el-row gutter="15">
        <el-col :span="12">
          <el-form-item label="状态" prop="field111" required>
            <el-switch v-model="formData.field111"></el-switch>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="时间选择" prop="field112">
            <el-time-picker v-model="formData.field112" format="HH:mm:ss" value-format="HH:mm:ss"
              :picker-options='{"selectableRange":"00:00:00-23:59:59"}' :style="{width: '100%'}"
              placeholder="请选择时间选择" clearable></el-time-picker>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row gutter="15">
        <el-form-item label="时间范围" prop="field115">
          <el-time-picker v-model="formData.field115" is-range format="HH:mm:ss" value-format="HH:mm:ss"
            :style="{width: '100%'}" start-placeholder="开始时间" end-placeholder="结束时间" range-separator="至"
            clearable></el-time-picker>
        </el-form-item>
      </el-row>
      <el-row gutter="15">
        <el-col :span="12">
          <el-form-item label="日期选择" prop="field117">
            <el-date-picker v-model="formData.field117" format="yyyy-MM-dd" value-format="yyyy-MM-dd"
              :style="{width: '100%'}" placeholder="请选择日期选择" clearable></el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="日期范围" prop="field118">
            <el-date-picker type="daterange" v-model="formData.field118" format="yyyy-MM-dd"
              value-format="yyyy-MM-dd" :style="{width: '100%'}" start-placeholder="开始日期"
              end-placeholder="结束日期" range-separator="至" clearable></el-date-picker>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item label="评分" prop="field119">
        <el-rate v-model="formData.field119"></el-rate>
      </el-form-item>
      <el-form-item label="颜色选择" prop="field120" required>
        <el-color-picker v-model="formData.field120" size="medium"></el-color-picker>
      </el-form-item>
      <el-form-item label="上传" prop="field121" required>
        <el-upload ref="field121" :file-list="field121fileList" :action="field121Action"
          :before-upload="field121BeforeUpload">
          <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
        </el-upload>
      </el-form-item>
      <el-form-item label="按钮" prop="field122">
        <el-button type="primary" icon="el-icon-search" size="medium"> 主要按钮 </el-button>
      </el-form-item>
      <el-form-item size="large">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        classId: undefined,
        field106: undefined,
        field108: [],
        field109: 0,
        field111: false,
        field112: '15:08:48',
        field115: null,
        field117: null,
        field118: null,
        field119: 0,
        field120: null,
        field121: null,
        field122: undefined,
      },
      rules: {
        classId: [{
          required: true,
          message: '请输入课程编号',
          trigger: 'blur'
        }],
        field106: [{
          required: true,
          message: '请选择课程学科',
          trigger: 'change'
        }],
        field108: [{
          required: true,
          type: 'array',
          message: '请至少选择一个field108',
          trigger: 'change'
        }],
        field112: [{
          required: true,
          message: '请选择时间选择',
          trigger: 'change'
        }],
        field115: [{
          required: true,
          message: '时间范围不能为空',
          trigger: 'change'
        }],
        field117: [{
          required: true,
          message: '请选择日期选择',
          trigger: 'change'
        }],
        field118: [{
          required: true,
          message: '日期范围不能为空',
          trigger: 'change'
        }],
        field119: [{
          required: true,
          message: '评分不能为空',
          trigger: 'change'
        }],
      },
      field121Action: 'https://jsonplaceholder.typicode.com/posts/',
      field121fileList: [],
      field106Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
      field108Options: [],
      field108Props: {
        "multiple": false
      },
    }
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
    submitForm() {
      this.$refs['elForm'].validate(valid => {
        if (!valid) return
        // TODO 提交表单
      })
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },
    getField108Options() {
      // TODO 发起请求获取数据
      this.field108Options
    },
    field121BeforeUpload(file) {
      let isRightSize = file.size / 1024 / 1024 < 2
      if (!isRightSize) {
        this.$message.error('文件大小超过 2MB')
      }
      return isRightSize
    },
  }
}

</script>
<style>
.el-rate {
  display: inline-block;
  vertical-align: text-top;
}

.el-upload__tip {
  line-height: 1.2;
}

</style>
