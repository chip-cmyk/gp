<template>
  <div class="pieCharts-box" ref="pieChart">
  </div>
</template>

<script>
import * as echarts from 'echarts';
import { getHomeData } from "@/api/home";
import { debounce } from '@/utils'

export default {
  name: "PieCharts",
  data() {
    return {
      dataSrc: [],
      option: {
        dataset: {
          source: [
            ['AR内容数量', 41],
            ['VR内容数量', 86],
            ['合作案例数量', 24]
          ],
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          bottom: '5%',
          left: 'center',
          itemStyle: {
            borderWidth: 0
          }
        },
        series: [
          {
            color: ['#5da8ff', '#00DDFF', '#fedc69', '#26deca', '#ff6b8a', '#ff9f43', '#AE84FF'],
            name: 'Access From',
            type: 'pie',
            radius: ['40%', '70%'],
            center: ['50%', '40%'], // 调整饼图的位置
            avoidLabelOverlap: false,
            padAngle: 2,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 1
            },
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '12'
              }
            },
            labelLine: {
              show: false
            },
          }
        ]
      },
    };
  },
  computed: {

  },
  methods: {
    getData() {
      getHomeData().then((response) => {
        const data = [['AR内容数量', response.arContentCount], ['VR内容数量', response.vrContentCount], ['合作案例数量', response.cooperationCaseCount]];
        this.dataSrc = data;
      })
    },
  },
  watch: {
    dataSrc: {
      handler(newVal) {
        this.option.dataset.source = newVal;
        if (this.chart) {
          this.chart.setOption(this.option);
        }
      },
    }
  },
  created() {
    this.getData();
  },
  mounted() {
    const chartDom = this.$refs.pieChart;
    this.chart = echarts.init(chartDom);
    this.chart.setOption(this.option);
    window.addEventListener('resize', () => {
      this.chart.resize();
    });
  },
  beforeDestroy() {
    if (this.chart) {
      window.removeEventListener('resize', debounce(() => {
        this.chart.resize();
      }, 200));
      this.chart.dispose();
    }
  }
};
</script>
