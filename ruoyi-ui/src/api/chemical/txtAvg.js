import request from '@/utils/request'

// 查询TXT发送数据列表
export function listTxtAvg(query) {
  return request({
    url: '/chemical/txtAvg/list',
    method: 'get',
    params: query
  })
}

// 查询TXT发送数据详细
export function getTxtAvg(id) {
  return request({
    url: '/chemical/txtAvg/' + id,
    method: 'get'
  })
}

// 新增TXT发送数据
export function addTxtAvg(data) {
  return request({
    url: '/chemical/txtAvg',
    method: 'post',
    data: data
  })
}

// 修改TXT发送数据
export function updateTxtAvg(data) {
  return request({
    url: '/chemical/txtAvg',
    method: 'put',
    data: data
  })
}

// 删除TXT发送数据
export function delTxtAvg(id) {
  return request({
    url: '/chemical/txtAvg/' + id,
    method: 'delete'
  })
}
