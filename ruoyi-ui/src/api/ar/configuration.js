import request from '@/utils/request'

// 查询出厂配置列表
export function listConfiguration(query) {
  return request({
    url: '/ar/configuration/list',
    method: 'get',
    params: query
  })
}

// 查询出厂配置详细
export function getConfiguration(id) {
  return request({
    url: '/ar/configuration/' + id,
    method: 'get'
  })
}

// 新增出厂配置
export function addConfiguration(data) {
  return request({
    url: '/ar/configuration',
    method: 'post',
    data: data
  })
}

// 修改出厂配置
export function updateConfiguration(data) {
  return request({
    url: '/ar/configuration',
    method: 'put',
    data: data
  })
}

// 删除出厂配置
export function delConfiguration(id) {
  return request({
    url: '/ar/configuration/' + id,
    method: 'delete'
  })
}
