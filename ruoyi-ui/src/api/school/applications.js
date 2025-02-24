import request from '@/utils/request'

// 查询校企应用列表
export function listApplications(query) {
  return request({
    url: '/school/applications/list',
    method: 'get',
    params: query
  })
}

// 查询校企应用详细
export function getApplications(appId) {
  return request({
    url: '/school/applications/' + appId,
    method: 'get'
  })
}

// 新增校企应用
export function addApplications(data) {
  return request({
    url: '/school/applications',
    method: 'post',
    data: data
  })
}

// 修改校企应用
export function updateApplications(data) {
  return request({
    url: '/school/applications',
    method: 'put',
    data: data
  })
}

// 删除校企应用
export function delApplications(appId) {
  return request({
    url: '/school/applications/' + appId,
    method: 'delete'
  })
}
