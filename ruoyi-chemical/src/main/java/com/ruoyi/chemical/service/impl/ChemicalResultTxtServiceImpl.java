package com.ruoyi.chemical.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.utils.StringUtils;
import java.util.List;
import java.util.Map;
import com.ruoyi.chemical.mapper.ChemicalResultTxtMapper;
import com.ruoyi.chemical.domain.ChemicalResultTxt;
import com.ruoyi.chemical.service.IChemicalResultTxtService;

/**
 * txt实验数据Service业务层处理
 *
 * @author xy
 * @date 2024-10-24
 */
@Service
public class ChemicalResultTxtServiceImpl extends ServiceImpl<ChemicalResultTxtMapper, ChemicalResultTxt> implements IChemicalResultTxtService {

    @Autowired
    private ChemicalResultTxtMapper chemicalResultTxtMapper;

    /**
     * 查询txt实验数据列表
     *
     * @param chemicalResultTxt txt实验数据
     * @return txt实验数据
     */
    @Override
    public List<ChemicalResultTxt> selectChemicalResultTxtList(ChemicalResultTxt chemicalResultTxt)
    {
        List<ChemicalResultTxt> chemicalResultTxtList = chemicalResultTxtMapper.selectList(buildQueryWrapper(chemicalResultTxt));
        return chemicalResultTxtList;
    }


    private LambdaQueryWrapper<ChemicalResultTxt> buildQueryWrapper(ChemicalResultTxt query) {
        Map<String, Object> params = query.getParams();
        LambdaQueryWrapper<ChemicalResultTxt> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(query.getSample()), ChemicalResultTxt::getSample, query.getSample());
        lqw.eq(StringUtils.isNotBlank(query.getOperator()), ChemicalResultTxt::getOperator, query.getOperator());
        lqw.eq(StringUtils.isNotBlank(query.getComment()), ChemicalResultTxt::getComment, query.getComment());
        lqw.eq(StringUtils.isNotBlank(query.getGroupA()), ChemicalResultTxt::getGroupA, query.getGroupA());
        lqw.eq(query.getDate() != null, ChemicalResultTxt::getDate, query.getDate());
        lqw.eq(StringUtils.isNotBlank(query.getTfe()), ChemicalResultTxt::getTfe, query.getTfe());
        lqw.eq(StringUtils.isNotBlank(query.getSio2()), ChemicalResultTxt::getSio2, query.getSio2());
        lqw.eq(StringUtils.isNotBlank(query.getCao()), ChemicalResultTxt::getCao, query.getCao());
        lqw.eq(StringUtils.isNotBlank(query.getMgo()), ChemicalResultTxt::getMgo, query.getMgo());
        lqw.eq(StringUtils.isNotBlank(query.getA12o3()), ChemicalResultTxt::getA12o3, query.getA12o3());
        lqw.eq(StringUtils.isNotBlank(query.getP()), ChemicalResultTxt::getP, query.getP());
        lqw.eq(StringUtils.isNotBlank(query.getS()), ChemicalResultTxt::getS, query.getS());
        lqw.eq(StringUtils.isNotBlank(query.getTio2()), ChemicalResultTxt::getTio2, query.getTio2());
        lqw.eq(StringUtils.isNotBlank(query.getV2o5()), ChemicalResultTxt::getV2o5, query.getV2o5());
        lqw.eq(query.getMno() != null, ChemicalResultTxt::getMno, query.getMno());
        lqw.eq(StringUtils.isNotBlank(query.getCr()), ChemicalResultTxt::getCr, query.getCr());
        lqw.eq(StringUtils.isNotBlank(query.getZn()), ChemicalResultTxt::getZn, query.getZn());
        lqw.eq(StringUtils.isNotBlank(query.getCu()), ChemicalResultTxt::getCu, query.getCu());
        lqw.eq(StringUtils.isNotBlank(query.getNi()), ChemicalResultTxt::getNi, query.getNi());
        lqw.eq(StringUtils.isNotBlank(query.getPb()), ChemicalResultTxt::getPb, query.getPb());
        lqw.eq(StringUtils.isNotBlank(query.getAS()), ChemicalResultTxt::getAS, query.getAS());
        lqw.eq(StringUtils.isNotBlank(query.getFeo()), ChemicalResultTxt::getFeo, query.getFeo());
        lqw.eq(StringUtils.isNotBlank(query.getH2o()), ChemicalResultTxt::getH2o, query.getH2o());
        lqw.eq(StringUtils.isNotBlank(query.getBurnLoss()), ChemicalResultTxt::getBurnLoss, query.getBurnLoss());
        lqw.eq(StringUtils.isNotBlank(query.getGranularity()), ChemicalResultTxt::getGranularity, query.getGranularity());
        lqw.eq(StringUtils.isNotBlank(query.getStrength()), ChemicalResultTxt::getStrength, query.getStrength());
        lqw.eq(StringUtils.isNotBlank(query.getRawFever()), ChemicalResultTxt::getRawFever, query.getRawFever());
        lqw.orderByDesc(ChemicalResultTxt::getCreateTime);
        lqw.eq(query.getPushStatus() >-1, ChemicalResultTxt::getPushStatus, query.getPushStatus());
        return lqw;
    }

}
