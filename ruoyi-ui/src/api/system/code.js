import request from '@/utils/request'

// 查询二维码列表
export function listCode(query) {
  return request({
    url: '/system/code/list',
    method: 'get',
    params: query
  })
}

// 查询二维码详细
export function getCode(qrCodeId) {
  return request({
    url: '/system/code/' + qrCodeId,
    method: 'get'
  })
}

// 新增二维码
export function addCode(data) {
  return request({
    url: '/system/code',
    method: 'post',
    data: data
  })
}

// 修改二维码
export function updateCode(data) {
  return request({
    url: '/system/code',
    method: 'put',
    data: data
  })
}

// 删除二维码
export function delCode(qrCodeId) {
  return request({
    url: '/system/code/' + qrCodeId,
    method: 'delete'
  })
}
