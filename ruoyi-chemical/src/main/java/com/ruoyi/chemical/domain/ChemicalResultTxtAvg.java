package com.ruoyi.chemical.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
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
 * TXT发送数据对象 chemical_result_txt_avg
 *
 * @author y
 * @date 2024-10-24
 */
@Data
@ToString
@NoArgsConstructor
@Accessors(chain = true)
@TableName("chemical_result_txt_avg")
@ApiModel(value = "ChemicalResultTxtAvg", description = "TXT发送数据实体")
public class ChemicalResultTxtAvg extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID号 */
    @TableId(type= IdType.AUTO)
    @ApiModelProperty("ID号")
    private String id;

    /** Sample */
    @Excel(name = "Sample")
    @ApiModelProperty("Sample")
    private String sample;

    /** Operator */
    @Excel(name = "Operator")
    @ApiModelProperty("Operator")
    private String operator;

    /** Comment */
    @Excel(name = "Comment")
    @ApiModelProperty("Comment")
    private String comment;

    /** Group */
    @Excel(name = "Group")
    @ApiModelProperty("Group")
    private String groupA;

    /** Date */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "Date", width = 30, dateFormat = "yyyy-MM-dd")
    @ApiModelProperty("Date")
    private Date date;

    /** TFe */
    @Excel(name = "TFe")
    @ApiModelProperty("TFe")
    private String tfe;

    /** SiO2 */
    @Excel(name = "SiO2")
    @ApiModelProperty("SiO2")
    private String sio2;

    /** CaO */
    @Excel(name = "CaO")
    @ApiModelProperty("CaO")
    private String cao;

    /** MgO */
    @Excel(name = "MgO")
    @ApiModelProperty("MgO")
    private String mgo;

    /** A12O3 */
    @Excel(name = "A12O3")
    @ApiModelProperty("A12O3")
    private String a12o3;

    /** P */
    @Excel(name = "P")
    @ApiModelProperty("P")
    private String p;

    /** S */
    @Excel(name = "S")
    @ApiModelProperty("S")
    private String s;

    /** TiO2 */
    @Excel(name = "TiO2")
    @ApiModelProperty("TiO2")
    private String tio2;

    /** V2O5 */
    @Excel(name = "V2O5")
    @ApiModelProperty("V2O5")
    private String v2o5;

    /** MnO */
    @Excel(name = "MnO")
    @ApiModelProperty("MnO")
    private Long mno;

    /** Cr */
    @Excel(name = "Cr")
    @ApiModelProperty("Cr")
    private String cr;

    /** Zn */
    @Excel(name = "Zn")
    @ApiModelProperty("Zn")
    private String zn;

    /** Cu */
    @Excel(name = "Cu")
    @ApiModelProperty("Cu")
    private String cu;

    /** Ni */
    @Excel(name = "Ni")
    @ApiModelProperty("Ni")
    private String ni;

    /** Pb */
    @Excel(name = "Pb")
    @ApiModelProperty("Pb")
    private String pb;

    /** As */
    @Excel(name = "As")
    @ApiModelProperty("As")
    private String aS;

    /** Feo */
    @Excel(name = "Feo")
    @ApiModelProperty("Feo")
    private String feo;

    /** H2O */
    @Excel(name = "H2O")
    @ApiModelProperty("H2O")
    private String h2o;

    /** 烧损 */
    @Excel(name = "烧损")
    @ApiModelProperty("烧损")
    private String burnLoss;

    /** 粒度 */
    @Excel(name = "粒度")
    @ApiModelProperty("粒度")
    private String granularity;

    /** 强度 */
    @Excel(name = "强度")
    @ApiModelProperty("强度")
    private String strength;

    /** 生烧 */
    @Excel(name = "生烧")
    @ApiModelProperty("生烧")
    private String rawFever;

}
