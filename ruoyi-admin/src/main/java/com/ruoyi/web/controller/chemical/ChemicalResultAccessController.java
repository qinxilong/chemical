package com.ruoyi.web.controller.chemical;

import java.util.List;
import java.util.Arrays;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.chemical.domain.ChemicalResultAccess;
import com.ruoyi.chemical.service.IChemicalResultAccessService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * access实验数据Controller
 *
 * @author xy
 * @date 2024-10-23
 */
@Api(tags="access实验数据管理")
@RestController
@RequestMapping("/chemical/chemicalAccess")
public class ChemicalResultAccessController extends BaseController
{
    @Autowired
    private IChemicalResultAccessService chemicalResultAccessService;

    /**
     * 查询access实验数据列表
     */
    @ApiOperation("查询access实验数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalAccess:list')")
    @GetMapping("/list")
    public TableDataInfo list(ChemicalResultAccess chemicalResultAccess)
    {
        startPage();
        List<ChemicalResultAccess> list = chemicalResultAccessService.selectChemicalResultAccessList(chemicalResultAccess);
        return getDataTable(list);
    }

    /**
     * 导出access实验数据列表
     */
    @ApiOperation("导出access实验数据列表")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalAccess:export')")
    @Log(title = "access实验数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ChemicalResultAccess chemicalResultAccess)
    {
        List<ChemicalResultAccess> list = chemicalResultAccessService.selectChemicalResultAccessList(chemicalResultAccess);
        ExcelUtil<ChemicalResultAccess> util = new ExcelUtil<ChemicalResultAccess>(ChemicalResultAccess.class);
        util.exportExcel(response, list, "access实验数据数据");
    }

    /**
     * 获取access实验数据详细信息
     */
    @ApiOperation("获取access实验数据详细信息")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalAccess:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(chemicalResultAccessService.getById(id));
    }

    /**
     * 新增access实验数据
     */
    @ApiOperation("新增access实验数据")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalAccess:add')")
    @Log(title = "access实验数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ChemicalResultAccess chemicalResultAccess)
    {
        return toAjax(chemicalResultAccessService.save(chemicalResultAccess));
    }

    /**
     * 修改access实验数据
     */
    @ApiOperation("修改access实验数据")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalAccess:edit')")
    @Log(title = "access实验数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ChemicalResultAccess chemicalResultAccess)
    {
        return toAjax(chemicalResultAccessService.updateById(chemicalResultAccess));
    }

    /**
     * 删除access实验数据
     */
    @ApiOperation("删除access实验数据")
    @PreAuthorize("@ss.hasPermi('chemical:chemicalAccess:remove')")
    @Log(title = "access实验数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(chemicalResultAccessService.removeByIds(Arrays.asList(ids)));
    }
}
