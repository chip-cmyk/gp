import request from '@/utils/request'

// 查询沙盘分区列表
export function listZone(query) {
  return request({
    url: '/ar/zone/list',
    method: 'get',
    params: query
  })
}

// 查询沙盘分区详细
export function getZone(zoneId) {
  return request({
    url: '/ar/zone/' + zoneId,
    method: 'get'
  })
}

// 新增沙盘分区
export function addZone(data) {
  return request({
    url: '/ar/zone',
    method: 'post',
    data: data
  })
}

// 修改沙盘分区
export function updateZone(data) {
  return request({
    url: '/ar/zone',
    method: 'put',
    data: data
  })
}

// 删除沙盘分区
export function delZone(zoneId) {
  return request({
    url: '/ar/zone/' + zoneId,
    method: 'delete'
  })
}
