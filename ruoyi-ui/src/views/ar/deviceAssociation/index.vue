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
    :usageStatusName="usageStatusName"
    hasDescription
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
import {
  listDeviceAssociation,
  getDeviceAssociation,
} from "@/api/ar/deviceAssociation";
import { listDevice, updateDevice } from "@/api/ar/device";

export default {
  name: "deviceAssociation",
  dicts: ["use_status"],
  components: {
    QrCodeAssociation,
  },
  data() {
    return {
      // 可配置data
      mainListName: "deviceAssociationList",
      subListName: "deviceList",
      moduleKey: "ar:deviceAssociation",
      associationName: "设备",
      mainId: "qrCodeId",
      subId: "deviceNumber",
      subMainId: "qrCodeNumber",
      exportName: "ar/deviceAssociation/",
      pageName: "deviceAssociation",
      usageStatusName: "status",
      subColumns: [
        {
          prop: "name",
          props: { label: "名称", width: "200" },
        },
        {
          prop: "description",
          props: { label: "描述", width: "300" },
        },
        {
          prop: "status",
          props: { label: "使用情况", width: "150" },
          render: {
            component: "dict-tag",
            props: (row) => ({
              options: this.dict.type.use_status,
              value: row[this.usageStatusName],
            }),
          },
        },
      ],
    };
  },
  methods: {
    // 可配置methods
    listMain(params) {
      return listDeviceAssociation(params);
    },
    getMainInfo(id) {
      return getDeviceAssociation(id);
    },
    listSub(params) {
      return listDevice(params);
    },
    updateSub(params) {
      return updateDevice(params);
    },
  },
};
</script>
