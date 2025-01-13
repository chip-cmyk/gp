import request from '@/utils/request'

// 查询AR内容列表
export function listArcontent(query) {
  return request({
    url: '/ar/arcontent/list',
    method: 'get',
    params: query
  })
}

// 查询AR内容详细
export function getArcontent(contentId) {
  return request({
    url: '/ar/arcontent/' + contentId,
    method: 'get'
  })
}

// 新增AR内容
export function addArcontent(data) {
  return request({
    url: '/ar/arcontent',
    method: 'post',
    data: data
  })
}

// 修改AR内容
export function updateArcontent(data) {
  return request({
    url: '/ar/arcontent',
    method: 'put',
    data: data
  })
}

// 删除AR内容
export function delArcontent(contentId) {
  return request({
    url: '/ar/arcontent/' + contentId,
    method: 'delete'
  })
}
