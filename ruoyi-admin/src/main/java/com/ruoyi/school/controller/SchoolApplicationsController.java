package com.ruoyi.school.controller;

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
import com.ruoyi.school.domain.SchoolApplications;
import com.ruoyi.school.service.ISchoolApplicationsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 校企应用Controller
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
@RestController
@RequestMapping("/school/applications")
public class SchoolApplicationsController extends BaseController
{
    @Autowired
    private ISchoolApplicationsService schoolApplicationsService;

    /**
     * 查询校企应用列表
     */
    @PreAuthorize("@ss.hasPermi('school:applications:list')")
    @GetMapping("/list")
    public TableDataInfo list(SchoolApplications schoolApplications)
    {
        startPage();
        List<SchoolApplications> list = schoolApplicationsService.selectSchoolApplicationsList(schoolApplications);
        return getDataTable(list);
    }

    /**
     * 导出校企应用列表
     */
    @PreAuthorize("@ss.hasPermi('school:applications:export')")
    @Log(title = "校企应用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SchoolApplications schoolApplications)
    {
        List<SchoolApplications> list = schoolApplicationsService.selectSchoolApplicationsList(schoolApplications);
        ExcelUtil<SchoolApplications> util = new ExcelUtil<SchoolApplications>(SchoolApplications.class);
        util.exportExcel(response, list, "校企应用数据");
    }

    /**
     * 获取校企应用详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:applications:query')")
    @GetMapping(value = "/{appId}")
    public AjaxResult getInfo(@PathVariable("appId") Long appId)
    {
        return success(schoolApplicationsService.selectSchoolApplicationsByAppId(appId));
    }

    /**
     * 新增校企应用
     */
    @PreAuthorize("@ss.hasPermi('school:applications:add')")
    @Log(title = "校企应用", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SchoolApplications schoolApplications)
    {
        return toAjax(schoolApplicationsService.insertSchoolApplications(schoolApplications));
    }

    /**
     * 修改校企应用
     */
    @PreAuthorize("@ss.hasPermi('school:applications:edit')")
    @Log(title = "校企应用", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SchoolApplications schoolApplications)
    {
        return toAjax(schoolApplicationsService.updateSchoolApplications(schoolApplications));
    }

    /**
     * 删除校企应用
     */
    @PreAuthorize("@ss.hasPermi('school:applications:remove')")
    @Log(title = "校企应用", businessType = BusinessType.DELETE)
	@DeleteMapping("/{appIds}")
    public AjaxResult remove(@PathVariable Long[] appIds)
    {
        return toAjax(schoolApplicationsService.deleteSchoolApplicationsByAppIds(appIds));
    }
}
