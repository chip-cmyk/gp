import request from '@/utils/request'

// 查询合作案例列表
export function listCase(query) {
  return request({
    url: '/school/case/list',
    method: 'get',
    params: query
  })
}

// 查询合作案例详细
export function getCase(caseId) {
  return request({
    url: '/school/case/' + caseId,
    method: 'get'
  })
}

// 新增合作案例
export function addCase(data) {
  return request({
    url: '/school/case',
    method: 'post',
    data: data
  })
}

// 修改合作案例
export function updateCase(data) {
  return request({
    url: '/school/case',
    method: 'put',
    data: data
  })
}

// 删除合作案例
export function delCase(caseId) {
  return request({
    url: '/school/case/' + caseId,
    method: 'delete'
  })
}
