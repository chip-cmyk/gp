<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24" style="padding-left: 20px">
        <!-- <h2>尊敬的{{ user.nickName }}</h2> -->
        <h2>您好，欢迎来到{{ title }}！</h2>
        <p></p>
      </el-col>
    </el-row>
    <el-divider />
    <div class="bottom">
      <svg-icon class-name="welcome-icon" icon-class="welcome" />
    </div>
  </div>
</template>

<script>
import { getUserProfile } from "@/api/system/user";

export default {
  name: "Index",
  data() {
    return {
      user: {},
      title: process.env.VUE_APP_TITLE,
    };
  },
  created() {
    this.getUser();
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    getUser() {
      getUserProfile().then((response) => {
        this.user = response.data;
      });
    },
  },
};
</script>

<style scoped lang="scss">
.home {
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

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
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

.bottom {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;

  .welcome-icon {
    width: 700px;
    height: 420px;
  }
}
</style>
