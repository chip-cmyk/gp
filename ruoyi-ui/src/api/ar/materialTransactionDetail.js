import request from '@/utils/request'

// 查询材料清单明细列表
export function listMaterialTransactionDetail(query) {
  return request({
    url: '/ar/materialTransactionDetail/list',
    method: 'get',
    params: query
  })
}

// 查询材料清单明细详细
export function getMaterialTransactionDetail(materialId) {
  return request({
    url: '/ar/materialTransactionDetail/' + materialId,
    method: 'get'
  })
}

// 新增材料清单明细
export function addMaterialTransactionDetail(data) {
  return request({
    url: '/ar/materialTransactionDetail',
    method: 'post',
    data: data
  })
}

// 修改材料清单明细
export function updateMaterialTransactionDetail(data) {
  return request({
    url: '/ar/materialTransactionDetail',
    method: 'put',
    data: data
  })
}

// 删除材料清单明细
export function delMaterialTransactionDetail(materialId) {
  return request({
    url: '/ar/materialTransactionDetail/' + materialId,
    method: 'delete'
  })
}
