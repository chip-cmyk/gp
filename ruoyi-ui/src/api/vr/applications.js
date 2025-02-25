import request from '@/utils/request'

// 查询VR应用列表
export function listApplications(query) {
  return request({
    url: '/vr/applications/list',
    method: 'get',
    params: query
  })
}

// 查询VR应用详细
export function getApplications(appId) {
  return request({
    url: '/vr/applications/' + appId,
    method: 'get'
  })
}

// 新增VR应用
export function addApplications(data) {
  return request({
    url: '/vr/applications',
    method: 'post',
    data: data
  })
}

// 修改VR应用
export function updateApplications(data) {
  return request({
    url: '/vr/applications',
    method: 'put',
    data: data
  })
}

// 删除VR应用
export function delApplications(appId) {
  return request({
    url: '/vr/applications/' + appId,
    method: 'delete'
  })
}
