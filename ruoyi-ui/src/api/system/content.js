import request from '@/utils/request'

// 查询VR内容列表
export function listContent(query) {
  return request({
    url: '/system/content/list',
    method: 'get',
    params: query
  })
}

// 查询VR内容详细
export function getContent(contentId) {
  return request({
    url: '/system/content/' + contentId,
    method: 'get'
  })
}

// 新增VR内容
export function addContent(data) {
  return request({
    url: '/system/content',
    method: 'post',
    data: data
  })
}

// 修改VR内容
export function updateContent(data) {
  return request({
    url: '/system/content',
    method: 'put',
    data: data
  })
}

// 删除VR内容
export function delContent(contentId) {
  return request({
    url: '/system/content/' + contentId,
    method: 'delete'
  })
}
