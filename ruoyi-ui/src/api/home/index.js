import request from "@/utils/request";

export function getHomeData() {
  return request({
    url: "/common/getHomeData",
    method: "get",
  });
}

export function getMonthlyRegistrations(startDate, endDate) {
  return request({
    url: "/common/monthly-registrations",
    method: "get",
    params: {
      startDate,
      endDate,
    },
  });
}
