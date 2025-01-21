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
import com.ruoyi.ar.domain.ProductionBatch;
import com.ruoyi.ar.service.IProductionBatchService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 生产批次Controller
 * 
 * @author lazy
 * @date 2025-01-21
 */
@RestController
@RequestMapping("/ar/batch")
public class ProductionBatchController extends BaseController
{
    @Autowired
    private IProductionBatchService productionBatchService;

    /**
     * 查询生产批次列表
     */
    @PreAuthorize("@ss.hasPermi('ar:batch:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProductionBatch productionBatch)
    {
        startPage();
        List<ProductionBatch> list = productionBatchService.selectProductionBatchList(productionBatch);
        return getDataTable(list);
    }

    /**
     * 导出生产批次列表
     */
    @PreAuthorize("@ss.hasPermi('ar:batch:export')")
    @Log(title = "生产批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProductionBatch productionBatch)
    {
        List<ProductionBatch> list = productionBatchService.selectProductionBatchList(productionBatch);
        ExcelUtil<ProductionBatch> util = new ExcelUtil<ProductionBatch>(ProductionBatch.class);
        util.exportExcel(response, list, "生产批次数据");
    }

    /**
     * 获取生产批次详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:batch:query')")
    @GetMapping(value = "/{batchId}")
    public AjaxResult getInfo(@PathVariable("batchId") Long batchId)
    {
        return success(productionBatchService.selectProductionBatchByBatchId(batchId));
    }

    /**
     * 新增生产批次
     */
    @PreAuthorize("@ss.hasPermi('ar:batch:add')")
    @Log(title = "生产批次", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProductionBatch productionBatch)
    {
        return toAjax(productionBatchService.insertProductionBatch(productionBatch));
    }

    /**
     * 修改生产批次
     */
    @PreAuthorize("@ss.hasPermi('ar:batch:edit')")
    @Log(title = "生产批次", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProductionBatch productionBatch)
    {
        return toAjax(productionBatchService.updateProductionBatch(productionBatch));
    }

    /**
     * 删除生产批次
     */
    @PreAuthorize("@ss.hasPermi('ar:batch:remove')")
    @Log(title = "生产批次", businessType = BusinessType.DELETE)
	@DeleteMapping("/{batchIds}")
    public AjaxResult remove(@PathVariable Long[] batchIds)
    {
        return toAjax(productionBatchService.deleteProductionBatchByBatchIds(batchIds));
    }
}
