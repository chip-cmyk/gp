import request from '@/utils/request'

// 查询产品库存列表
export function listInventory(query) {
  return request({
    url: '/system/inventory/list',
    method: 'get',
    params: query
  })
}

// 查询产品库存详细
export function getInventory(productId) {
  return request({
    url: '/system/inventory/' + productId,
    method: 'get'
  })
}

// 新增产品库存
export function addInventory(data) {
  return request({
    url: '/system/inventory',
    method: 'post',
    data: data
  })
}

// 修改产品库存
export function updateInventory(data) {
  return request({
    url: '/system/inventory',
    method: 'put',
    data: data
  })
}

// 删除产品库存
export function delInventory(productId) {
  return request({
    url: '/system/inventory/' + productId,
    method: 'delete'
  })
}
