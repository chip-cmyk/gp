import request from '@/utils/request'

// 查询产品清单明细列表
export function listProductTransactionDetail(query) {
  return request({
    url: '/ar/productTransactionDetail/list',
    method: 'get',
    params: query
  })
}

// 查询产品清单明细详细
export function getProductTransactionDetail(productId) {
  return request({
    url: '/ar/productTransactionDetail/' + productId,
    method: 'get'
  })
}

// 新增产品清单明细
export function addProductTransactionDetail(data) {
  return request({
    url: '/ar/productTransactionDetail',
    method: 'post',
    data: data
  })
}

// 修改产品清单明细
export function updateProductTransactionDetail(data) {
  return request({
    url: '/ar/productTransactionDetail',
    method: 'put',
    data: data
  })
}

// 删除产品清单明细
export function delProductTransactionDetail(productId) {
  return request({
    url: '/ar/productTransactionDetail/' + productId,
    method: 'delete'
  })
}
