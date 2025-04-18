<template>
  <div class="login">
    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
      <div>
        <h3 class="title">
          <img v-if="logo" :src="logo" class="login-logo" />{{ title }} -
          {{ isAdmin ? "管理端" : "应用端" }}
        </h3>
      </div>
      <el-form-item prop="username">
        <el-input v-model="loginForm.username" type="text" auto-complete="off" placeholder="账号">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input v-model="loginForm.password" type="password" auto-complete="off" placeholder="密码"
          @keyup.enter.native="handleLogin">
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="roleIds" v-if="!isAdmin" class="selectApp">
        <el-select v-if="!isMultiple" v-model="roleIds" placeholder="请选择应用端" @change="handleRoleChange" style="flex: 1">
          <!-- 前缀图标 -->
          <template slot="prefix">
            <span style="margin-left: 2px; vertical-align: -0.1em">
              <i class="el-icon-menu"></i>
            </span>
          </template>
          <el-option v-for="item in appOptions" :key="item.roleId" :label="item.roleName" :value="item.roleId">
          </el-option>
        </el-select>
        <el-select v-else multiple v-model="roleIds" placeholder="请选择应用端" @change="handleRoleChange" style="flex: 1">
          <!-- 前缀图标 -->
          <template slot="prefix">
            <span style="margin-left: 2px; vertical-align: -0.1em">
              <i class="el-icon-menu"></i>
            </span>
          </template>
          <el-option v-for="item in appOptions" :key="item.value" :label="item.label" :value="item.value">
          </el-option>
        </el-select>
        <!-- <el-checkbox style="padding-left: 12px" v-model="isMultiple" -->
        <!-- >是否多选</el-checkbox> -->
        <!-- <div -->
        <!-- style=" -->
        <!-- display: inline-block; -->
        <!-- height: 100%; -->
        <!-- padding-left: 10px; -->
        <!-- vertical-align: middle; -->
        <!-- " -->
        <!-- > -->
        <!-- <el-switch -->
        <!-- v-model="isMultiple" -->
        <!-- active-icon-class="el-icon-s-grid" -->
        <!-- inactive-icon-class="el-icon-s-custom" -->
        <!-- @change="handleIsMultiple" -->
        <!-- /> -->
        <!-- </div> -->
      </el-form-item>
      <el-form-item prop="code" v-if="captchaEnabled">
        <el-input v-model="loginForm.code" auto-complete="off" placeholder="验证码" style="width: 63%"
          @keyup.enter.native="handleLogin">
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
        </el-input>
        <div class="login-code">
          <img :src="codeUrl" @click="getCode" class="login-code-img" />
        </div>
      </el-form-item>
      <el-checkbox v-model="loginForm.rememberMe" style="margin: 0px 0px 25px 0px">记住密码</el-checkbox>
      <el-form-item style="width: 100%">
        <el-button :loading="loading" size="medium" type="primary" style="width: 100%"
          @click.native.prevent="handleLogin">
          <span v-if="!loading">登 录</span>
          <span v-else>登 录 中...</span>
        </el-button>
        <div style="float: left" v-if="register">
          <el-button type="text" @click="handleLoginType">{{
            `${isAdmin ? "用户" : "管理员"}登录`
          }}</el-button>
        </div>
        <div style="float: right" v-if="register">
          <router-link class="link-type" :to="'/register'">立即注册</router-link>
        </div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-login-footer">
      <!-- <span>Copyright © 2024-2025</span> -->
    </div>
  </div>
</template>

<script>
import { getCodeImg, getoptionselect } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from "@/utils/jsencrypt";
import logoImg from "@/assets/logo/logo.png";

