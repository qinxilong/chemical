package com.ruoyi.web.controller.chemical;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.chemical.domain.*;
import com.ruoyi.chemical.service.*;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 实验数据推送记录Controller
 *
 * @author xy
 * @date 2024-10-26
 */
@Api(tags="实验数据推送记录管理")
@RestController
@RequestMapping("/chemical/pushRecord")
public class ChemicalResultPushRecordController extends BaseController
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private IChemicalResultPushRecordService chemicalResultPushRecordService;
 
    @Autowired
    private IChemicalResultAccessService chemicalResultAccessService;

    @Autowired
    private IChemicalResultAccessAvgService chemicalResultAccessAvgService;

    @Autowired
    private IChemicalResultTxtService chemicalResultTxtService;

    @Autowired
    private IChemicalResultTxtAvgService chemicalResultTxtAvgService;

    /**
     * 查询实验数据推送记录列表
     */
    @ApiOperation("查询实验数据推送记录列表")
    @PreAuthorize("@ss.hasPermi('chemical:pushRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChemicalResultPushRecord chemicalResultPushRecord)
    {
        startPage();
        List<ChemicalResultPushRecord> list = chemicalResultPushRecordService.selectChemicalResultPushRecordList(chemicalResultPushRecord);
        list.stream().forEach(record -> {
            SysUser pushUser = userService.selectUserById(Long.valueOf(record.getPushUserId()));
            SysUser receiveUser = userService.selectUserById(Long.valueOf(record.getReceiveUserId()));
            if(pushUser!=null){
                record.setPushUserName(pushUser.getNickName());
            }
            if(receiveUser!=null){
                record.setReceiveUserName(receiveUser.getNickName());
            }
        });
        return getDataTable(list);
    }

    /**
     * 导出实验数据推送记录列表
     */
    @ApiOperation("导出实验数据推送记录列表")
    @PreAuthorize("@ss.hasPermi('chemical:pushRecord:export')")
    @Log(title = "实验数据推送记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChemicalResultPushRecord chemicalResultPushRecord)
    {
        List<ChemicalResultPushRecord> list = chemicalResultPushRecordService.selectChemicalResultPushRecordList(chemicalResultPushRecord);
        ExcelUtil<ChemicalResultPushRecord> util = new ExcelUtil<ChemicalResultPushRecord>(ChemicalResultPushRecord.class);
        util.exportExcel(response, list, "实验数据推送记录数据");
    }

    /**
     * 获取实验数据推送记录详细信息
     */
    @ApiOperation("获取实验数据推送记录详细信息")
    @PreAuthorize("@ss.hasPermi('chemical:pushRecord:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
//        ChemicalResultPushRecord record = chemicalResultPushRecordService.getById(id);
        ChemicalResultPushRecord record = chemicalResultPushRecordService.selectPushRecordWithUserNames(id);
        record = getDataDetail(record);
        return success(record);
    }

    /**
     * 获取发送数据详情
     * @param record
     * @return
     */
    private ChemicalResultPushRecord getDataDetail(ChemicalResultPushRecord record) {
      List<Object> originDataList = new ArrayList<>();
      Object targetData = new Object();
      List<String> originIdList = new ArrayList<>();
      String originIds = record.getOrginIds();
      if(StringUtils.isNotEmpty(originIds)) {
        String[] strArray = originIds.split(",");
        originIdList = new ArrayList<>(Arrays.asList(strArray));
      }
      if("txt".equalsIgnoreCase(record.getType())){
          originIdList.stream().forEach(originId->{//原始数据
              ChemicalResultTxt chemicalResultTxt = chemicalResultTxtService.getById(originId);
              originDataList.add(chemicalResultTxt);
            }
          );
          targetData = chemicalResultTxtAvgService.getById(record.getTargetId());//发送数据
      }else{
          originIdList.stream().forEach(originId->{//原始数据
                      ChemicalResultAccess chemicalResultAccess = chemicalResultAccessService.getById(originId);
                      originDataList.add(chemicalResultAccess);
                  }
          );
          targetData = chemicalResultAccessAvgService.getById(record.getTargetId());//发送数据
      }
      record.setOriginDataList(originDataList);
      record.setTargetData(targetData);
      return record;
    }

    /**
     * 新增实验数据推送记录
     */
    @ApiOperation("新增实验数据推送记录")
    @PreAuthorize("@ss.hasPermi('chemical:pushRecord:add')")
    @Log(title = "实验数据推送记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChemicalResultPushRecord chemicalResultPushRecord)
    {
        return toAjax(chemicalResultPushRecordService.save(chemicalResultPushRecord));
    }

    /**
     * 修改实验数据推送记录
     */
    @ApiOperation("修改实验数据推送记录")
    @PreAuthorize("@ss.hasPermi('chemical:pushRecord:edit')")
    @Log(title = "实验数据推送记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChemicalResultPushRecord chemicalResultPushRecord)
    {
        return toAjax(chemicalResultPushRecordService.updateById(chemicalResultPushRecord));
    }

    /**
     * 删除实验数据推送记录
     */
    @ApiOperation("删除实验数据推送记录")
    @PreAuthorize("@ss.hasPermi('chemical:pushRecord:remove')")
    @Log(title = "实验数据推送记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @Transactional
    public AjaxResult remove(@PathVariable String[] ids)
    {
        //删除目标数据
        if(ids.length==0){
            return toAjax(false);
        }
        List<String> accessAvgList = new ArrayList<>();
        List<String> txtAvgList = new ArrayList<>();

        List<ChemicalResultPushRecord> pushRecordList = chemicalResultPushRecordService.getByIds(ids);
        pushRecordList.stream().forEach(
                pushRecord->{
                    if("txt".equalsIgnoreCase(pushRecord.getType())){
                        txtAvgList.add(pushRecord.getTargetId());
                    }else{
                        accessAvgList.add(pushRecord.getTargetId());
                    }
                }
        );
        if(txtAvgList.size()>0){
            chemicalResultAccessAvgService.removeBatchByIds(txtAvgList);
        }
        if(accessAvgList.size()>0){
            chemicalResultTxtAvgService.removeBatchByIds(accessAvgList);
        }
        return toAjax(chemicalResultPushRecordService.removeByIds(Arrays.asList(ids)));
    }
    
    
}
