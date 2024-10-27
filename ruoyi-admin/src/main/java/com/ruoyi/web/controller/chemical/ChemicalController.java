package com.ruoyi.web.controller.chemical;

import com.ruoyi.chemical.domain.ChemicalResult;
import com.ruoyi.chemical.domain.ChemicalResultAccessAvg;
import com.ruoyi.chemical.domain.ChemicalResultPushRequest;
import com.ruoyi.chemical.service.IChemicalResultAccessAvgService;
import com.ruoyi.chemical.service.IChemicalResultService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * access发送数据Controller
 *
 * @author xy
 * @date 2024-10-24
 */
@Api(tags="数据收发模块")
@RestController
@RequestMapping("/chemical/result")
public class ChemicalController extends BaseController
{
    @Autowired
    private IChemicalResultService chemicalResultService;

    /**
     * 新增实验数据
     */
    @ApiOperation("新增实验数据")
    @PostMapping("/receive")
    public AjaxResult add(@RequestBody ChemicalResult chemicalResult)
    {
        return toAjax(chemicalResultService.save(chemicalResult));
    }

    /**
     * 发送数据
     */
    @ApiOperation("发送数据")
    @Log(title = "发送数据", businessType = BusinessType.INSERT)
    @PostMapping("/push")
    public AjaxResult pushChemicalResult(@RequestBody ChemicalResultPushRequest chemicalResultPushRequest)
    {
        return toAjax(chemicalResultService.pushChemicalResult(chemicalResultPushRequest));
    }


    /**
     * 发送数据
     */
    @ApiOperation("发送ACCESS数据")
    @Log(title = "发送ACCESS数据", businessType = BusinessType.INSERT)
    @PostMapping("/access/push")
    public AjaxResult pushAccessResult(@RequestBody List<ChemicalResult> pushAccessResult)
    {
        return toAjax(chemicalResultService.pushAccessResult(pushAccessResult));
    }





    /**
     * 发送TXT数据
     */
    @ApiOperation("发送TXT数据")
    @Log(title = "发送TXT数据", businessType = BusinessType.INSERT)
    @PostMapping("/txt/push")
    public AjaxResult pushTxtResult(@RequestBody List<ChemicalResult> pushAccessResult)
    {
        return toAjax(chemicalResultService.pushTxtResult(pushAccessResult));
    }


}
