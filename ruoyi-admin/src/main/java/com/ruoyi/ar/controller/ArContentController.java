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
import com.ruoyi.ar.domain.ArContent;
import com.ruoyi.ar.service.IArContentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * AR内容Controller
 * 
 * @author lazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/ar/content")
public class ArContentController extends BaseController
{
    @Autowired
    private IArContentService arContentService;

    /**
     * 查询AR内容列表
     */
    @PreAuthorize("@ss.hasPermi('ar:content:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArContent arContent)
    {
        startPage();
        List<ArContent> list = arContentService.selectArContentList(arContent);
        return getDataTable(list);
    }

    /**
     * 导出AR内容列表
     */
    @PreAuthorize("@ss.hasPermi('ar:content:export')")
    @Log(title = "AR内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArContent arContent)
    {
        List<ArContent> list = arContentService.selectArContentList(arContent);
        ExcelUtil<ArContent> util = new ExcelUtil<ArContent>(ArContent.class);
        util.exportExcel(response, list, "AR内容数据");
    }

    /**
     * 获取AR内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:content:query')")
    @GetMapping(value = "/{arContentId}")
    public AjaxResult getInfo(@PathVariable("arContentId") Long arContentId)
    {
        return success(arContentService.selectArContentByArContentId(arContentId));
    }

    /**
     * 新增AR内容
     */
    @PreAuthorize("@ss.hasPermi('ar:content:add')")
    @Log(title = "AR内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArContent arContent)
    {
        return toAjax(arContentService.insertArContent(arContent));
    }

    /**
     * 修改AR内容
     */
    @PreAuthorize("@ss.hasPermi('ar:content:edit')")
    @Log(title = "AR内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArContent arContent)
    {
        return toAjax(arContentService.updateArContent(arContent));
    }

    /**
     * 删除AR内容
     */
    @PreAuthorize("@ss.hasPermi('ar:content:remove')")
    @Log(title = "AR内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{arContentIds}")
    public AjaxResult remove(@PathVariable Long[] arContentIds)
    {
        return toAjax(arContentService.deleteArContentByArContentIds(arContentIds));
    }
}
