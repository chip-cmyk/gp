<template>
  <div class="lineCharts-box" ref="lineCharts">
  </div>
</template>

<script>
import * as echarts from 'echarts';
import { getMonthlyRegistrations } from "@/api/home";
import { debounce, getLast6Months } from '@/utils'

export default {
  name: "LineCharts",
  data() {
    return {
      dataSrc: [],
      option: {
        dataset: [
          {
            source: [
              ['2025-3', 41],
              ['2025-4', 86],
              ['2025-5', 24],
              ['2025-6', 41],
              ['2025-7', 86],
              ['2025-8', 24],
              ['2025-9', 41]
            ],
          }
        ],
        color: ['#26deca', '#00DDFF', '#37A2FF', '#FF0087', '#FFBF00'],
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross',
            label: {
              backgroundColor: '#6a7985'
            }
          }
        },
        legend: {
          data: ['注册量']
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '5%',
          containLabel: true
        },
        xAxis: [
          {
            type: 'category',
            boundaryGap: false,
          }
        ],
        yAxis: [
          {
            type: 'value'
          }
        ],
        series: [
          {
            name: '注册量',
            type: 'line',
            stack: 'Total',
            smooth: true,
            showSymbol: false,
            areaStyle: {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [
                  {
                    offset: 0.25,
                    color: '#26deca'
                  },
                  {
                    offset: 1,
                    color: '#fff'
                  }
                ]
              }
            },
            emphasis: {
              focus: 'series'
            },
          },
        ]
      },
    };
  },
  computed: {
  },

  methods: {
    monthlyRegistrations() {
      const { startDate, endDate } = getLast6Months();
      getMonthlyRegistrations(startDate, endDate).then((response) => {
        this.dataSrc = response.data.map(item => {
          return [item.yearMonth, item.count]
        });
      });
    }
  },
  watch: {
    dataSrc: {
      handler(newVal) {
        this.option.dataset[0].source = newVal;
        if (this.chart) {
          this.chart.setOption(this.option);
        }
      },
    }
  },
  created() {
    this.monthlyRegistrations()
  },
  mounted() {
    const chartDom = this.$refs.lineCharts;
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
