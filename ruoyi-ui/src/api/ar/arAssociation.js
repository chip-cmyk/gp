import request from '@/utils/request'

// 查询AR内容关联列表
export function listArAssociation(query) {
  return request({
    url: '/ar/arAssociation/list',
    method: 'get',
    params: query
  })
}

// 查询AR内容关联详细
export function getArAssociation(qrCodeId) {
  return request({
    url: '/ar/arAssociation/' + qrCodeId,
    method: 'get'
  })
}

// 新增AR内容关联
export function addArAssociation(data) {
  return request({
    url: '/ar/arAssociation',
    method: 'post',
    data: data
  })
}

// 修改AR内容关联
export function updateArAssociation(data) {
  return request({
    url: '/ar/arAssociation',
    method: 'put',
    data: data
  })
}

// 删除AR内容关联
export function delArAssociation(qrCodeId) {
  return request({
    url: '/ar/arAssociation/' + qrCodeId,
    method: 'delete'
  })
}
