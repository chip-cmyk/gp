import request from '@/utils/request'

// 查询产品出入库单列表
export function listProductTransaction(query) {
  return request({
    url: '/ar/productTransaction/list',
    method: 'get',
    params: query
  })
}

// 查询产品出入库单详细
export function getProductTransaction(transactionId) {
  return request({
    url: '/ar/productTransaction/' + transactionId,
    method: 'get'
  })
}

// 新增产品出入库单
export function addProductTransaction(data) {
  return request({
    url: '/ar/productTransaction',
    method: 'post',
    data: data
  })
}

// 修改产品出入库单
export function updateProductTransaction(data) {
  return request({
    url: '/ar/productTransaction',
    method: 'put',
    data: data
  })
}

// 删除产品出入库单
export function delProductTransaction(transactionId) {
  return request({
    url: '/ar/productTransaction/' + transactionId,
    method: 'delete'
  })
}
