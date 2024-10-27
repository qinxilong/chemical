import request from '@/utils/request'

// 查询实验数据推送记录列表
export function listPushRecord(query) {
  return request({
    url: '/chemical/pushRecord/list',
    method: 'get',
    params: query
  })
}

// 查询实验数据推送记录详细
export function getPushRecord(id) {
  return request({
    url: '/chemical/pushRecord/' + id,
    method: 'get'
  })
}

// 新增实验数据推送记录
export function addPushRecord(data) {
  return request({
    url: '/chemical/pushRecord',
    method: 'post',
    data: data
  })
}

// 修改实验数据推送记录
export function updatePushRecord(data) {
  return request({
    url: '/chemical/pushRecord',
    method: 'put',
    data: data
  })
}

// 删除实验数据推送记录
export function delPushRecord(id) {
  return request({
    url: '/chemical/pushRecord/' + id,
    method: 'delete'
  })

}

