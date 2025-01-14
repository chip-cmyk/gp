import request from '@/utils/request'

// 查询产品信息列表
export function listProduct(query) {
  return request({
    url: '/ar/product/list',
    method: 'get',
    params: query
  })
}

// 查询产品信息详细
export function getProduct(productId) {
  return request({
    url: '/ar/product/' + productId,
    method: 'get'
  })
}

// 新增产品信息
export function addProduct(data) {
  return request({
    url: '/ar/product',
    method: 'post',
    data: data
  })
}

// 修改产品信息
export function updateProduct(data) {
  return request({
    url: '/ar/product',
    method: 'put',
    data: data
  })
}

// 删除产品信息
export function delProduct(productId) {
  return request({
    url: '/ar/product/' + productId,
    method: 'delete'
  })
}
