<template>
  <el-color-picker
    v-model="theme"
    :predefine="[
      '#409EFF',
      '#1890ff',
      '#304156',
      '#212121',
      '#11a983',
      '#13c2c2',
      '#6959CD',
      '#f5222d',
    ]"
    class="theme-picker"
    popper-class="theme-picker-dropdown"
  />
</template>

<script>
const ORIGINAL_THEME = "#409EFF"; // default color

export default {
  data() {
    return {
      chalk: "", // content of theme-chalk css
      theme: "",
    };
  },
  computed: {
    defaultTheme() {
      return this.$store.state.settings.theme;
    },
    defaultSideTheme() {
      return this.$store.state.settings.sideTheme;
    },
  },
  watch: {
    defaultTheme: {
      handler: function (val, oldVal) {
        this.theme = val;
      },
      immediate: true,
    },
    async theme(val) {
      await this.setTheme(val);
    },
    async defaultSideTheme() {
      await this.updateSideHoverStyle(this.defaultTheme);
    },
  },
  created() {
    if (this.defaultTheme !== ORIGINAL_THEME) {
      this.setTheme(this.defaultTheme);
    }
  },
  methods: {
    async setTheme(val) {
      const oldVal = this.chalk ? this.theme : ORIGINAL_THEME;
      if (typeof val !== "string") return;
      const themeCluster = this.getThemeCluster(val.replace("#", ""));
      const originalCluster = this.getThemeCluster(oldVal.replace("#", ""));

      const getHandler = (variable, id) => {
        return () => {
          const originalCluster = this.getThemeCluster(
            ORIGINAL_THEME.replace("#", "")
          );
          const newStyle = this.updateStyle(
            this[variable],
            originalCluster,
            themeCluster
          );

          let styleTag = document.getElementById(id);
          if (!styleTag) {
            styleTag = document.createElement("style");
            styleTag.setAttribute("id", id);
            document.head.appendChild(styleTag);
          }
          styleTag.innerText = newStyle;
        };
      };

      if (!this.chalk) {
        const url = `/styles/theme-chalk/index.css`;
        await this.getCSSString(url, "chalk");
      }

      const chalkHandler = getHandler("chalk", "chalk-style");
      chalkHandler();

      const styles = [].slice
        .call(document.querySelectorAll("style"))
        .filter((style) => {
          const text = style.innerText;
          return (
            new RegExp(oldVal, "i").test(text) && !/Chalk Variables/.test(text)
          );
        });
      styles.forEach((style) => {
        const { innerText } = style;
        if (typeof innerText !== "string") return;
        style.innerText = this.updateStyle(
          innerText,
          originalCluster,
          themeCluster
        );
      });

      // 处理具有 theme-dependent 类名的元素
      // const themeDependentElements = document.querySelectorAll(
      //   ".el-submenu__title:hover,.el-submenu.el-menu-item:hover"
      // );
      // themeDependentElements.forEach((element) => {
      //   element.style.backgroundColor = val + "1A"; // 10% 透明度，假设主题色为十六进制
      //   element.style.backgroundColor = val + "1A!important"; // 添加!important 提高优先级
      // });

      // const hoverStyle = document.createElement("style");
      // hoverStyle.innerHTML = `.el-menu-item:hover,.el-submenu__title:hover,.el-submenu.el-menu-item:hover { background-color: ${
      //   val + "1A"
      // }!important; }`;
      // document.head.appendChild(hoverStyle);

      // const loadingStyle = document.querySelector(
      //   "#loader-wrapper .loader-section"
      // );
      // // alert(loadingStyle);
      // if (loadingStyle) {
      //   loadingStyle.style.backgroundColor = val;
      // }

      this.updateSideHoverStyle(val);

      this.$emit("change", val);
    },

    updateStyle(style, oldCluster, newCluster) {
      let newStyle = style;
      oldCluster.forEach((color, index) => {
        newStyle = newStyle.replace(new RegExp(color, "ig"), newCluster[index]);
      });
      return newStyle;
    },

    getCSSString(url, variable) {
      return new Promise((resolve) => {
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = () => {
          if (xhr.readyState === 4 && xhr.status === 200) {
            this[variable] = xhr.responseText.replace(/@font-face{[^}]+}/, "");
            resolve();
          }
        };
        xhr.open("GET", url);
        xhr.send();
      });
    },

    getThemeCluster(theme) {
      const tintColor = (color, tint) => {
        let red = parseInt(color.slice(0, 2), 16);
        let green = parseInt(color.slice(2, 4), 16);
        let blue = parseInt(color.slice(4, 6), 16);

        if (tint === 0) {
          // when primary color is in its rgb space
          return [red, green, blue].join(",");
        } else {
          red += Math.round(tint * (255 - red));
          green += Math.round(tint * (255 - green));
          blue += Math.round(tint * (255 - blue));

          red = red.toString(16);
          green = green.toString(16);
          blue = blue.toString(16);

          return `#${red}${green}${blue}`;
        }
      };

      const shadeColor = (color, shade) => {
        let red = parseInt(color.slice(0, 2), 16);
        let green = parseInt(color.slice(2, 4), 16);
        let blue = parseInt(color.slice(4, 6), 16);

        red = Math.round((1 - shade) * red);
        green = Math.round((1 - shade) * green);
        blue = Math.round((1 - shade) * blue);

        red = red.toString(16);
        green = green.toString(16);
        blue = blue.toString(16);

        return `#${red}${green}${blue}`;
      };

      const clusters = [theme];
      for (let i = 0; i <= 9; i++) {
        clusters.push(tintColor(theme, Number((i / 10).toFixed(2))));
      }
      clusters.push(shadeColor(theme, 0.1));
      return clusters;
    },

    updateSideHoverStyle(val) {
      // 根据 sideTheme 判断是否为亮色主题
      if (this.$store.state.settings.sideTheme === "theme-light") {
        let hoverStyle = document.getElementById("hover-style");
        if (!hoverStyle) {
          hoverStyle = document.createElement("style");
          hoverStyle.setAttribute("id", "hover-style");
          document.head.appendChild(hoverStyle);
        }
        hoverStyle.innerHTML = `.el-menu-item:hover,.el-submenu__title:hover,.el-submenu.el-menu-item:hover,.el-menu-item.is-active,.el-submenu__title.is-active,.el-submenu.el-menu-item.is-active { background-color: ${
          val + "1A"
        }!important; }`;
      } else {
        const hoverStyle = document.getElementById("hover-style");
        if (hoverStyle) {
          hoverStyle.remove();
        }
      }
    },
  },
};
</script>

<style>
.theme-message,
.theme-picker-dropdown {
  z-index: 99999 !important;
}

.theme-picker .el-color-picker__trigger {
  height: 26px !important;
  width: 26px !important;
  padding: 2px;
}

.theme-picker-dropdown .el-color-dropdown__link-btn {
  display: none;
}
</style>
