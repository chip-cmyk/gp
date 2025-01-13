import request from '@/utils/request'

// 查询作品列表
export function listWork(query) {
  return request({
    url: '/system/work/list',
    method: 'get',
    params: query
  })
}

// 查询作品详细
export function getWork(workId) {
  return request({
    url: '/system/work/' + workId,
    method: 'get'
  })
}

// 新增作品
export function addWork(data) {
  return request({
    url: '/system/work',
    method: 'post',
    data: data
  })
}

// 修改作品
export function updateWork(data) {
  return request({
    url: '/system/work',
    method: 'put',
    data: data
  })
}

// 删除作品
export function delWork(workId) {
  return request({
    url: '/system/work/' + workId,
    method: 'delete'
  })
}
