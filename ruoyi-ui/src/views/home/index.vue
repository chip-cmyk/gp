<template>
  <div class="app-container home">
    <el-card class="home-card-box">
      <userCard />
    </el-card>
    <el-card class="home-card-box">
      <dataCard />
    </el-card>
    <div class="charts-box">
      <el-card class="home-card-box">
        <PieCharts class="pieCharts" />
      </el-card>
      <el-card class="home-card-box">
        <LineCharts class="lineCharts" />
      </el-card>
    </div>
  </div>
</template>

<script>
import userCard from "./components/userCard.vue";
import dataCard from "./components/dataCard.vue";
import PieCharts from "./components/pieCharts.vue";
import LineCharts from "./components/lineCharts.vue";

export default {
  components: {
    userCard,
    dataCard,
    PieCharts,
    LineCharts,
  },
  name: "Index",
  data() {
    return {
      user: {},
      title: process.env.VUE_APP_TITLE,
    };
  },
  created() {
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  padding: 20px;

  .home-card-box {
    width: 100%;
    border-radius: 8px;
    margin-bottom: 20px;
    overflow: hidden; // 隐藏内容溢出
  }

  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }

  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }

  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans",
  "Helvetica Neue",
  Helvetica,
  Arial,
  sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 20px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}

.charts-box {
  display: grid;
  grid-template-columns: 3fr 5fr;
  gap: 16px;

  .home-card-box {
    margin-bottom: 0;
  }

  .pieCharts {
    height: 300px;
  }

  .lineCharts {
    height: 300px;
  }
}

@media (max-width: 768px) {
  .charts-box {
    grid-template-columns: 1fr;
  }

  .lineCharts {
    height: 260px;
  }
}
</style>
