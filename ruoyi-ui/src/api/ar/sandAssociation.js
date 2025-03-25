import request from '@/utils/request'

// 查询二维码_沙盘分区关联列表
export function listSandAssociation(query) {
  return request({
    url: '/ar/sandAssociation/list',
    method: 'get',
    params: query
  })
}

// 查询二维码_沙盘分区关联详细
export function getSandAssociation(qrCodeId) {
  return request({
    url: '/ar/sandAssociation/' + qrCodeId,
    method: 'get'
  })
}

// 新增二维码_沙盘分区关联
export function addSandAssociation(data) {
  return request({
    url: '/ar/sandAssociation',
    method: 'post',
    data: data
  })
}

// 修改二维码_沙盘分区关联
export function updateSandAssociation(data) {
  return request({
    url: '/ar/sandAssociation',
    method: 'put',
    data: data
  })
}

// 删除二维码_沙盘分区关联
export function delSandAssociation(qrCodeId) {
  return request({
    url: '/ar/sandAssociation/' + qrCodeId,
    method: 'delete'
  })
}
