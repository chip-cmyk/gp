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
import com.ruoyi.ar.domain.ArApplications;
import com.ruoyi.ar.service.IArApplicationsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * AR应用Controller
 * 
 * @author lazy
 * @date 2025-02-12
 */
@RestController
@RequestMapping("/ar/applications")
public class ArApplicationsController extends BaseController
{
    @Autowired
    private IArApplicationsService arApplicationsService;

    /**
     * 查询AR应用列表
     */
    @PreAuthorize("@ss.hasPermi('ar:applications:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArApplications arApplications)
    {
        startPage();
        List<ArApplications> list = arApplicationsService.selectArApplicationsList(arApplications);
        return getDataTable(list);
    }

    /**
     * 导出AR应用列表
     */
    @PreAuthorize("@ss.hasPermi('ar:applications:export')")
    @Log(title = "AR应用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArApplications arApplications)
    {
        List<ArApplications> list = arApplicationsService.selectArApplicationsList(arApplications);
        ExcelUtil<ArApplications> util = new ExcelUtil<ArApplications>(ArApplications.class);
        util.exportExcel(response, list, "AR应用数据");
    }

    /**
     * 获取AR应用详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:applications:query')")
    @GetMapping(value = "/{ApplicationID}")
    public AjaxResult getInfo(@PathVariable("ApplicationID") Long ApplicationID)
    {
        return success(arApplicationsService.selectArApplicationsByApplicationID(ApplicationID));
    }

    /**
     * 新增AR应用
     */
    @PreAuthorize("@ss.hasPermi('ar:applications:add')")
    @Log(title = "AR应用", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArApplications arApplications)
    {
        return toAjax(arApplicationsService.insertArApplications(arApplications));
    }

    /**
     * 修改AR应用
     */
    @PreAuthorize("@ss.hasPermi('ar:applications:edit')")
    @Log(title = "AR应用", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArApplications arApplications)
    {
        return toAjax(arApplicationsService.updateArApplications(arApplications));
    }

    /**
     * 删除AR应用
     */
    @PreAuthorize("@ss.hasPermi('ar:applications:remove')")
    @Log(title = "AR应用", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ApplicationIDs}")
    public AjaxResult remove(@PathVariable Long[] ApplicationIDs)
    {
        return toAjax(arApplicationsService.deleteArApplicationsByApplicationIDs(ApplicationIDs));
    }
}
