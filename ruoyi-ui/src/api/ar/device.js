import request from '@/utils/request'

// 查询设备列表
export function listDevice(query) {
  return request({
    url: '/ar/device/list',
    method: 'get',
    params: query
  })
}

// 查询设备详细
export function getDevice(deviceNumber) {
  return request({
    url: '/ar/device/' + deviceNumber,
    method: 'get'
  })
}

// 新增设备
export function addDevice(data) {
  return request({
    url: '/ar/device',
    method: 'post',
    data: data
  })
}

// 修改设备
export function updateDevice(data) {
  return request({
    url: '/ar/device',
    method: 'put',
    data: data
  })
}

// 删除设备
export function delDevice(deviceNumber) {
  return request({
    url: '/ar/device/' + deviceNumber,
    method: 'delete'
  })
}
