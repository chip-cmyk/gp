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
import com.ruoyi.ar.domain.MaterialTransaction;
import com.ruoyi.ar.service.IMaterialTransactionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 材料出入库单Controller
 * 
 * @author laazy
 * @date 2025-02-06
 */
@RestController
@RequestMapping("/ar/materialTransaction")
public class MaterialTransactionController extends BaseController
{
    @Autowired
    private IMaterialTransactionService materialTransactionService;

    /**
     * 查询材料出入库单列表
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransaction:list')")
    @GetMapping("/list")
    public TableDataInfo list(MaterialTransaction materialTransaction)
    {
        startPage();
        List<MaterialTransaction> list = materialTransactionService.selectMaterialTransactionList(materialTransaction);
        return getDataTable(list);
    }

    /**
     * 导出材料出入库单列表
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransaction:export')")
    @Log(title = "材料出入库单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MaterialTransaction materialTransaction)
    {
        List<MaterialTransaction> list = materialTransactionService.selectMaterialTransactionList(materialTransaction);
        ExcelUtil<MaterialTransaction> util = new ExcelUtil<MaterialTransaction>(MaterialTransaction.class);
        util.exportExcel(response, list, "材料出入库单数据");
    }

    /**
     * 获取材料出入库单详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransaction:query')")
    @GetMapping(value = "/{transactionId}")
    public AjaxResult getInfo(@PathVariable("transactionId") Long transactionId)
    {
        return success(materialTransactionService.selectMaterialTransactionByTransactionId(transactionId));
    }

    /**
     * 新增材料出入库单
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransaction:add')")
    @Log(title = "材料出入库单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MaterialTransaction materialTransaction)
    {
        return toAjax(materialTransactionService.insertMaterialTransaction(materialTransaction));
    }

    /**
     * 修改材料出入库单
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransaction:edit')")
    @Log(title = "材料出入库单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MaterialTransaction materialTransaction)
    {
        return toAjax(materialTransactionService.updateMaterialTransaction(materialTransaction));
    }

    /**
     * 删除材料出入库单
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransaction:remove')")
    @Log(title = "材料出入库单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{transactionIds}")
    public AjaxResult remove(@PathVariable Long[] transactionIds)
    {
        return toAjax(materialTransactionService.deleteMaterialTransactionByTransactionIds(transactionIds));
    }
}
