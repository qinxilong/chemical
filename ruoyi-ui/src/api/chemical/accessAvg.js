import request from '@/utils/request'

// 查询access发送数据列表
export function listAccessAvg(query) {
  return request({
    url: '/chemical/accessAvg/list',
    method: 'get',
    params: query
  })
}

// 查询access发送数据详细
export function getAccessAvg(id) {
  return request({
    url: '/chemical/accessAvg/' + id,
    method: 'get'
  })
}

// 新增access发送数据
export function addAccessAvg(data) {
  return request({
    url: '/chemical/accessAvg',
    method: 'post',
    data: data
  })
}

// 修改access发送数据
export function updateAccessAvg(data) {
  return request({
    url: '/chemical/accessAvg',
    method: 'put',
    data: data
  })
}

// 删除access发送数据
export function delAccessAvg(id) {
  return request({
    url: '/chemical/accessAvg/' + id,
    method: 'delete'
  })
}
