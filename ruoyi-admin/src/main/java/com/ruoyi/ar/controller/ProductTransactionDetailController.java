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
import com.ruoyi.ar.domain.ProductTransactionDetail;
import com.ruoyi.ar.service.IProductTransactionDetailService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品清单明细Controller
 * 
 * @author laazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/ar/productTransactionDetail")
public class ProductTransactionDetailController extends BaseController
{
    @Autowired
    private IProductTransactionDetailService productTransactionDetailService;

    /**
     * 查询产品清单明细列表
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransactionDetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProductTransactionDetail productTransactionDetail)
    {
        startPage();
        List<ProductTransactionDetail> list = productTransactionDetailService.selectProductTransactionDetailList(productTransactionDetail);
        return getDataTable(list);
    }

    /**
     * 导出产品清单明细列表
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransactionDetail:export')")
    @Log(title = "产品清单明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ProductTransactionDetail productTransactionDetail)
    {
        List<ProductTransactionDetail> list = productTransactionDetailService.selectProductTransactionDetailList(productTransactionDetail);
        ExcelUtil<ProductTransactionDetail> util = new ExcelUtil<ProductTransactionDetail>(ProductTransactionDetail.class);
        util.exportExcel(response, list, "产品清单明细数据");
    }

    /**
     * 获取产品清单明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransactionDetail:query')")
    @GetMapping(value = "/{productId}")
    public AjaxResult getInfo(@PathVariable("productId") Long productId)
    {
        return success(productTransactionDetailService.selectProductTransactionDetailByProductId(productId));
    }

    /**
     * 新增产品清单明细
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransactionDetail:add')")
    @Log(title = "产品清单明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProductTransactionDetail productTransactionDetail)
    {
        return toAjax(productTransactionDetailService.insertProductTransactionDetail(productTransactionDetail));
    }

    /**
     * 修改产品清单明细
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransactionDetail:edit')")
    @Log(title = "产品清单明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProductTransactionDetail productTransactionDetail)
    {
        return toAjax(productTransactionDetailService.updateProductTransactionDetail(productTransactionDetail));
    }

    /**
     * 删除产品清单明细
     */
    @PreAuthorize("@ss.hasPermi('ar:productTransactionDetail:remove')")
    @Log(title = "产品清单明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productIds}")
    public AjaxResult remove(@PathVariable Long[] productIds)
    {
        return toAjax(productTransactionDetailService.deleteProductTransactionDetailByProductIds(productIds));
    }
}
