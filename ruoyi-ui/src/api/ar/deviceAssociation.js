import request from '@/utils/request'

// 查询设备关联列表
export function listDeviceAssociation(query) {
  return request({
    url: '/ar/deviceAssociation/list',
    method: 'get',
    params: query
  })
}

// 查询设备关联详细
export function getDeviceAssociation(qrCodeId) {
  return request({
    url: '/ar/deviceAssociation/' + qrCodeId,
    method: 'get'
  })
}

// 新增设备关联
export function addDeviceAssociation(data) {
  return request({
    url: '/ar/deviceAssociation',
    method: 'post',
    data: data
  })
}

// 修改设备关联
export function updateDeviceAssociation(data) {
  return request({
    url: '/ar/deviceAssociation',
    method: 'put',
    data: data
  })
}

// 删除设备关联
export function delDeviceAssociation(qrCodeId) {
  return request({
    url: '/ar/deviceAssociation/' + qrCodeId,
    method: 'delete'
  })
}
