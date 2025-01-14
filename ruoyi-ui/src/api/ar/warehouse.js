import request from '@/utils/request'

// 查询库区列表
export function listWarehouse(query) {
  return request({
    url: '/ar/warehouse/list',
    method: 'get',
    params: query
  })
}

// 查询库区详细
export function getWarehouse(zoneId) {
  return request({
    url: '/ar/warehouse/' + zoneId,
    method: 'get'
  })
}

// 新增库区
export function addWarehouse(data) {
  return request({
    url: '/ar/warehouse',
    method: 'post',
    data: data
  })
}

// 修改库区
export function updateWarehouse(data) {
  return request({
    url: '/ar/warehouse',
    method: 'put',
    data: data
  })
}

// 删除库区
export function delWarehouse(zoneId) {
  return request({
    url: '/ar/warehouse/' + zoneId,
    method: 'delete'
  })
}
