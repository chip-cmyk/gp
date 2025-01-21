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
import com.ruoyi.ar.domain.MaterialTransactionDetail;
import com.ruoyi.ar.service.IMaterialTransactionDetailService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 材料清单明细Controller
 * 
 * @author laazy
 * @date 2025-01-21
 */
@RestController
@RequestMapping("/ar/materialTransactionDetail")
public class MaterialTransactionDetailController extends BaseController
{
    @Autowired
    private IMaterialTransactionDetailService materialTransactionDetailService;

    /**
     * 查询材料清单明细列表
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransactionDetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(MaterialTransactionDetail materialTransactionDetail)
    {
        startPage();
        List<MaterialTransactionDetail> list = materialTransactionDetailService.selectMaterialTransactionDetailList(materialTransactionDetail);
        return getDataTable(list);
    }

    /**
     * 导出材料清单明细列表
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransactionDetail:export')")
    @Log(title = "材料清单明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MaterialTransactionDetail materialTransactionDetail)
    {
        List<MaterialTransactionDetail> list = materialTransactionDetailService.selectMaterialTransactionDetailList(materialTransactionDetail);
        ExcelUtil<MaterialTransactionDetail> util = new ExcelUtil<MaterialTransactionDetail>(MaterialTransactionDetail.class);
        util.exportExcel(response, list, "材料清单明细数据");
    }

    /**
     * 获取材料清单明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransactionDetail:query')")
    @GetMapping(value = "/{materialId}")
    public AjaxResult getInfo(@PathVariable("materialId") Long materialId)
    {
        return success(materialTransactionDetailService.selectMaterialTransactionDetailByMaterialId(materialId));
    }

    /**
     * 新增材料清单明细
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransactionDetail:add')")
    @Log(title = "材料清单明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MaterialTransactionDetail materialTransactionDetail)
    {
        return toAjax(materialTransactionDetailService.insertMaterialTransactionDetail(materialTransactionDetail));
    }

    /**
     * 修改材料清单明细
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransactionDetail:edit')")
    @Log(title = "材料清单明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MaterialTransactionDetail materialTransactionDetail)
    {
        return toAjax(materialTransactionDetailService.updateMaterialTransactionDetail(materialTransactionDetail));
    }

    /**
     * 删除材料清单明细
     */
    @PreAuthorize("@ss.hasPermi('ar:materialTransactionDetail:remove')")
    @Log(title = "材料清单明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public AjaxResult remove(@PathVariable Long[] materialIds)
    {
        return toAjax(materialTransactionDetailService.deleteMaterialTransactionDetailByMaterialIds(materialIds));
    }
}
