package com.ruoyi.web.controller.chemical;

import java.util.List;
import java.util.Arrays;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.ruoyi.chemical.domain.ChemicalResultTxtAvg;
import com.ruoyi.chemical.service.IChemicalResultTxtAvgService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * TXT发送数据Controller
 *
 * @author y
 * @date 2024-10-24
 */
@Api(tags="TXT发送数据管理")
@RestController
@RequestMapping("/chemical/txtAvg")
public class ChemicalResultTxtAvgController extends BaseController
{
    @Autowired
    private IChemicalResultTxtAvgService chemicalResultTxtAvgService;

    /**
     * 查询TXT发送数据列表
     */
    @ApiOperation("查询TXT发送数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:txtAvg:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChemicalResultTxtAvg chemicalResultTxtAvg)
    {
        startPage();
        List<ChemicalResultTxtAvg> list = chemicalResultTxtAvgService.selectChemicalResultTxtAvgList(chemicalResultTxtAvg);
        return getDataTable(list);
    }

    /**
     * 导出TXT发送数据列表
     */
    @ApiOperation("导出TXT发送数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:txtAvg:export')")
    @Log(title = "TXT发送数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChemicalResultTxtAvg chemicalResultTxtAvg)
    {
        List<ChemicalResultTxtAvg> list = chemicalResultTxtAvgService.selectChemicalResultTxtAvgList(chemicalResultTxtAvg);
        ExcelUtil<ChemicalResultTxtAvg> util = new ExcelUtil<ChemicalResultTxtAvg>(ChemicalResultTxtAvg.class);
        util.exportExcel(response, list, "TXT发送数据数据");
    }

    /**
     * 获取TXT发送数据详细信息
     */
    @ApiOperation("获取TXT发送数据详细信息")
    @PreAuthorize("@ss.hasPermi('chemical:txtAvg:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(chemicalResultTxtAvgService.getById(id));
    }

    /**
     * 新增TXT发送数据
     */
    @ApiOperation("新增TXT发送数据")
    @PreAuthorize("@ss.hasPermi('chemical:txtAvg:add')")
    @Log(title = "TXT发送数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChemicalResultTxtAvg chemicalResultTxtAvg)
    {
        return toAjax(chemicalResultTxtAvgService.save(chemicalResultTxtAvg));
    }

    /**
     * 修改TXT发送数据
     */
    @ApiOperation("修改TXT发送数据")
    @PreAuthorize("@ss.hasPermi('chemical:txtAvg:edit')")
    @Log(title = "TXT发送数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChemicalResultTxtAvg chemicalResultTxtAvg)
    {
        return toAjax(chemicalResultTxtAvgService.updateById(chemicalResultTxtAvg));
    }

    /**
     * 删除TXT发送数据
     */
    @ApiOperation("删除TXT发送数据")
    @PreAuthorize("@ss.hasPermi('chemical:txtAvg:remove')")
    @Log(title = "TXT发送数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(chemicalResultTxtAvgService.removeByIds(Arrays.asList(ids)));
    }
}
