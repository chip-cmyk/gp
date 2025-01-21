import request from '@/utils/request'

// 查询能耗清单列表
export function listConsumption(query) {
  return request({
    url: '/ar/consumption/list',
    method: 'get',
    params: query
  })
}

// 查询能耗清单详细
export function getConsumption(energyId) {
  return request({
    url: '/ar/consumption/' + energyId,
    method: 'get'
  })
}

// 新增能耗清单
export function addConsumption(data) {
  return request({
    url: '/ar/consumption',
    method: 'post',
    data: data
  })
}

// 修改能耗清单
export function updateConsumption(data) {
  return request({
    url: '/ar/consumption',
    method: 'put',
    data: data
  })
}

// 删除能耗清单
export function delConsumption(energyId) {
  return request({
    url: '/ar/consumption/' + energyId,
    method: 'delete'
  })
}
