package com.ruoyi.chemical.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.utils.StringUtils;
import java.util.List;
import java.util.Map;
import com.ruoyi.chemical.mapper.ChemicalResultAccessMapper;
import com.ruoyi.chemical.domain.ChemicalResultAccess;
import com.ruoyi.chemical.service.IChemicalResultAccessService;

/**
 * access实验数据Service业务层处理
 *
 * @author xy
 * @date 2024-10-24
 */
@Service
public class ChemicalResultAccessServiceImpl extends ServiceImpl<ChemicalResultAccessMapper, ChemicalResultAccess> implements IChemicalResultAccessService {

    @Autowired
    private ChemicalResultAccessMapper chemicalResultAccessMapper;

    /**
     * 查询access实验数据列表
     *
     * @param chemicalResultAccess access实验数据
     * @return access实验数据
     */
    @Override
    public List<ChemicalResultAccess> selectChemicalResultAccessList(ChemicalResultAccess chemicalResultAccess)
    {
        List<ChemicalResultAccess> chemicalResultAccessList = chemicalResultAccessMapper.selectList(buildQueryWrapper(chemicalResultAccess));
        return chemicalResultAccessList;
    }


    private LambdaQueryWrapper<ChemicalResultAccess> buildQueryWrapper(ChemicalResultAccess query) {
        Map<String, Object> params = query.getParams();
        LambdaQueryWrapper<ChemicalResultAccess> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(query.getSample()), ChemicalResultAccess::getSample, query.getSample());
        lqw.eq(StringUtils.isNotBlank(query.getMad()), ChemicalResultAccess::getMad, query.getMad());
        lqw.eq(StringUtils.isNotBlank(query.getAad()), ChemicalResultAccess::getAad, query.getAad());
        lqw.eq(StringUtils.isNotBlank(query.getAd()), ChemicalResultAccess::getAd, query.getAd());
        lqw.eq(StringUtils.isNotBlank(query.getVad()), ChemicalResultAccess::getVad, query.getVad());
        lqw.eq(StringUtils.isNotBlank(query.getVd()), ChemicalResultAccess::getVd, query.getVd());
        lqw.eq(StringUtils.isNotBlank(query.getVdaf()), ChemicalResultAccess::getVdaf, query.getVdaf());
        lqw.eq(StringUtils.isNotBlank(query.getFcad()), ChemicalResultAccess::getFcad, query.getFcad());
        lqw.eq(StringUtils.isNotBlank(query.getSad()), ChemicalResultAccess::getSad, query.getSad());
        lqw.eq(StringUtils.isNotBlank(query.getH2o()), ChemicalResultAccess::getH2o, query.getH2o());
        lqw.eq(StringUtils.isNotBlank(query.getQd()), ChemicalResultAccess::getQd, query.getQd());
        lqw.eq(StringUtils.isNotBlank(query.getQn()), ChemicalResultAccess::getQn, query.getQn());
        lqw.eq(StringUtils.isNotBlank(query.getZn()), ChemicalResultAccess::getZn, query.getZn());
        lqw.eq(StringUtils.isNotBlank(query.getTfe()), ChemicalResultAccess::getTfe, query.getTfe());
        lqw.eq(StringUtils.isNotBlank(query.getC()), ChemicalResultAccess::getC, query.getC());
        lqw.eq(query.getRoomNo() != null, ChemicalResultAccess::getRoomNo, query.getRoomNo());
        lqw.eq(StringUtils.isNotBlank(query.getGranularity()), ChemicalResultAccess::getGranularity, query.getGranularity());
        lqw.eq(StringUtils.isNotBlank(query.getGrindAbility()), ChemicalResultAccess::getGrindAbility, query.getGrindAbility());
        lqw.like(StringUtils.isNotBlank(query.getMaterialName()), ChemicalResultAccess::getMaterialName, query.getMaterialName());
        lqw.orderByDesc(ChemicalResultAccess::getCreateTime);
        lqw.eq(query.getPushStatus()>-1, ChemicalResultAccess::getPushStatus, query.getPushStatus());
        return lqw;
    }

}
