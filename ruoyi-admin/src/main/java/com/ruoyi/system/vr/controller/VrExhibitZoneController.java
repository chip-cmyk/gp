package com.ruoyi.system.vr.controller;

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
import com.ruoyi.system.vr.domain.VrExhibitZone;
import com.ruoyi.system.vr.service.IVrExhibitZoneService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR展区Controller
 * 
 * @author laazy
 * @date 2025-01-14
 */
@RestController
@RequestMapping("/vr/exhibitZone")
public class VrExhibitZoneController extends BaseController
{
    @Autowired
    private IVrExhibitZoneService vrExhibitZoneService;

    /**
     * 查询VR展区列表
     */
    @PreAuthorize("@ss.hasPermi('vr:exhibitZone:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrExhibitZone vrExhibitZone)
    {
        startPage();
        List<VrExhibitZone> list = vrExhibitZoneService.selectVrExhibitZoneList(vrExhibitZone);
        return getDataTable(list);
    }

    /**
     * 导出VR展区列表
     */
    @PreAuthorize("@ss.hasPermi('vr:exhibitZone:export')")
    @Log(title = "VR展区", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrExhibitZone vrExhibitZone)
    {
        List<VrExhibitZone> list = vrExhibitZoneService.selectVrExhibitZoneList(vrExhibitZone);
        ExcelUtil<VrExhibitZone> util = new ExcelUtil<VrExhibitZone>(VrExhibitZone.class);
        util.exportExcel(response, list, "VR展区数据");
    }

    /**
     * 获取VR展区详细信息
     */
    @PreAuthorize("@ss.hasPermi('vr:exhibitZone:query')")
    @GetMapping(value = "/{exhibitZoneId}")
    public AjaxResult getInfo(@PathVariable("exhibitZoneId") Long exhibitZoneId)
    {
        return success(vrExhibitZoneService.selectVrExhibitZoneByExhibitZoneId(exhibitZoneId));
    }

    /**
     * 新增VR展区
     */
    @PreAuthorize("@ss.hasPermi('vr:exhibitZone:add')")
    @Log(title = "VR展区", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrExhibitZone vrExhibitZone)
    {
        return toAjax(vrExhibitZoneService.insertVrExhibitZone(vrExhibitZone));
    }

    /**
     * 修改VR展区
     */
    @PreAuthorize("@ss.hasPermi('vr:exhibitZone:edit')")
    @Log(title = "VR展区", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrExhibitZone vrExhibitZone)
    {
        return toAjax(vrExhibitZoneService.updateVrExhibitZone(vrExhibitZone));
    }

    /**
     * 删除VR展区
     */
    @PreAuthorize("@ss.hasPermi('vr:exhibitZone:remove')")
    @Log(title = "VR展区", businessType = BusinessType.DELETE)
	@DeleteMapping("/{exhibitZoneIds}")
    public AjaxResult remove(@PathVariable Long[] exhibitZoneIds)
    {
        return toAjax(vrExhibitZoneService.deleteVrExhibitZoneByExhibitZoneIds(exhibitZoneIds));
    }
}
