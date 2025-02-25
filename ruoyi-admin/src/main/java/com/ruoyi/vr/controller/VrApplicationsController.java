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
import com.ruoyi.vr.domain.VrApplications;
import com.ruoyi.vr.service.IVrApplicationsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR应用Controller
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
@RestController
@RequestMapping("/vr/applications")
public class VrApplicationsController extends BaseController
{
    @Autowired
    private IVrApplicationsService vrApplicationsService;

    /**
     * 查询VR应用列表
     */
    @PreAuthorize("@ss.hasPermi('vr:applications:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrApplications vrApplications)
    {
        startPage();
        List<VrApplications> list = vrApplicationsService.selectVrApplicationsList(vrApplications);
        return getDataTable(list);
    }

    /**
     * 导出VR应用列表
     */
    @PreAuthorize("@ss.hasPermi('vr:applications:export')")
    @Log(title = "VR应用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrApplications vrApplications)
    {
        List<VrApplications> list = vrApplicationsService.selectVrApplicationsList(vrApplications);
        ExcelUtil<VrApplications> util = new ExcelUtil<VrApplications>(VrApplications.class);
        util.exportExcel(response, list, "VR应用数据");
    }

    /**
     * 获取VR应用详细信息
     */
    @PreAuthorize("@ss.hasPermi('vr:applications:query')")
    @GetMapping(value = "/{appId}")
    public AjaxResult getInfo(@PathVariable("appId") Long appId)
    {
        return success(vrApplicationsService.selectVrApplicationsByAppId(appId));
    }

    /**
     * 新增VR应用
     */
    @PreAuthorize("@ss.hasPermi('vr:applications:add')")
    @Log(title = "VR应用", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrApplications vrApplications)
    {
        return toAjax(vrApplicationsService.insertVrApplications(vrApplications));
    }

    /**
     * 修改VR应用
     */
    @PreAuthorize("@ss.hasPermi('vr:applications:edit')")
    @Log(title = "VR应用", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrApplications vrApplications)
    {
        return toAjax(vrApplicationsService.updateVrApplications(vrApplications));
    }

    /**
     * 删除VR应用
     */
    @PreAuthorize("@ss.hasPermi('vr:applications:remove')")
    @Log(title = "VR应用", businessType = BusinessType.DELETE)
	@DeleteMapping("/{appIds}")
    public AjaxResult remove(@PathVariable Long[] appIds)
    {
        return toAjax(vrApplicationsService.deleteVrApplicationsByAppIds(appIds));
    }
}
