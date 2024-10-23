import request from '@/utils/request'

// 查询access实验数据列表
export function listChemicalAccess(query) {
  return request({
    url: '/chemical/chemicalAccess/list',
    method: 'get',
    params: query
  })
}

// 查询access实验数据详细
export function getChemicalAccess(id) {
  return request({
    url: '/chemical/chemicalAccess/' + id,
    method: 'get'
  })
}

// 新增access实验数据
export function addChemicalAccess(data) {
  return request({
    url: '/chemical/chemicalAccess',
    method: 'post',
    data: data
  })
}

// 修改access实验数据
export function updateChemicalAccess(data) {
  return request({
    url: '/chemical/chemicalAccess',
    method: 'put',
    data: data
  })
}

// 删除access实验数据
export function delChemicalAccess(id) {
  return request({
    url: '/chemical/chemicalAccess/' + id,
    method: 'delete'
  })
}
