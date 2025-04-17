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
    :hasDescription="true"
    :subColumns="subColumns"
    :listMain="listMain"
    :getMainInfo="getMainInfo"
    :listSub="listSub"
    :updateSub="updateSub"
  />
</template>

<script>
import QrCodeAssociation from "@/views/ar/components/qrCodeAssociation";
import {
  listSandAssociation,
  getSandAssociation,
} from "@/api/ar/sandAssociation";
import { listZone, updateZone } from "@/api/ar/zone";

export default {
  name: "sandAssociation",
  dicts: ["use_status"],
  components: {
    QrCodeAssociation,
  },
  data() {
    return {
      // 可配置data
      mainListName: "sandAssociationList",
      subListName: "sandboxZoneList",
      moduleKey: "ar:sandAssociation",
      associationName: "沙盘分区",
      mainId: "qrCodeId",
      subId: "zoneId",
      subMainId: "qrCodeId",
      exportName: "ar/sandAssociation/",
      pageName: "sandAssociation",
      subColumns: [
        {
          prop: "name",
          props: { label: "名称", width: "220" },
        },
        {
          prop: "description",
          props: { label: "描述", width: "420" },
        },
      ],
    };
  },
  methods: {
    // 可配置methods
    listMain(params) {
      return listSandAssociation(params);
    },
    getMainInfo(id) {
      return getSandAssociation(id);
    },
    listSub(params) {
      return listZone(params);
    },
    updateSub(params) {
      return updateZone(params);
    },
  },
};
</script>
