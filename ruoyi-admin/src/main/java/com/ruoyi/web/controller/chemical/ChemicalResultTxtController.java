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
import com.ruoyi.chemical.domain.ChemicalResultTxt;
import com.ruoyi.chemical.service.IChemicalResultTxtService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * txt实验数据Controller
 *
 * @author xy
 * @date 2024-10-24
 */
@Api(tags="txt实验数据管理")
@RestController
@RequestMapping("/chemical/chemicalTxt")
public class ChemicalResultTxtController extends BaseController
{
    @Autowired
    private IChemicalResultTxtService chemicalResultTxtService;

    /**
     * 查询txt实验数据列表
     */
    @ApiOperation("查询txt实验数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalTxt:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChemicalResultTxt chemicalResultTxt)
    {
        startPage();
        List<ChemicalResultTxt> list = chemicalResultTxtService.selectChemicalResultTxtList(chemicalResultTxt);
        return getDataTable(list);
    }

    /**
     * 导出txt实验数据列表
     */
    @ApiOperation("导出txt实验数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalTxt:export')")
    @Log(title = "txt实验数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChemicalResultTxt chemicalResultTxt)
    {
        List<ChemicalResultTxt> list = chemicalResultTxtService.selectChemicalResultTxtList(chemicalResultTxt);
        ExcelUtil<ChemicalResultTxt> util = new ExcelUtil<ChemicalResultTxt>(ChemicalResultTxt.class);
        util.exportExcel(response, list, "txt实验数据数据");
    }

    /**
     * 获取txt实验数据详细信息
     */
    @ApiOperation("获取txt实验数据详细信息")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalTxt:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(chemicalResultTxtService.getById(id));
    }

    /**
     * 新增txt实验数据
     */
    @ApiOperation("新增txt实验数据")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalTxt:add')")
    @Log(title = "txt实验数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChemicalResultTxt chemicalResultTxt)
    {
        return toAjax(chemicalResultTxtService.save(chemicalResultTxt));
    }

    /**
     * 修改txt实验数据
     */
    @ApiOperation("修改txt实验数据")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalTxt:edit')")
    @Log(title = "txt实验数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChemicalResultTxt chemicalResultTxt)
    {
        return toAjax(chemicalResultTxtService.updateById(chemicalResultTxt));
    }

    /**
     * 删除txt实验数据
     */
    @ApiOperation("删除txt实验数据")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalTxt:remove')")
    @Log(title = "txt实验数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(chemicalResultTxtService.removeByIds(Arrays.asList(ids)));
    }
}
