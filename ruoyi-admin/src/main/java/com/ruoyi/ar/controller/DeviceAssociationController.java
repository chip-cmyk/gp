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
import com.ruoyi.ar.domain.DeviceAssociation;
import com.ruoyi.ar.service.IDeviceAssociationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备关联Controller
 * 
 * @author lazy
 * @date 2025-03-25
 */
@RestController
@RequestMapping("/ar/deviceAssociation")
public class DeviceAssociationController extends BaseController
{
    @Autowired
    private IDeviceAssociationService deviceAssociationService;

    /**
     * 查询设备关联列表
     */
    @PreAuthorize("@ss.hasPermi('ar:deviceAssociation:list')")
    @GetMapping("/list")
    public TableDataInfo list(DeviceAssociation deviceAssociation)
    {
        startPage();
        List<DeviceAssociation> list = deviceAssociationService.selectDeviceAssociationList(deviceAssociation);
        return getDataTable(list);
    }

    /**
     * 导出设备关联列表
     */
    @PreAuthorize("@ss.hasPermi('ar:deviceAssociation:export')")
    @Log(title = "设备关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DeviceAssociation deviceAssociation)
    {
        List<DeviceAssociation> list = deviceAssociationService.selectDeviceAssociationList(deviceAssociation);
        ExcelUtil<DeviceAssociation> util = new ExcelUtil<DeviceAssociation>(DeviceAssociation.class);
        util.exportExcel(response, list, "设备关联数据");
    }

    /**
     * 获取设备关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:deviceAssociation:query')")
    @GetMapping(value = "/{qrCodeId}")
    public AjaxResult getInfo(@PathVariable("qrCodeId") Long qrCodeId)
    {
        return success(deviceAssociationService.selectDeviceAssociationByQrCodeId(qrCodeId));
    }

    /**
     * 新增设备关联
     */
    @PreAuthorize("@ss.hasPermi('ar:deviceAssociation:add')")
    @Log(title = "设备关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DeviceAssociation deviceAssociation)
    {
        return toAjax(deviceAssociationService.insertDeviceAssociation(deviceAssociation));
    }

    /**
     * 修改设备关联
     */
    @PreAuthorize("@ss.hasPermi('ar:deviceAssociation:edit')")
    @Log(title = "设备关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DeviceAssociation deviceAssociation)
    {
        return toAjax(deviceAssociationService.updateDeviceAssociation(deviceAssociation));
    }

    /**
     * 删除设备关联
     */
    @PreAuthorize("@ss.hasPermi('ar:deviceAssociation:remove')")
    @Log(title = "设备关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{qrCodeIds}")
    public AjaxResult remove(@PathVariable Long[] qrCodeIds)
    {
        return toAjax(deviceAssociationService.deleteDeviceAssociationByQrCodeIds(qrCodeIds));
    }
}
