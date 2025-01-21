package com.ruoyi.ar.controller;

import java.util.List;
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
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ar.domain.SupplyBatch;
import com.ruoyi.ar.service.ISupplyBatchService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 供应批次Controller
 * 
 * @author laazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/ar/supplyBatch")
public class SupplyBatchController extends BaseController
{
    @Autowired
    private ISupplyBatchService supplyBatchService;

    /**
     * 查询供应批次列表
     */
    @PreAuthorize("@ss.hasPermi('ar:supplyBatch:list')")
    @GetMapping("/list")
    public TableDataInfo list(SupplyBatch supplyBatch)
    {
        startPage();
        List<SupplyBatch> list = supplyBatchService.selectSupplyBatchList(supplyBatch);
        return getDataTable(list);
    }

    /**
     * 导出供应批次列表
     */
    @PreAuthorize("@ss.hasPermi('ar:supplyBatch:export')")
    @Log(title = "供应批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SupplyBatch supplyBatch)
    {
        List<SupplyBatch> list = supplyBatchService.selectSupplyBatchList(supplyBatch);
        ExcelUtil<SupplyBatch> util = new ExcelUtil<SupplyBatch>(SupplyBatch.class);
        util.exportExcel(response, list, "供应批次数据");
    }

    /**
     * 获取供应批次详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:supplyBatch:query')")
    @GetMapping(value = "/{batchId}")
    public AjaxResult getInfo(@PathVariable("batchId") Long batchId)
    {
        return success(supplyBatchService.selectSupplyBatchByBatchId(batchId));
    }

    /**
     * 新增供应批次
     */
    @PreAuthorize("@ss.hasPermi('ar:supplyBatch:add')")
    @Log(title = "供应批次", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SupplyBatch supplyBatch)
    {
        return toAjax(supplyBatchService.insertSupplyBatch(supplyBatch));
    }

    /**
     * 修改供应批次
     */
    @PreAuthorize("@ss.hasPermi('ar:supplyBatch:edit')")
    @Log(title = "供应批次", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SupplyBatch supplyBatch)
    {
        return toAjax(supplyBatchService.updateSupplyBatch(supplyBatch));
    }

    /**
     * 删除供应批次
     */
    @PreAuthorize("@ss.hasPermi('ar:supplyBatch:remove')")
    @Log(title = "供应批次", businessType = BusinessType.DELETE)
	@DeleteMapping("/{batchIds}")
    public AjaxResult remove(@PathVariable Long[] batchIds)
    {
        return toAjax(supplyBatchService.deleteSupplyBatchByBatchIds(batchIds));
    }
}
