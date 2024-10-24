package com.ruoyi.chemical.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * access发送数据对象 chemical_result_access_avg
 *
 * @author xy
 * @date 2024-10-24
 */
@Data
@ToString
@NoArgsConstructor
@Accessors(chain = true)
@TableName("chemical_result_access_avg")
@ApiModel(value = "ChemicalResultAccessAvg", description = "access发送数据实体")
public class ChemicalResultAccessAvg extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID号 */
    @TableId(type= IdType.AUTO)
    @ApiModelProperty("ID号")
    private String id;

    /** 样品号 */
    @Excel(name = "样品号")
    @ApiModelProperty("样品号")
    private String sample;

    /** Mad */
    @Excel(name = "Mad")
    @ApiModelProperty("Mad")
    private String mad;

    /** Aad */
    @Excel(name = "Aad")
    @ApiModelProperty("Aad")
    private String aad;

    /** Ad */
    @Excel(name = "Ad")
    @ApiModelProperty("Ad")
    private String ad;

    /** Vad */
    @Excel(name = "Vad")
    @ApiModelProperty("Vad")
    private String vad;

    /** Vd */
    @Excel(name = "Vd")
    @ApiModelProperty("Vd")
    private String vd;

    /** Vdaf */
    @Excel(name = "Vdaf")
    @ApiModelProperty("Vdaf")
    private String vdaf;

    /** FCad */
    @Excel(name = "FCad")
    @ApiModelProperty("FCad")
    private String fcad;

    /** Sad */
    @Excel(name = "Sad")
    @ApiModelProperty("Sad")
    private String sad;

    /** H2O */
    @Excel(name = "H2O")
    @ApiModelProperty("H2O")
    private String h2o;

    /** Qd */
    @Excel(name = "Qd")
    @ApiModelProperty("Qd")
    private String qd;

    /** Qn */
    @Excel(name = "Qn")
    @ApiModelProperty("Qn")
    private String qn;

    /** Zn */
    @Excel(name = "Zn")
    @ApiModelProperty("Zn")
    private String zn;

    /** TFe */
    @Excel(name = "TFe")
    @ApiModelProperty("TFe")
    private String tfe;

    /** C */
    @Excel(name = "C")
    @ApiModelProperty("C")
    private String c;

    /** 室编号 */
    @Excel(name = "室编号")
    @ApiModelProperty("室编号")
    private Long roomNo;

    /** 粒度 */
    @Excel(name = "粒度")
    @ApiModelProperty("粒度")
    private String granularity;

    /** 可磨性 */
    @Excel(name = "可磨性")
    @ApiModelProperty("可磨性")
    private String grindAbility;

    /** 物料名称 */
    @Excel(name = "物料名称")
    @ApiModelProperty("物料名称")
    private String materialName;

    /** 原始数据id */
    @Excel(name = "原始数据id")
    @ApiModelProperty("原始数据id")
    private String originIds;

}
