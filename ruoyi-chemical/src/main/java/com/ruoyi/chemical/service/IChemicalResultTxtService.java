package com.ruoyi.chemical.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.chemical.domain.ChemicalResultTxt;

/**
 * txt实验数据Service接口
 *
 * @author xy
 * @date 2024-10-24
 */
public interface IChemicalResultTxtService extends IService<ChemicalResultTxt> {

    /**
     * 查询txt实验数据列表
     *
     * @param chemicalResultTxt txt实验数据
     * @return txt实验数据集合
     */
    public List<ChemicalResultTxt> selectChemicalResultTxtList(ChemicalResultTxt chemicalResultTxt);

}
