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
import com.ruoyi.system.ar.domain.WarehouseZone;
import com.ruoyi.system.ar.service.IWarehouseZoneService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库区Controller
 * 
 * @author laazy
 * @date 2025-01-14
 */
@RestController
@RequestMapping("/ar/warehouse")
public class WarehouseZoneController extends BaseController
{
    @Autowired
    private IWarehouseZoneService warehouseZoneService;

    /**
     * 查询库区列表
     */
    @PreAuthorize("@ss.hasPermi('ar:warehouse:list')")
    @GetMapping("/list")
    public TableDataInfo list(WarehouseZone warehouseZone)
    {
        startPage();
        List<WarehouseZone> list = warehouseZoneService.selectWarehouseZoneList(warehouseZone);
        return getDataTable(list);
    }

    /**
     * 导出库区列表
     */
    @PreAuthorize("@ss.hasPermi('ar:warehouse:export')")
    @Log(title = "库区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WarehouseZone warehouseZone)
    {
        List<WarehouseZone> list = warehouseZoneService.selectWarehouseZoneList(warehouseZone);
        ExcelUtil<WarehouseZone> util = new ExcelUtil<WarehouseZone>(WarehouseZone.class);
        util.exportExcel(response, list, "库区数据");
    }

    /**
     * 获取库区详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:warehouse:query')")
    @GetMapping(value = "/{zoneId}")
    public AjaxResult getInfo(@PathVariable("zoneId") Long zoneId)
    {
        return success(warehouseZoneService.selectWarehouseZoneByZoneId(zoneId));
    }

    /**
     * 新增库区
     */
    @PreAuthorize("@ss.hasPermi('ar:warehouse:add')")
    @Log(title = "库区", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WarehouseZone warehouseZone)
    {
        return toAjax(warehouseZoneService.insertWarehouseZone(warehouseZone));
    }

    /**
     * 修改库区
     */
    @PreAuthorize("@ss.hasPermi('ar:warehouse:edit')")
    @Log(title = "库区", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WarehouseZone warehouseZone)
    {
        return toAjax(warehouseZoneService.updateWarehouseZone(warehouseZone));
    }

    /**
     * 删除库区
     */
    @PreAuthorize("@ss.hasPermi('ar:warehouse:remove')")
    @Log(title = "库区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{zoneIds}")
    public AjaxResult remove(@PathVariable Long[] zoneIds)
    {
        return toAjax(warehouseZoneService.deleteWarehouseZoneByZoneIds(zoneIds));
    }
}
