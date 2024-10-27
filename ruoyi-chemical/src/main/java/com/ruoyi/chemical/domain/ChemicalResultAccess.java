package com.ruoyi.chemical.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;
import java.util.Map;

/**
 * access实验数据对象 chemical_result_access
 *
 * @author xy
 * @date 2024-10-24
 */
@Data
@ToString
@NoArgsConstructor
@Accessors(chain = true)
@TableName("chemical_result_access")
@ApiModel(value = "ChemicalResultAccess", description = "access实验数据实体")
public class ChemicalResultAccess
{
    private static final long serialVersionUID = 1L;

    /** ID号 */
    @TableId(type= IdType.AUTO)
    @ApiModelProperty("ID号")
    private Long id;

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

    /** 推送状态 */
    @Excel(name = "推送状态")
    @ApiModelProperty("推送状态")
    private int pushStatus;
    /** 实验室名称 */
    @Excel(name = "实验室名称")
    @ApiModelProperty("实验室名称")
    private String laboratoryName;

    /** 推送次数 */
    @Excel(name = "推送次数")
    @ApiModelProperty("推送次数")
    private Long pushNum;

    @TableLogic
    private Integer deleted;

    /** 搜索值 */
    @TableField(exist = false)
    @JsonIgnore
    private String searchValue;

    /** 创建者 */
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty("创建者")
    private String createBy;

    /** 创建时间 */
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("创建时间")
    private Date createTime;

    /** 更新者 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty("更新者")
    private String updateBy;

    /** 更新时间 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty("更新时间")
    private Date updateTime;

    /** 备注 */
    @ApiModelProperty("备注")
    private String remark;

    /** 请求参数 */
    @TableField(exist = false)
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private Map<String, Object> params;

}
