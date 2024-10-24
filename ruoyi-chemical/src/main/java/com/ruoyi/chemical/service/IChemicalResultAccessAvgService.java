package com.ruoyi.chemical.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.chemical.domain.ChemicalResultAccessAvg;

/**
 * access发送数据Service接口
 *
 * @author xy
 * @date 2024-10-24
 */
public interface IChemicalResultAccessAvgService extends IService<ChemicalResultAccessAvg> {

    /**
     * 查询access发送数据列表
     *
     * @param chemicalResultAccessAvg access发送数据
     * @return access发送数据集合
     */
    public List<ChemicalResultAccessAvg> selectChemicalResultAccessAvgList(ChemicalResultAccessAvg chemicalResultAccessAvg);

}
