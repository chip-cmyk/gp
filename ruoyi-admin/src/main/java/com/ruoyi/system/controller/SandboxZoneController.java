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
import com.ruoyi.system.domain.SandboxZone;
import com.ruoyi.system.service.ISandboxZoneService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 沙盘分区Controller
 * 
 * @author lazy
 * @date 2025-01-13
 */
@RestController
@RequestMapping("/system/zone")
public class SandboxZoneController extends BaseController
{
    @Autowired
    private ISandboxZoneService sandboxZoneService;

    /**
     * 查询沙盘分区列表
     */
    @PreAuthorize("@ss.hasPermi('system:zone:list')")
    @GetMapping("/list")
    public TableDataInfo list(SandboxZone sandboxZone)
    {
        startPage();
        List<SandboxZone> list = sandboxZoneService.selectSandboxZoneList(sandboxZone);
        return getDataTable(list);
    }

    /**
     * 导出沙盘分区列表
     */
    @PreAuthorize("@ss.hasPermi('system:zone:export')")
    @Log(title = "沙盘分区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SandboxZone sandboxZone)
    {
        List<SandboxZone> list = sandboxZoneService.selectSandboxZoneList(sandboxZone);
        ExcelUtil<SandboxZone> util = new ExcelUtil<SandboxZone>(SandboxZone.class);
        util.exportExcel(response, list, "沙盘分区数据");
    }

    /**
     * 获取沙盘分区详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:zone:query')")
    @GetMapping(value = "/{zoneId}")
    public AjaxResult getInfo(@PathVariable("zoneId") Long zoneId)
    {
        return success(sandboxZoneService.selectSandboxZoneByZoneId(zoneId));
    }

    /**
     * 新增沙盘分区
     */
    @PreAuthorize("@ss.hasPermi('system:zone:add')")
    @Log(title = "沙盘分区", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SandboxZone sandboxZone)
    {
        return toAjax(sandboxZoneService.insertSandboxZone(sandboxZone));
    }

    /**
     * 修改沙盘分区
     */
    @PreAuthorize("@ss.hasPermi('system:zone:edit')")
    @Log(title = "沙盘分区", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SandboxZone sandboxZone)
    {
        return toAjax(sandboxZoneService.updateSandboxZone(sandboxZone));
    }

    /**
     * 删除沙盘分区
     */
    @PreAuthorize("@ss.hasPermi('system:zone:remove')")
    @Log(title = "沙盘分区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{zoneIds}")
    public AjaxResult remove(@PathVariable Long[] zoneIds)
    {
        return toAjax(sandboxZoneService.deleteSandboxZoneByZoneIds(zoneIds));
    }
}
