package com.ruoyi.chemical.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * access发送数据对象
 *
 * @author xy
 * @date 2024-10-24
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "ChemicalResult", description = "上报实验数据")
public class ChemicalResult
{
    private static final long serialVersionUID = 1L;

    /** 实验数据类型 access、txt */
    @ApiModelProperty("type")
    private String type;

    /** 实验数据 */
    @ApiModelProperty("chemicalData")
    private String chemicalData;

    /** 实验室名称 */
    @ApiModelProperty("laboratoryName")
    private String laboratoryName;

}
