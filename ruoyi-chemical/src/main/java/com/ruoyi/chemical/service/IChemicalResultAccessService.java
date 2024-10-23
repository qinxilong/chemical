package com.ruoyi.chemical.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.chemical.domain.ChemicalResultAccess;

/**
 * access实验数据Service接口
 *
 * @author xy
 * @date 2024-10-23
 */
public interface IChemicalResultAccessService extends IService<ChemicalResultAccess> {

    /**
     * 查询access实验数据列表
     *
     * @param chemicalResultAccess access实验数据
     * @return access实验数据集合
     */
    public List<ChemicalResultAccess> selectChemicalResultAccessList(ChemicalResultAccess chemicalResultAccess);

}
