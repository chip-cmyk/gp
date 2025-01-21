import request from '@/utils/request'

// 查询生产批次列表
export function listBatch(query) {
  return request({
    url: '/ar/batch/list',
    method: 'get',
    params: query
  })
}

// 查询生产批次详细
export function getBatch(batchId) {
  return request({
    url: '/ar/batch/' + batchId,
    method: 'get'
  })
}

// 新增生产批次
export function addBatch(data) {
  return request({
    url: '/ar/batch',
    method: 'post',
    data: data
  })
}

// 修改生产批次
export function updateBatch(data) {
  return request({
    url: '/ar/batch',
    method: 'put',
    data: data
  })
}

// 删除生产批次
export function delBatch(batchId) {
  return request({
    url: '/ar/batch/' + batchId,
    method: 'delete'
  })
}
