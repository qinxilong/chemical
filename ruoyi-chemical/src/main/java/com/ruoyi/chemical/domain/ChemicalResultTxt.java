package com.ruoyi.chemical.domain;

import java.util.Date;
import java.util.Map;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.stereotype.Component;

/**
 * txt实验数据对象 chemical_result_txt
 *
 * @author xy
 * @date 2024-10-24
 */
@Component
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@TableName("chemical_result_txt")
@ApiModel(value = "ChemicalResultTxt", description = "txt实验数据实体")
public class ChemicalResultTxt
{
    private static final long serialVersionUID = 1L;

    /** ID号 */
    @TableId(value="id",type= IdType.AUTO)
    @ApiModelProperty("ID号")
    private Long id;

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
    private String mno;

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

    /** 推送状态 */
    @Excel(name = "推送状态")
    @ApiModelProperty("推送状态")
    private int pushStatus= 0;

    @TableLogic
    private Integer deleted;

    /** 实验室名称 */
    @Excel(name = "实验室名称")
    @ApiModelProperty("实验室名称")
    private String laboratoryName;

    /** 推送次数 */
    @Excel(name = "推送次数")
    @ApiModelProperty("推送次数")
    private Long pushNum;

    /** 搜索值 */
    @TableField(exist = false)
    @JsonIgnore
    private String searchValue;

    /** 创建者 */
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
