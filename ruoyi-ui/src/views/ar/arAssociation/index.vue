<template>
  <QrCodeAssociation
    :mainListName="mainListName"
    :subListName="subListName"
    :moduleKey="moduleKey"
    :associationName="associationName"
    :mainId="mainId"
    :subId="subId"
    :subMainId="subMainId"
    :exportName="exportName"
    :pageName="pageName"
    hasCategory
    hasUsageStatus
    :subColumns="subColumns"
    :listMain="listMain"
    :getMainInfo="getMainInfo"
    :listSub="listSub"
    :updateSub="updateSub"
  />
</template>

<script>
import QrCodeAssociation from "@/views/ar/components/qrCodeAssociation";
import { listArAssociation, getArAssociation } from "@/api/ar/arAssociation";
import { listContent, updateContent } from "@/api/ar/content";

export default {
  name: "ArAssociation",
  dicts: ["use_status"],
  components: {
    QrCodeAssociation,
  },
  data() {
    return {
      // 可配置data
      mainListName: "arAssociationList",
      subListName: "arContentList",
      moduleKey: "ar:arAssociation",
      associationName: "AR内容",
      mainId: "qrCodeId",
      subId: "arContentId",
      subMainId: "qrCodeId",
      exportName: "ar/arAssociation/",
      pageName: "arAssociation",
      subColumns: [
        {
          prop: "name",
          props: { label: "名称" },
        },
        {
          prop: "category",
          props: { label: "类别", width: "150" },
        },
        {
          prop: "description",
          props: { label: "描述", width: "300" },
        },
        {
          prop: "usageStatus",
          props: { label: "使用情况", width: "150" },
          render: {
            component: "dict-tag",
            props: (row) => ({
              options: this.dict.type.use_status,
              value: row.usageStatus,
            }),
          },
        },
      ],
    };
  },
  methods: {
    // 可配置methods
    listMain(params) {
      return listArAssociation(params);
    },
    getMainInfo(id) {
      return getArAssociation(id);
    },
    listSub(params) {
      return listContent(params);
    },
    updateSub(params) {
      return updateContent(params);
    },
  },
};
</script>
