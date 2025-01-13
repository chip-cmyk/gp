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
import com.ruoyi.system.domain.VrContent;
import com.ruoyi.system.service.IVrContentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR内容Controller
 * 
 * @author lazy
 * @date 2025-01-13
 */
@RestController
@RequestMapping("/system/content")
public class VrContentController extends BaseController
{
    @Autowired
    private IVrContentService vrContentService;

    /**
     * 查询VR内容列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrContent vrContent)
    {
        startPage();
        List<VrContent> list = vrContentService.selectVrContentList(vrContent);
        return getDataTable(list);
    }

    /**
     * 导出VR内容列表
     */
    @PreAuthorize("@ss.hasPermi('system:content:export')")
    @Log(title = "VR内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrContent vrContent)
    {
        List<VrContent> list = vrContentService.selectVrContentList(vrContent);
        ExcelUtil<VrContent> util = new ExcelUtil<VrContent>(VrContent.class);
        util.exportExcel(response, list, "VR内容数据");
    }

    /**
     * 获取VR内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:content:query')")
    @GetMapping(value = "/{contentId}")
    public AjaxResult getInfo(@PathVariable("contentId") Long contentId)
    {
        return success(vrContentService.selectVrContentByContentId(contentId));
    }

    /**
     * 新增VR内容
     */
    @PreAuthorize("@ss.hasPermi('system:content:add')")
    @Log(title = "VR内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrContent vrContent)
    {
        return toAjax(vrContentService.insertVrContent(vrContent));
    }

    /**
     * 修改VR内容
     */
    @PreAuthorize("@ss.hasPermi('system:content:edit')")
    @Log(title = "VR内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrContent vrContent)
    {
        return toAjax(vrContentService.updateVrContent(vrContent));
    }

    /**
     * 删除VR内容
     */
    @PreAuthorize("@ss.hasPermi('system:content:remove')")
    @Log(title = "VR内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{contentIds}")
    public AjaxResult remove(@PathVariable Long[] contentIds)
    {
        return toAjax(vrContentService.deleteVrContentByContentIds(contentIds));
    }
}
