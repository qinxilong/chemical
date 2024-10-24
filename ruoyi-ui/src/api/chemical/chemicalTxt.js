import request from '@/utils/request'

// 查询txt实验数据列表
export function listChemicalTxt(query) {
  return request({
    url: '/chemical/chemicalTxt/list',
    method: 'get',
    params: query
  })
}

// 查询txt实验数据详细
export function getChemicalTxt(id) {
  return request({
    url: '/chemical/chemicalTxt/' + id,
    method: 'get'
  })
}

// 新增txt实验数据
export function addChemicalTxt(data) {
  return request({
    url: '/chemical/chemicalTxt',
    method: 'post',
    data: data
  })
}

// 修改txt实验数据
export function updateChemicalTxt(data) {
  return request({
    url: '/chemical/chemicalTxt',
    method: 'put',
    data: data
  })
}

// 删除txt实验数据
export function delChemicalTxt(id) {
  return request({
    url: '/chemical/chemicalTxt/' + id,
    method: 'delete'
  })
}
