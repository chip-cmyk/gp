module.exports = {
  env: {
    browser: true,
    es2021: true,
    // node
    node: true,
  },
  extends: ["eslint:recommended", "plugin:vue/essential"],
  parserOptions: {
    ecmaVersion: 12,
    sourceType: "module",
  },
  plugins: ["vue"],
  rules: {
    "vue/multi-word-component-names": "off",
    "vue/no-reserved-component-names": "off",
    "no-useless-escape": "off",
    // 未使用的变量设为提示
    "no-unused-vars": "warn",
    // 未使用的表达式设为警告
    "no-unused-expressions": "warn",
    // 未使用的函数参数设为警告
    // "no-unused-vars": "off",
    //未使用的函数参数不警告
    "no-unused-vars": ["warn", { args: "none" }],
    // 未定义设为警告
    "no-undef": "error",
    "no-console": ["warn", { allow: ["warn", "error"] }],
    //允许的空行数2
    "no-multiple-empty-lines": [
      "warn",
      {
        max: 2,
        maxEOF: 0,
        maxBOF: 0,
      },
    ],
  },
};
