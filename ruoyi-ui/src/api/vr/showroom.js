import request from '@/utils/request'

// 查询VR展厅列表
export function listShowroom(query) {
  return request({
    url: '/vr/showroom/list',
    method: 'get',
    params: query
  })
}

// 查询VR展厅详细
export function getShowroom(showroomId) {
  return request({
    url: '/vr/showroom/' + showroomId,
    method: 'get'
  })
}

// 新增VR展厅
export function addShowroom(data) {
  return request({
    url: '/vr/showroom',
    method: 'post',
    data: data
  })
}

// 修改VR展厅
export function updateShowroom(data) {
  return request({
    url: '/vr/showroom',
    method: 'put',
    data: data
  })
}

// 删除VR展厅
export function delShowroom(showroomId) {
  return request({
    url: '/vr/showroom/' + showroomId,
    method: 'delete'
  })
}
