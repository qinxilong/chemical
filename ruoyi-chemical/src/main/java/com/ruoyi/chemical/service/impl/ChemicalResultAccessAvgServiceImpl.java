package com.ruoyi.chemical.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.utils.StringUtils;
import java.util.List;
import java.util.Map;
import com.ruoyi.chemical.mapper.ChemicalResultAccessAvgMapper;
import com.ruoyi.chemical.domain.ChemicalResultAccessAvg;
import com.ruoyi.chemical.service.IChemicalResultAccessAvgService;

/**
 * access发送数据Service业务层处理
 *
 * @author xy
 * @date 2024-10-24
 */
@Service
public class ChemicalResultAccessAvgServiceImpl extends ServiceImpl<ChemicalResultAccessAvgMapper, ChemicalResultAccessAvg> implements IChemicalResultAccessAvgService {

    @Autowired
    private ChemicalResultAccessAvgMapper chemicalResultAccessAvgMapper;

    /**
     * 查询access发送数据列表
     *
     * @param chemicalResultAccessAvg access发送数据
     * @return access发送数据
     */
    @Override
    public List<ChemicalResultAccessAvg> selectChemicalResultAccessAvgList(ChemicalResultAccessAvg chemicalResultAccessAvg)
    {
        List<ChemicalResultAccessAvg> chemicalResultAccessAvgList = chemicalResultAccessAvgMapper.selectList(buildQueryWrapper(chemicalResultAccessAvg));
        return chemicalResultAccessAvgList;
    }


    private LambdaQueryWrapper<ChemicalResultAccessAvg> buildQueryWrapper(ChemicalResultAccessAvg query) {
        Map<String, Object> params = query.getParams();
        LambdaQueryWrapper<ChemicalResultAccessAvg> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(query.getSample()), ChemicalResultAccessAvg::getSample, query.getSample());
        lqw.eq(StringUtils.isNotBlank(query.getMad()), ChemicalResultAccessAvg::getMad, query.getMad());
        lqw.eq(StringUtils.isNotBlank(query.getAad()), ChemicalResultAccessAvg::getAad, query.getAad());
        lqw.eq(StringUtils.isNotBlank(query.getAd()), ChemicalResultAccessAvg::getAd, query.getAd());
        lqw.eq(StringUtils.isNotBlank(query.getVad()), ChemicalResultAccessAvg::getVad, query.getVad());
        lqw.eq(StringUtils.isNotBlank(query.getVd()), ChemicalResultAccessAvg::getVd, query.getVd());
        lqw.eq(StringUtils.isNotBlank(query.getVdaf()), ChemicalResultAccessAvg::getVdaf, query.getVdaf());
        lqw.eq(StringUtils.isNotBlank(query.getFcad()), ChemicalResultAccessAvg::getFcad, query.getFcad());
        lqw.eq(StringUtils.isNotBlank(query.getSad()), ChemicalResultAccessAvg::getSad, query.getSad());
        lqw.eq(StringUtils.isNotBlank(query.getH2o()), ChemicalResultAccessAvg::getH2o, query.getH2o());
        lqw.eq(StringUtils.isNotBlank(query.getQd()), ChemicalResultAccessAvg::getQd, query.getQd());
        lqw.eq(StringUtils.isNotBlank(query.getQn()), ChemicalResultAccessAvg::getQn, query.getQn());
        lqw.eq(StringUtils.isNotBlank(query.getZn()), ChemicalResultAccessAvg::getZn, query.getZn());
        lqw.eq(StringUtils.isNotBlank(query.getTfe()), ChemicalResultAccessAvg::getTfe, query.getTfe());
        lqw.eq(StringUtils.isNotBlank(query.getC()), ChemicalResultAccessAvg::getC, query.getC());
        lqw.eq(query.getRoomNo() != null, ChemicalResultAccessAvg::getRoomNo, query.getRoomNo());
        lqw.eq(StringUtils.isNotBlank(query.getGranularity()), ChemicalResultAccessAvg::getGranularity, query.getGranularity());
        lqw.eq(StringUtils.isNotBlank(query.getGrindAbility()), ChemicalResultAccessAvg::getGrindAbility, query.getGrindAbility());
        lqw.like(StringUtils.isNotBlank(query.getMaterialName()), ChemicalResultAccessAvg::getMaterialName, query.getMaterialName());
        lqw.orderByDesc(ChemicalResultAccessAvg::getCreateTime);
        lqw.eq(StringUtils.isNotBlank(query.getOriginIds()), ChemicalResultAccessAvg::getOriginIds, query.getOriginIds());
        return lqw;
    }

}
