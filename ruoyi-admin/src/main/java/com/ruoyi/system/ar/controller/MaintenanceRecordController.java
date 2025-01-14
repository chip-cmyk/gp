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
import com.ruoyi.system.ar.domain.MaintenanceRecord;
import com.ruoyi.system.ar.service.IMaintenanceRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 运维记录Controller
 * 
 * @author laazy
 * @date 2025-01-14
 */
@RestController
@RequestMapping("/ar/maintenance")
public class MaintenanceRecordController extends BaseController
{
    @Autowired
    private IMaintenanceRecordService maintenanceRecordService;

    /**
     * 查询运维记录列表
     */
    @PreAuthorize("@ss.hasPermi('ar:maintenance:list')")
    @GetMapping("/list")
    public TableDataInfo list(MaintenanceRecord maintenanceRecord)
    {
        startPage();
        List<MaintenanceRecord> list = maintenanceRecordService.selectMaintenanceRecordList(maintenanceRecord);
        return getDataTable(list);
    }

    /**
     * 导出运维记录列表
     */
    @PreAuthorize("@ss.hasPermi('ar:maintenance:export')")
    @Log(title = "运维记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MaintenanceRecord maintenanceRecord)
    {
        List<MaintenanceRecord> list = maintenanceRecordService.selectMaintenanceRecordList(maintenanceRecord);
        ExcelUtil<MaintenanceRecord> util = new ExcelUtil<MaintenanceRecord>(MaintenanceRecord.class);
        util.exportExcel(response, list, "运维记录数据");
    }

    /**
     * 获取运维记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:maintenance:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return success(maintenanceRecordService.selectMaintenanceRecordByRecordId(recordId));
    }

    /**
     * 新增运维记录
     */
    @PreAuthorize("@ss.hasPermi('ar:maintenance:add')")
    @Log(title = "运维记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MaintenanceRecord maintenanceRecord)
    {
        return toAjax(maintenanceRecordService.insertMaintenanceRecord(maintenanceRecord));
    }

    /**
     * 修改运维记录
     */
    @PreAuthorize("@ss.hasPermi('ar:maintenance:edit')")
    @Log(title = "运维记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MaintenanceRecord maintenanceRecord)
    {
        return toAjax(maintenanceRecordService.updateMaintenanceRecord(maintenanceRecord));
    }

    /**
     * 删除运维记录
     */
    @PreAuthorize("@ss.hasPermi('ar:maintenance:remove')")
    @Log(title = "运维记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(maintenanceRecordService.deleteMaintenanceRecordByRecordIds(recordIds));
    }
}
