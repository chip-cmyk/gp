import request from '@/utils/request'

// 查询材料信息列表
export function listMaterial(query) {
  return request({
    url: '/ar/material/list',
    method: 'get',
    params: query
  })
}

// 查询材料信息详细
export function getMaterial(materialId) {
  return request({
    url: '/ar/material/' + materialId,
    method: 'get'
  })
}

// 新增材料信息
export function addMaterial(data) {
  return request({
    url: '/ar/material',
    method: 'post',
    data: data
  })
}

// 修改材料信息
export function updateMaterial(data) {
  return request({
    url: '/ar/material',
    method: 'put',
    data: data
  })
}

// 删除材料信息
export function delMaterial(materialId) {
  return request({
    url: '/ar/material/' + materialId,
    method: 'delete'
  })
}
