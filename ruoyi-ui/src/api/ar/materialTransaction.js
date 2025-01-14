import request from '@/utils/request'

// 查询材料出入库单列表
export function listMaterialTransaction(query) {
  return request({
    url: '/ar/materialTransaction/list',
    method: 'get',
    params: query
  })
}

// 查询材料出入库单详细
export function getMaterialTransaction(transactionId) {
  return request({
    url: '/ar/materialTransaction/' + transactionId,
    method: 'get'
  })
}

// 新增材料出入库单
export function addMaterialTransaction(data) {
  return request({
    url: '/ar/materialTransaction',
    method: 'post',
    data: data
  })
}

// 修改材料出入库单
export function updateMaterialTransaction(data) {
  return request({
    url: '/ar/materialTransaction',
    method: 'put',
    data: data
  })
}

// 删除材料出入库单
export function delMaterialTransaction(transactionId) {
  return request({
    url: '/ar/materialTransaction/' + transactionId,
    method: 'delete'
  })
}
