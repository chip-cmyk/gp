import defaultSettings from "@/settings";

// this.$store.state.settings.appTitle

const {
  sideTheme,
  showSettings,
  topNav,
  tagsView,
  fixedHeader,
  sidebarLogo,
  dynamicTitle,
} = defaultSettings;

const storageSetting = JSON.parse(localStorage.getItem("layout-setting")) || "";
const state = {
  appTitle: process.env.VUE_APP_TITLE || "合作创新平台",
  title: "",
  theme: storageSetting.theme || "#13C2C2",
  sideTheme: storageSetting.sideTheme || sideTheme,
  showSettings: showSettings,
  topNav: storageSetting.topNav === undefined ? topNav : storageSetting.topNav,
  tagsView:
    storageSetting.tagsView === undefined ? tagsView : storageSetting.tagsView,
  fixedHeader:
    storageSetting.fixedHeader === undefined
      ? fixedHeader
      : storageSetting.fixedHeader,
  sidebarLogo:
    storageSetting.sidebarLogo === undefined
      ? sidebarLogo
      : storageSetting.sidebarLogo,
  dynamicTitle:
    storageSetting.dynamicTitle === undefined
      ? dynamicTitle
      : storageSetting.dynamicTitle,
};
const mutations = {
  CHANGE_SETTING: (state, { key, value }) => {
    if (state.hasOwnProperty(key)) {
      state[key] = value;
    }
  },
};

const getters = {
  // 根据用户角色动态计算标题
  appTitle: (state, getters, rootState, rootGetters) => {
    const roles = rootGetters.roles; // 从根级别的 getters 中获取 roles
    if (roles.includes("admin")) {
      return `${state.appTitle} - 管理端`;
    } else if (roles.includes("common") || roles.includes("research")) {
      return `${state.appTitle} - 应用端`;
    }
    // 根据 roles 动态计算标题
    return state.appTitle;
  },
};

const actions = {
  // 修改布局设置
  changeSetting({ commit }, data) {
    commit("CHANGE_SETTING", data);
  },
  // 设置网页标题
  setTitle({ commit }, title) {
    state.title = title;
  },
};

export default {
  namespaced: true,
  state,
  mutations,
  getters,
  actions,
};
