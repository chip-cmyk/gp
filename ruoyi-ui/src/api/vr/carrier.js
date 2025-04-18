import request from '@/utils/request'

// 查询载体列表
export function listCarrier(query) {
  return request({
    url: '/vr/carrier/list',
    method: 'get',
    params: query
  })
}

// 查询载体详细
export function getCarrier(carrierId) {
  return request({
    url: '/vr/carrier/' + carrierId,
    method: 'get'
  })
}

// 新增载体
export function addCarrier(data) {
  return request({
    url: '/vr/carrier',
    method: 'post',
    data: data
  })
}

// 修改载体
export function updateCarrier(data) {
  return request({
    url: '/vr/carrier',
    method: 'put',
    data: data
  })
}

// 删除载体
export function delCarrier(carrierId) {
  return request({
    url: '/vr/carrier/' + carrierId,
    method: 'delete'
  })
}
