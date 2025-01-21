import request from '@/utils/request'

// 查询AR内容列表
export function listContent(query) {
  return request({
    url: '/ar/content/list',
    method: 'get',
    params: query
  })
}

// 查询AR内容详细
export function getContent(arContentId) {
  return request({
    url: '/ar/content/' + arContentId,
    method: 'get'
  })
}

// 新增AR内容
export function addContent(data) {
  return request({
    url: '/ar/content',
    method: 'post',
    data: data
  })
}

// 修改AR内容
export function updateContent(data) {
  return request({
    url: '/ar/content',
    method: 'put',
    data: data
  })
}

// 删除AR内容
export function delContent(arContentId) {
  return request({
    url: '/ar/content/' + arContentId,
    method: 'delete'
  })
}
