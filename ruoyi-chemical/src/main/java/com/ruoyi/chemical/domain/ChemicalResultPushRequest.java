package com.ruoyi.chemical.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * access发送数据对象
 *
 * @author xy
 * @date 2024-10-24
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "ChemicalResultPushRequest", description = "推送数据")
public class ChemicalResultPushRequest
{

    /**样品号 sample*/
    @ApiModelProperty("sample")
    private String sample;

    /**数据类型 type access\txt*/
    @ApiModelProperty("type")
    private String type;

    /**实验室名称 laboratoryName*/
    @ApiModelProperty("laboratoryName")
    private String laboratoryName;

    /**原始数据id列表   orginIdList*/
    @ApiModelProperty("orginIdList")
    private List<String> orginIdList;

    /**数据发送人用户ID pushUserId*/
    @ApiModelProperty("pushUserId")
    private String pushUserId;

    /**数据接收人用户id列表 receiveUserIdList*/
    @ApiModelProperty("receiveUserIdList")
    private List<String>  receiveUserIdList;


}
