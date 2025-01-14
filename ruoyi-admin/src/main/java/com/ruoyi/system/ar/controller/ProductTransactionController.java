package com.ruoyi.system.ar.controller;

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
import com.ruoyi.system.ar.domain.ProductTransaction;
import com.ruoyi.system.ar.service.IProductTransactionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品出入库单Controller
 * 
 * @author laazy
 * @date 2025-01-14
 */
@RestController
@RequestMapping("/ar/productTransaction")
public class ProductTransactionController extends BaseController
{
    @Autowired
    private IProductTransactionService productTransactionService;

    /**
     * 查询产品出入库单列表
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransaction:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProductTransaction productTransaction)
    {
        startPage();
        List<ProductTransaction> list = productTransactionService.selectProductTransactionList(productTransaction);
        return getDataTable(list);
    }

    /**
     * 导出产品出入库单列表
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransaction:export')")
    @Log(title = "产品出入库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProductTransaction productTransaction)
    {
        List<ProductTransaction> list = productTransactionService.selectProductTransactionList(productTransaction);
        ExcelUtil<ProductTransaction> util = new ExcelUtil<ProductTransaction>(ProductTransaction.class);
        util.exportExcel(response, list, "产品出入库单数据");
    }

    /**
     * 获取产品出入库单详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransaction:query')")
    @GetMapping(value = "/{transactionId}")
    public AjaxResult getInfo(@PathVariable("transactionId") Long transactionId)
    {
        return success(productTransactionService.selectProductTransactionByTransactionId(transactionId));
    }

    /**
     * 新增产品出入库单
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransaction:add')")
    @Log(title = "产品出入库单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProductTransaction productTransaction)
    {
        return toAjax(productTransactionService.insertProductTransaction(productTransaction));
    }

    /**
     * 修改产品出入库单
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransaction:edit')")
    @Log(title = "产品出入库单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProductTransaction productTransaction)
    {
        return toAjax(productTransactionService.updateProductTransaction(productTransaction));
    }

    /**
     * 删除产品出入库单
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransaction:remove')")
    @Log(title = "产品出入库单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{transactionIds}")
    public AjaxResult remove(@PathVariable Long[] transactionIds)
    {
        return toAjax(productTransactionService.deleteProductTransactionByTransactionIds(transactionIds));
    }
}
