package com.ruoyi.chemical.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.chemical.domain.ChemicalResultPushRecord;

/**
 * 实验数据推送记录Service接口
 *
 * @author xy
 * @date 2024-10-26
 */
public interface IChemicalResultPushRecordService extends IService<ChemicalResultPushRecord> {

    /**
     * 查询实验数据推送记录列表
     *
     * @param chemicalResultPushRecord 实验数据推送记录
     * @return 实验数据推送记录集合
     */
    public List<ChemicalResultPushRecord> selectChemicalResultPushRecordList(ChemicalResultPushRecord chemicalResultPushRecord);

    ChemicalResultPushRecord selectPushRecordWithUserNames(String id);

    List<ChemicalResultPushRecord> getByIds(Long[] ids);
}
