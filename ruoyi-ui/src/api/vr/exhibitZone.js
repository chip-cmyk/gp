import request from '@/utils/request'

// 查询VR展区列表
export function listExhibitZone(query) {
  return request({
    url: '/vr/exhibitZone/list',
    method: 'get',
    params: query
  })
}

// 查询VR展区详细
export function getExhibitZone(exhibitZoneId) {
  return request({
    url: '/vr/exhibitZone/' + exhibitZoneId,
    method: 'get'
  })
}

// 新增VR展区
export function addExhibitZone(data) {
  return request({
    url: '/vr/exhibitZone',
    method: 'post',
    data: data
  })
}

// 修改VR展区
export function updateExhibitZone(data) {
  return request({
    url: '/vr/exhibitZone',
    method: 'put',
    data: data
  })
}

// 删除VR展区
export function delExhibitZone(exhibitZoneId) {
  return request({
    url: '/vr/exhibitZone/' + exhibitZoneId,
    method: 'delete'
  })
}
