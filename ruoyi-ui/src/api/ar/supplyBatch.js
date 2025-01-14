import request from '@/utils/request'

// 查询供应批次列表
export function listSupplyBatch(query) {
  return request({
    url: '/ar/supplyBatch/list',
    method: 'get',
    params: query
  })
}

// 查询供应批次详细
export function getSupplyBatch(batchId) {
  return request({
    url: '/ar/supplyBatch/' + batchId,
    method: 'get'
  })
}

// 新增供应批次
export function addSupplyBatch(data) {
  return request({
    url: '/ar/supplyBatch',
    method: 'post',
    data: data
  })
}

// 修改供应批次
export function updateSupplyBatch(data) {
  return request({
    url: '/ar/supplyBatch',
    method: 'put',
    data: data
  })
}

// 删除供应批次
export function delSupplyBatch(batchId) {
  return request({
    url: '/ar/supplyBatch/' + batchId,
    method: 'delete'
  })
}
