package com.ruoyi.vr.controller;

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
import com.ruoyi.vr.domain.VrCarrier;
import com.ruoyi.vr.service.IVrCarrierService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 载体Controller
 * 
 * @author lazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/vr/carrier")
public class VrCarrierController extends BaseController
{
    @Autowired
    private IVrCarrierService vrCarrierService;

    /**
     * 查询载体列表
     */
    @PreAuthorize("@ss.hasPermi('vr:carrier:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrCarrier vrCarrier)
    {
        startPage();
        List<VrCarrier> list = vrCarrierService.selectVrCarrierList(vrCarrier);
        return getDataTable(list);
    }

    /**
     * 导出载体列表
     */
    @PreAuthorize("@ss.hasPermi('vr:carrier:export')")
    @Log(title = "载体", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrCarrier vrCarrier)
    {
        List<VrCarrier> list = vrCarrierService.selectVrCarrierList(vrCarrier);
        ExcelUtil<VrCarrier> util = new ExcelUtil<VrCarrier>(VrCarrier.class);
        util.exportExcel(response, list, "载体数据");
    }

    /**
     * 获取载体详细信息
     */
    @PreAuthorize("@ss.hasPermi('vr:carrier:query')")
    @GetMapping(value = "/{carrierId}")
    public AjaxResult getInfo(@PathVariable("carrierId") Long carrierId)
    {
        return success(vrCarrierService.selectVrCarrierByCarrierId(carrierId));
    }

    /**
     * 新增载体
     */
    @PreAuthorize("@ss.hasPermi('vr:carrier:add')")
    @Log(title = "载体", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrCarrier vrCarrier)
    {
        return toAjax(vrCarrierService.insertVrCarrier(vrCarrier));
    }

    /**
     * 修改载体
     */
    @PreAuthorize("@ss.hasPermi('vr:carrier:edit')")
    @Log(title = "载体", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrCarrier vrCarrier)
    {
        return toAjax(vrCarrierService.updateVrCarrier(vrCarrier));
    }

    /**
     * 删除载体
     */
    @PreAuthorize("@ss.hasPermi('vr:carrier:remove')")
    @Log(title = "载体", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carrierIds}")
    public AjaxResult remove(@PathVariable Long[] carrierIds)
    {
        return toAjax(vrCarrierService.deleteVrCarrierByCarrierIds(carrierIds));
    }
}
