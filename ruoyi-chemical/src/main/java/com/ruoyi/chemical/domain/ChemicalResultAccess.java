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
 * access实验数据对象 chemical_result_access
 *
 * @author xy
 * @date 2024-10-23
 */
@Data
@ToString
@NoArgsConstructor
@Accessors(chain = true)
@TableName("chemical_result_access")
@ApiModel(value = "ChemicalResultAccess", description = "access实验数据实体")
public class ChemicalResultAccess extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    @TableId(type= IdType.AUTO)
    @ApiModelProperty("$column.columnComment")
    private String id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String sample;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String mad;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String aad;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String ad;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String vad;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String vd;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String vdaf;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String fcad;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String sad;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String h2o;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String qd;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String qn;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String zn;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String tfe;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @ApiModelProperty("$column.columnComment")
    private String c;

    /** 样品编号 */
    @Excel(name = "样品编号")
    @ApiModelProperty("样品编号")
    private Long sampleNo;

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

}
