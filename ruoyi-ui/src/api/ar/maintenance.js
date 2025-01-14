import request from '@/utils/request'

// 查询运维记录列表
export function listMaintenance(query) {
  return request({
    url: '/ar/maintenance/list',
    method: 'get',
    params: query
  })
}

// 查询运维记录详细
export function getMaintenance(recordId) {
  return request({
    url: '/ar/maintenance/' + recordId,
    method: 'get'
  })
}

// 新增运维记录
export function addMaintenance(data) {
  return request({
    url: '/ar/maintenance',
    method: 'post',
    data: data
  })
}

// 修改运维记录
export function updateMaintenance(data) {
  return request({
    url: '/ar/maintenance',
    method: 'put',
    data: data
  })
}

// 删除运维记录
export function delMaintenance(recordId) {
  return request({
    url: '/ar/maintenance/' + recordId,
    method: 'delete'
  })
}
