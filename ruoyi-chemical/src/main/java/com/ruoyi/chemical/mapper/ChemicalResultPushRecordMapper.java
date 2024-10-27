package com.ruoyi.chemical.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.chemical.domain.ChemicalResultPushRecord;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 实验数据推送记录Mapper接口
 *
 * @author xy
 * @date 2024-10-26
 */
public interface ChemicalResultPushRecordMapper extends BaseMapper<ChemicalResultPushRecord> {
    // 使用 @Select 注解编写自定义 SQL 查询
    @Select("SELECT " +
            "puser.nick_name as pushUserName, " +
            "ruser.nick_name as receiveUserName, " +
            "rd.* " +
            "FROM chemical_result_push_record rd " +
            "JOIN sys_user puser ON rd.push_user_id = puser.user_id " +
            "JOIN sys_user ruser ON rd.receive_user_id = ruser.user_id " +
            "WHERE rd.id = #{id}")
    ChemicalResultPushRecord selectPushRecordWithUserNames(@Param("id") String id);
}
