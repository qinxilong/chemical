package com.ruoyi.chemical.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.chemical.domain.ChemicalResult;
import com.ruoyi.chemical.domain.ChemicalResultPushRequest;
import com.ruoyi.chemical.domain.ChemicalResultTxt;

import java.util.List;

/**
 * txt实验数据Service接口
 *
 * @author xy
 * @date 2024-10-24
 */
public interface IChemicalResultService {

    /**
     * 保存实验原始数据
     * @param chemicalResult
     * @return
     */
    Boolean save(ChemicalResult chemicalResult);

    /**
     * 发送Access数据
     * @param pushAccessResult
     * @return
     */
    int pushAccessResult(List<ChemicalResult> pushAccessResult);

    /**
     * 发送TXT数据
     * @param pushAccessResult
     * @return
     */
    int pushTxtResult(List<ChemicalResult> pushAccessResult);

    int pushChemicalResult(ChemicalResultPushRequest chemicalResultPushRequest);
}
