import request from '@/utils/request'

// 查询VR素材列表
export function listMaterial(query) {
  return request({
    url: '/system/material/list',
    method: 'get',
    params: query
  })
}

// 查询VR素材详细
export function getMaterial(materialId) {
  return request({
    url: '/system/material/' + materialId,
    method: 'get'
  })
}

// 新增VR素材
export function addMaterial(data) {
  return request({
    url: '/system/material',
    method: 'post',
    data: data
  })
}

// 修改VR素材
export function updateMaterial(data) {
  return request({
    url: '/system/material',
    method: 'put',
    data: data
  })
}

// 删除VR素材
export function delMaterial(materialId) {
  return request({
    url: '/system/material/' + materialId,
    method: 'delete'
  })
}
