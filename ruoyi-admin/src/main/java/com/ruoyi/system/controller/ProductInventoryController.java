package com.ruoyi.system.controller;

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
import com.ruoyi.system.domain.ProductInventory;
import com.ruoyi.system.service.IProductInventoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品库存Controller
 * 
 * @author lazy
 * @date 2025-02-10
 */
@RestController
@RequestMapping("/system/inventory")
public class ProductInventoryController extends BaseController
{
    @Autowired
    private IProductInventoryService productInventoryService;

    /**
     * 查询产品库存列表
     */
    @PreAuthorize("@ss.hasPermi('system:inventory:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProductInventory productInventory)
    {
        startPage();
        List<ProductInventory> list = productInventoryService.selectProductInventoryList(productInventory);
        return getDataTable(list);
    }

    /**
     * 导出产品库存列表
     */
    @PreAuthorize("@ss.hasPermi('system:inventory:export')")
    @Log(title = "产品库存", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProductInventory productInventory)
    {
        List<ProductInventory> list = productInventoryService.selectProductInventoryList(productInventory);
        ExcelUtil<ProductInventory> util = new ExcelUtil<ProductInventory>(ProductInventory.class);
        util.exportExcel(response, list, "产品库存数据");
    }

    /**
     * 获取产品库存详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:inventory:query')")
    @GetMapping(value = "/{productId}")
    public AjaxResult getInfo(@PathVariable("productId") Long productId)
    {
        return success(productInventoryService.selectProductInventoryByProductId(productId));
    }

    /**
     * 新增产品库存
     */
    @PreAuthorize("@ss.hasPermi('system:inventory:add')")
    @Log(title = "产品库存", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProductInventory productInventory)
    {
        return toAjax(productInventoryService.insertProductInventory(productInventory));
    }

    /**
     * 修改产品库存
     */
    @PreAuthorize("@ss.hasPermi('system:inventory:edit')")
    @Log(title = "产品库存", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProductInventory productInventory)
    {
        return toAjax(productInventoryService.updateProductInventory(productInventory));
    }

    /**
     * 删除产品库存
     */
    @PreAuthorize("@ss.hasPermi('system:inventory:remove')")
    @Log(title = "产品库存", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productIds}")
    public AjaxResult remove(@PathVariable Long[] productIds)
    {
        return toAjax(productInventoryService.deleteProductInventoryByProductIds(productIds));
    }
}
