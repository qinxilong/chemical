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

import java.util.List;

/**
 * 实验数据推送记录对象 chemical_result_push_record
 *
 * @author xy
 * @date 2024-10-26
 */
@Data
@ToString
@NoArgsConstructor
@Accessors(chain = true)
@TableName("chemical_result_push_record")
@ApiModel(value = "ChemicalResultPushRecord", description = "实验数据推送记录实体")
public class ChemicalResultPushRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    @TableId(type= IdType.AUTO)
    @ApiModelProperty("id")
    private Long id;

    /** 样品号 */
    @Excel(name = "样品号")
    @ApiModelProperty("样品号")
    private String sample;

    /** 实验室名称 */
    @Excel(name = "实验室名称")
    @ApiModelProperty("实验室名称")
    private String laboratoryName;

    /** 原始数据id */
    @Excel(name = "原始数据id")
    @ApiModelProperty("原始数据id")
    private String orginIds;

    /** 目标数据id */
    @Excel(name = "目标数据id")
    @ApiModelProperty("目标数据id")
    private String targetId;

    /** access\txt */
    @Excel(name = "access\txt")
    @ApiModelProperty("access\txt")
    private String type;

    /** 接收人id */
    @Excel(name = "接收人id")
    @ApiModelProperty("接收人id")
    private String receiveUserId;

    /** 发送人id */
    @Excel(name = "发送人id")
    @ApiModelProperty("发送人id")
    private String pushUserId;


    /** 原始数据列表详情 */
    @TableField(exist = false)
    @Excel(name = "原始数据列表详情")
    @ApiModelProperty("原始数据列表详情")
    private List<Object> originDataList;


    /** 发送数据详情 */
    @TableField(exist = false)
    @Excel(name = "发送数据详情")
    @ApiModelProperty("发送数据详情")
    private Object targetData;

    /** 接收人*/
    @TableField(exist = false)
    @Excel(name = "接收人")
    @ApiModelProperty("接收人")
    private String receiveUserName;

    /** 发送人 */
    @TableField(exist = false)
    @Excel(name = "发送人")
    @ApiModelProperty("发送人")
    private String pushUserName;

    public ChemicalResultPushRecord(ChemicalResultPushRequest chemicalResultPushRequest) {
        this.sample = chemicalResultPushRequest.getSample();
        this.type = chemicalResultPushRequest.getType();
        this.laboratoryName = chemicalResultPushRequest.getLaboratoryName();
        this.pushUserId = chemicalResultPushRequest.getPushUserId();
        this.orginIds = String.join(",", chemicalResultPushRequest.getOrginIdList());;

    }
}
