package com.ruoyi.chemical.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.chemical.domain.ChemicalResultTxtAvg;

/**
 * TXT发送数据Service接口
 *
 * @author y
 * @date 2024-10-24
 */
public interface IChemicalResultTxtAvgService extends IService<ChemicalResultTxtAvg> {

    /**
     * 查询TXT发送数据列表
     *
     * @param chemicalResultTxtAvg TXT发送数据
     * @return TXT发送数据集合
     */
    public List<ChemicalResultTxtAvg> selectChemicalResultTxtAvgList(ChemicalResultTxtAvg chemicalResultTxtAvg);

}
