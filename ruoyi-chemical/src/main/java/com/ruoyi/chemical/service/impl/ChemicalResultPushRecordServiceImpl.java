package com.ruoyi.chemical.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.utils.StringUtils;
import java.util.List;
import java.util.Map;
import com.ruoyi.chemical.mapper.ChemicalResultPushRecordMapper;
import com.ruoyi.chemical.domain.ChemicalResultPushRecord;
import com.ruoyi.chemical.service.IChemicalResultPushRecordService;

/**
 * 实验数据推送记录Service业务层处理
 *
 * @author xy
 * @date 2024-10-26
 */
@Service
public class ChemicalResultPushRecordServiceImpl extends ServiceImpl<ChemicalResultPushRecordMapper, ChemicalResultPushRecord> implements IChemicalResultPushRecordService {

    @Autowired
    private ChemicalResultPushRecordMapper chemicalResultPushRecordMapper;

    /**
     * 查询实验数据推送记录列表
     *
     * @param chemicalResultPushRecord 实验数据推送记录
     * @return 实验数据推送记录
     */
    @Override
    public List<ChemicalResultPushRecord> selectChemicalResultPushRecordList(ChemicalResultPushRecord chemicalResultPushRecord)
    {
        List<ChemicalResultPushRecord> chemicalResultPushRecordList = chemicalResultPushRecordMapper.selectList(buildQueryWrapper(chemicalResultPushRecord));
        return chemicalResultPushRecordList;
    }

    @Override
    public ChemicalResultPushRecord selectPushRecordWithUserNames(String id) {
        return chemicalResultPushRecordMapper.selectPushRecordWithUserNames(id);
    }

    @Override
    public List<ChemicalResultPushRecord> getByIds(Long[] ids) {
        LambdaQueryWrapper<ChemicalResultPushRecord> lqw = Wrappers.lambdaQuery();
        lqw.in(ids.length>0,ChemicalResultPushRecord::getId,ids);
        List<ChemicalResultPushRecord> chemicalResultPushRecordList = chemicalResultPushRecordMapper.selectList(lqw);
        return chemicalResultPushRecordList;

    }


    private LambdaQueryWrapper<ChemicalResultPushRecord> buildQueryWrapper(ChemicalResultPushRecord query) {
        Map<String, Object> params = query.getParams();
        LambdaQueryWrapper<ChemicalResultPushRecord> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(query.getSample()), ChemicalResultPushRecord::getSample, query.getSample());
        lqw.like(StringUtils.isNotBlank(query.getLaboratoryName()), ChemicalResultPushRecord::getLaboratoryName, query.getLaboratoryName());
        lqw.eq(StringUtils.isNotBlank(query.getOrginIds()), ChemicalResultPushRecord::getOrginIds, query.getOrginIds());
        lqw.eq(StringUtils.isNotBlank(query.getTargetId()), ChemicalResultPushRecord::getTargetId, query.getTargetId());
        lqw.eq(StringUtils.isNotBlank(query.getType()), ChemicalResultPushRecord::getType, query.getType());
        lqw.eq(query.getReceiveUserId() != null, ChemicalResultPushRecord::getReceiveUserId, query.getReceiveUserId());
        lqw.eq(StringUtils.isNotBlank(query.getPushUserId()), ChemicalResultPushRecord::getPushUserId, query.getPushUserId());
        lqw.orderByDesc(ChemicalResultPushRecord::getCreateTime);
        return lqw;
    }

}