export default {
  name: "Login",
  data() {
    return {
      title: process.env.VUE_APP_TITLE,
      logo: logoImg,
      codeUrl: "",
      roleIds: null,
      //默认是否为管理员登录
      isAdmin: true,
      // 是否多选应用端
      isMultiple: false,
      loginForm: {
        username: "admin",
        password: "admin123",
        rememberMe: false,
        code: "",
        uuid: "",
        roleIds: [],
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" },
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" },
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }],
        roleIds: [{ required: true, trigger: "blur", message: "请选择应用端" }],
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
      // 注册开关
      register: true,
      redirect: undefined,
      appOptions: [
        {
          value: 2,
          label: "普通角色",
        },
        {
          value: 100,
          label: "课研人员",
        },
      ],
    };
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true,
    },
  },
  created() {
    this.getCode();
    this.getCookie();
    getoptionselect().then((res) => {
      this.appOptions = res.roles.sort((a, b) => {
        return a.roleSort - b.roleSort;
      });
    });
  },
  methods: {
    handleRoleChange(val) {
      if (Array.isArray(val)) {
        this.loginForm.roleIds = val;
      } else {
        this.loginForm.roleIds = [val];
      }
    },
    handleLoginType() {
      this.isAdmin = !this.isAdmin;
    },
    handleIsMultiple() {
      if (this.isMultiple) {
        // 如果切换到多选模式，确保 roleIds 是数组
        this.roleIds = Array.isArray(this.roleIds)
          ? this.roleIds
          : [this.roleIds];
      } else {
        // 如果切换到单选模式，确保 roleIds 是单个值
        this.roleIds = Array.isArray(this.roleIds)
          ? this.roleIds[0]
          : this.roleIds;
      }
    },

    getCode() {
      getCodeImg().then((res) => {
        this.captchaEnabled =
          res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get("rememberMe");
      const roleIds = Cookies.get("roleIds");
      const isAdmin = Cookies.get("isAdmin");
      const isMultiple = Cookies.get("isMultiple");
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password:
          password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe),
        roleIds: roleIds === undefined ? [] : roleIds.split(",").map(Number),
      };
      this.isAdmin = isAdmin === undefined ? this.isAdmin : isAdmin === "true";
      this.isMultiple =
        isMultiple === undefined ? this.isMultiple : isMultiple === "true";
      // 如果是管理员登录，清空应用端
      if (this.isAdmin) {
        this.loginForm.roleIds = [];
      }
      // 如果允许多选应用端，this.roleId转换为数组,否则转换为数字
      if (this.isMultiple) {
        this.roleIds = this.loginForm.roleIds;
      } else {
        this.roleIds = this.loginForm.roleIds[0];
      }
    },
    handleLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          if (this.isAdmin) {
            this.loginForm.roleIds = [];
          } else {
            if (this.isMultiple) {
              this.loginForm.roleIds = this.roleIds;
            } else {
              this.loginForm.roleIds = [this.roleIds];
            }
          }
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            Cookies.set("password", encrypt(this.loginForm.password), {
              expires: 30,
            });
            Cookies.set("rememberMe", this.loginForm.rememberMe, {
              expires: 30,
            });
            if (!this.isAdmin) {
              Cookies.set("roleIds", this.loginForm.roleIds, { expires: 30 });
            }
            Cookies.set("isAdmin", this.isAdmin, { expires: 30 });
            Cookies.set("isMultiple", this.isMultiple, { expires: 30 });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove("rememberMe");
            Cookies.remove("roleIds");
            Cookies.remove("isAdmin");
            Cookies.remove("isMultiple");
          }
          this.$store
            .dispatch("Login", this.loginForm)
            .then(() => {
              this.$router.push({ path: this.redirect || "/" }).catch(() => { });
            })
            .catch(() => {
              this.loading = false;
              if (this.captchaEnabled) {
                this.getCode();
              }
            });
        }
      });
    },
  },
};
</script>

<style rel="stylesheet/scss" lang="scss">
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
}

.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.login-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 5px 25px;

  .el-input {
    height: 38px;

    input {
      height: 38px;
    }
  }

  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}

.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}

.login-code {
  width: 33%;
  height: 38px;
  float: right;

  img {
    cursor: pointer;
    vertical-align: middle;
  }
}

.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}

.login-code-img {
  height: 38px;
}

.login-logo {
  width: 24px;
  height: 24px;
  vertical-align: middle;
  margin-right: 12px;
}
</style>

<style scoped>
.el-button.el-button--text {
  color: #337ab7;
}

.selectApp /deep/ .el-form-item__content {
  display: flex;
  justify-content: space-between;
  align-self: center;
  width: 100%;
}
</style>
