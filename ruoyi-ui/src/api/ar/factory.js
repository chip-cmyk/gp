import request from '@/utils/request'

// 查询工厂列表
export function listFactory(query) {
  return request({
    url: '/ar/factory/list',
    method: 'get',
    params: query
  })
}

// 查询工厂详细
export function getFactory(factoryId) {
  return request({
    url: '/ar/factory/' + factoryId,
    method: 'get'
  })
}

// 新增工厂
export function addFactory(data) {
  return request({
    url: '/ar/factory',
    method: 'post',
    data: data
  })
}

// 修改工厂
export function updateFactory(data) {
  return request({
    url: '/ar/factory',
    method: 'put',
    data: data
  })
}

// 删除工厂
export function delFactory(factoryId) {
  return request({
    url: '/ar/factory/' + factoryId,
    method: 'delete'
  })
}
