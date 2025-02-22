import request from '@/utils/request'

// 查询AR应用列表
export function listApplications(query) {
  return request({
    url: '/ar/applications/list',
    method: 'get',
    params: query
  })
}

// 查询AR应用详细
export function getApplications(ApplicationID) {
  return request({
    url: '/ar/applications/' + ApplicationID,
    method: 'get'
  })
}

// 新增AR应用
export function addApplications(data) {
  return request({
    url: '/ar/applications',
    method: 'post',
    data: data
  })
}

// 修改AR应用
export function updateApplications(data) {
  return request({
    url: '/ar/applications',
    method: 'put',
    data: data
  })
}

// 删除AR应用
export function delApplications(ApplicationID) {
  return request({
    url: '/ar/applications/' + ApplicationID,
    method: 'delete'
  })
}
