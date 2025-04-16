<template>
  <div class="data-card">
    <div v-for="(item, index) in cardData" :key="index" class="data-card-item">
      <div class="data-card__title">{{ item.title }}</div>
      <div class="data-card__content">
        <svgIcon :icon-class="item.icon" class="data-card__icon" />
        <div class="data-card__value">
          <ICountUp :delay="delay" :endVal="item.value" :options="options" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SvgIcon from "@/components/SvgIcon/index.vue";
import ICountUp from 'vue-countup-v2';
// import { listContent as listArContent } from "@/api/ar/content.js";
// import { listContent as listVrContent } from "@/api/vr/content.js";
// import { listCase } from "@/api/school/case.js";
import { getHomeData } from "@/api/home";

export default {
  name: "DataCard",
  components: {
    SvgIcon,
    ICountUp
  },
  data() {
    return {
      cardData: [
        {
          title: "AR内容数量",
          value: 74,
          icon: "component",
        },
        {
          title: "VR内容数量",
          value: 90,
          icon: "example",
        },
        {
          title: "合作案例数量",
          value: 67,
          icon: "color",
        },
      ],
      delay: 1000,
      endVal: 100,
      options: {
        useEasing: true,
        useGrouping: true,
        separator: ',',
        decimal: '.',
        prefix: '',
        suffix: ''
      }
    };
  },
  computed: {
  },
  methods: {
    getData() {
      // listArContent().then((response) => {
      //   this.cardData[0].value = response.total;
      // });
      // listVrContent().then((response) => {
      //   this.cardData[1].value = response.total;
      // });
      // listCase().then((response) => {
      //   this.cardData[2].value = response.total;
      // });
      getHomeData().then((response) => {
        this.cardData[0].value = response.arContentCount;
        this.cardData[1].value = response.vrContentCount;
        this.cardData[2].value = response.cooperationCaseCount;
      });
    },
  },
  created() {
    this.getData();
  },
};
</script>

<style scoped>
.data-card {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 16px;
}

@media (max-width: 768px) {
  .data-card {
    grid-template-columns: 1fr;
  }
}

.data-card-item {
  background: #fff;
  border-radius: 8px;
  padding: 20px;
  background: linear-gradient(135deg, var(--card-color), var(--card-color-dark));
  transition: transform 0.3s ease;
}

.data-card-item:nth-child(1) {
  --card-color: #FF7A7A;
  --card-color-dark: #FF9F9F;
}

.data-card-item:nth-child(2) {
  --card-color: #A579FF;
  --card-color-dark: #C4A1FF;
}

.data-card-item:nth-child(3) {
  --card-color: #6BB9FF;
  --card-color-dark: #9FD4FF;
}

.data-card-item:hover {
  transform: scale(1.02);
}

.data-card__content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 16px;
}

.data-card__icon {
  width: 30px;
  height: 30px;
  color: #fff;
}

.data-card__title {
  font-size: 16px;
  font-weight: 500;
  color: #fff;
}

.data-card__value {
  font-size: 26px;
  font-weight: bold;
  color: #fff;
}
</style>