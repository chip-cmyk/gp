import request from '@/utils/request'

// 查询生产批次列表
export function listProductBatch(query) {
  return request({
    url: '/ar/productBatch/list',
    method: 'get',
    params: query
  })
}

// 查询生产批次详细
export function getProductBatch(batchId) {
  return request({
    url: '/ar/productBatch/' + batchId,
    method: 'get'
  })
}

// 新增生产批次
export function addProductBatch(data) {
  return request({
    url: '/ar/productBatch',
    method: 'post',
    data: data
  })
}

// 修改生产批次
export function updateProductBatch(data) {
  return request({
    url: '/ar/productBatch',
    method: 'put',
    data: data
  })
}

// 删除生产批次
export function delProductBatch(batchId) {
  return request({
    url: '/ar/productBatch/' + batchId,
    method: 'delete'
  })
}
