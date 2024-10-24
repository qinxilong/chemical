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
import com.ruoyi.chemical.domain.ChemicalResultAccessAvg;
import com.ruoyi.chemical.service.IChemicalResultAccessAvgService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * access发送数据Controller
 *
 * @author xy
 * @date 2024-10-24
 */
@Api(tags="access发送数据管理")
@RestController
@RequestMapping("/chemical/accessAvg")
public class ChemicalResultAccessAvgController extends BaseController
{
    @Autowired
    private IChemicalResultAccessAvgService chemicalResultAccessAvgService;

    /**
     * 查询access发送数据列表
     */
    @ApiOperation("查询access发送数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:accessAvg:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChemicalResultAccessAvg chemicalResultAccessAvg)
    {
        startPage();
        List<ChemicalResultAccessAvg> list = chemicalResultAccessAvgService.selectChemicalResultAccessAvgList(chemicalResultAccessAvg);
        return getDataTable(list);
    }

    /**
     * 导出access发送数据列表
     */
    @ApiOperation("导出access发送数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:accessAvg:export')")
    @Log(title = "access发送数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChemicalResultAccessAvg chemicalResultAccessAvg)
    {
        List<ChemicalResultAccessAvg> list = chemicalResultAccessAvgService.selectChemicalResultAccessAvgList(chemicalResultAccessAvg);
        ExcelUtil<ChemicalResultAccessAvg> util = new ExcelUtil<ChemicalResultAccessAvg>(ChemicalResultAccessAvg.class);
        util.exportExcel(response, list, "access发送数据数据");
    }

    /**
     * 获取access发送数据详细信息
     */
    @ApiOperation("获取access发送数据详细信息")
    @PreAuthorize("@ss.hasPermi('chemical:accessAvg:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(chemicalResultAccessAvgService.getById(id));
    }

    /**
     * 新增access发送数据
     */
    @ApiOperation("新增access发送数据")
    @PreAuthorize("@ss.hasPermi('chemical:accessAvg:add')")
    @Log(title = "access发送数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChemicalResultAccessAvg chemicalResultAccessAvg)
    {
        return toAjax(chemicalResultAccessAvgService.save(chemicalResultAccessAvg));
    }

    /**
     * 修改access发送数据
     */
    @ApiOperation("修改access发送数据")
    @PreAuthorize("@ss.hasPermi('chemical:accessAvg:edit')")
    @Log(title = "access发送数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChemicalResultAccessAvg chemicalResultAccessAvg)
    {
        return toAjax(chemicalResultAccessAvgService.updateById(chemicalResultAccessAvg));
    }

    /**
     * 删除access发送数据
     */
    @ApiOperation("删除access发送数据")
    @PreAuthorize("@ss.hasPermi('chemical:accessAvg:remove')")
    @Log(title = "access发送数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(chemicalResultAccessAvgService.removeByIds(Arrays.asList(ids)));
    }
}
