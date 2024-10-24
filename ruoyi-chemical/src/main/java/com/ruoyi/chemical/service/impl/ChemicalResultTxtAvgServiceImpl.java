package com.ruoyi.chemical.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.utils.StringUtils;
import java.util.List;
import java.util.Map;
import com.ruoyi.chemical.mapper.ChemicalResultTxtAvgMapper;
import com.ruoyi.chemical.domain.ChemicalResultTxtAvg;
import com.ruoyi.chemical.service.IChemicalResultTxtAvgService;

/**
 * TXT发送数据Service业务层处理
 *
 * @author y
 * @date 2024-10-24
 */
@Service
public class ChemicalResultTxtAvgServiceImpl extends ServiceImpl<ChemicalResultTxtAvgMapper, ChemicalResultTxtAvg> implements IChemicalResultTxtAvgService {

    @Autowired
    private ChemicalResultTxtAvgMapper chemicalResultTxtAvgMapper;

    /**
     * 查询TXT发送数据列表
     *
     * @param chemicalResultTxtAvg TXT发送数据
     * @return TXT发送数据
     */
    @Override
    public List<ChemicalResultTxtAvg> selectChemicalResultTxtAvgList(ChemicalResultTxtAvg chemicalResultTxtAvg)
    {
        List<ChemicalResultTxtAvg> chemicalResultTxtAvgList = chemicalResultTxtAvgMapper.selectList(buildQueryWrapper(chemicalResultTxtAvg));
        return chemicalResultTxtAvgList;
    }


    private LambdaQueryWrapper<ChemicalResultTxtAvg> buildQueryWrapper(ChemicalResultTxtAvg query) {
        Map<String, Object> params = query.getParams();
        LambdaQueryWrapper<ChemicalResultTxtAvg> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(query.getSample()), ChemicalResultTxtAvg::getSample, query.getSample());
        lqw.eq(StringUtils.isNotBlank(query.getOperator()), ChemicalResultTxtAvg::getOperator, query.getOperator());
        lqw.eq(StringUtils.isNotBlank(query.getComment()), ChemicalResultTxtAvg::getComment, query.getComment());
        lqw.eq(StringUtils.isNotBlank(query.getGroupA()), ChemicalResultTxtAvg::getGroupA, query.getGroupA());
        lqw.eq(query.getDate() != null, ChemicalResultTxtAvg::getDate, query.getDate());
        lqw.eq(StringUtils.isNotBlank(query.getTfe()), ChemicalResultTxtAvg::getTfe, query.getTfe());
        lqw.eq(StringUtils.isNotBlank(query.getSio2()), ChemicalResultTxtAvg::getSio2, query.getSio2());
        lqw.eq(StringUtils.isNotBlank(query.getCao()), ChemicalResultTxtAvg::getCao, query.getCao());
        lqw.eq(StringUtils.isNotBlank(query.getMgo()), ChemicalResultTxtAvg::getMgo, query.getMgo());
        lqw.eq(StringUtils.isNotBlank(query.getA12o3()), ChemicalResultTxtAvg::getA12o3, query.getA12o3());
        lqw.eq(StringUtils.isNotBlank(query.getP()), ChemicalResultTxtAvg::getP, query.getP());
        lqw.eq(StringUtils.isNotBlank(query.getS()), ChemicalResultTxtAvg::getS, query.getS());
        lqw.eq(StringUtils.isNotBlank(query.getTio2()), ChemicalResultTxtAvg::getTio2, query.getTio2());
        lqw.eq(StringUtils.isNotBlank(query.getV2o5()), ChemicalResultTxtAvg::getV2o5, query.getV2o5());
        lqw.eq(query.getMno() != null, ChemicalResultTxtAvg::getMno, query.getMno());
        lqw.eq(StringUtils.isNotBlank(query.getCr()), ChemicalResultTxtAvg::getCr, query.getCr());
        lqw.eq(StringUtils.isNotBlank(query.getZn()), ChemicalResultTxtAvg::getZn, query.getZn());
        lqw.eq(StringUtils.isNotBlank(query.getCu()), ChemicalResultTxtAvg::getCu, query.getCu());
        lqw.eq(StringUtils.isNotBlank(query.getNi()), ChemicalResultTxtAvg::getNi, query.getNi());
        lqw.eq(StringUtils.isNotBlank(query.getPb()), ChemicalResultTxtAvg::getPb, query.getPb());
        lqw.eq(StringUtils.isNotBlank(query.getAS()), ChemicalResultTxtAvg::getAS, query.getAS());
        lqw.eq(StringUtils.isNotBlank(query.getFeo()), ChemicalResultTxtAvg::getFeo, query.getFeo());
        lqw.eq(StringUtils.isNotBlank(query.getH2o()), ChemicalResultTxtAvg::getH2o, query.getH2o());
        lqw.eq(StringUtils.isNotBlank(query.getBurnLoss()), ChemicalResultTxtAvg::getBurnLoss, query.getBurnLoss());
        lqw.eq(StringUtils.isNotBlank(query.getGranularity()), ChemicalResultTxtAvg::getGranularity, query.getGranularity());
        lqw.eq(StringUtils.isNotBlank(query.getStrength()), ChemicalResultTxtAvg::getStrength, query.getStrength());
        lqw.eq(StringUtils.isNotBlank(query.getRawFever()), ChemicalResultTxtAvg::getRawFever, query.getRawFever());
        lqw.orderByDesc(ChemicalResultTxtAvg::getCreateTime);
        return lqw;
    }

}
