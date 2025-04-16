<template>
  <div class="user-card">
    <div class="user-avatar"><img :src="avatar" alt="userAvatar" /></div>
    <div class="user-info">
      <div class="greeting">{{ timeSlot }}好，{{ user.nickName }}，欢迎来到{{ title }}！</div>
      <div class="slogan">有你创新，创新由你</div>
    </div>
  </div>
</template>

<script>
import { getUserProfile } from "@/api/system/user";
import { mapGetters } from "vuex";
import { getTimeSlot } from "@/utils";

export default {
  name: "UserCard",
  data() {
    return {
      timeSlot: getTimeSlot(),
      user: {},
      title: process.env.VUE_APP_TITLE,
    };
  },
  computed: {
    ...mapGetters(["name", "avatar"]),
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      getUserProfile().then((response) => {
        this.user = response.data;
      });
    },
  },
};
</script>

<style scoped>
.user-card {
  display: flex;
  align-items: center;
  gap: 30px;
  flex: 1;
}

.user-avatar {
  display: flex;
  justify-content: center;
}

.user-avatar img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
}

.user-info {
  display: inline-flex;
  min-height: 80px;
  flex-direction: column;
  justify-content: center;
  gap: 16px;
}

.greeting {
  font-size: 20px;
  color: #333;
  font-weight: bold;
}

.slogan {
  font-size: 16px;
  color: #666;
}

@media (max-width: 768px) {
  .greeting {
    font-size: 16px;
  }
}
</style>
