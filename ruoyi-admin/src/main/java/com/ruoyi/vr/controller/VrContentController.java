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
import com.ruoyi.vr.domain.VrContent;
import com.ruoyi.vr.service.IVrContentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR内容Controller
 * 
 * @author lazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/vr/content")
public class VrContentController extends BaseController
{
    @Autowired
    private IVrContentService vrContentService;

    /**
     * 查询VR内容列表
     */
    @PreAuthorize("@ss.hasPermi('vr:content:list')")
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
    @PreAuthorize("@ss.hasPermi('vr:content:export')")
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
    @PreAuthorize("@ss.hasPermi('vr:content:query')")
    @GetMapping(value = "/{vrContentId}")
    public AjaxResult getInfo(@PathVariable("vrContentId") Long vrContentId)
    {
        return success(vrContentService.selectVrContentByVrContentId(vrContentId));
    }

    /**
     * 新增VR内容
     */
    @PreAuthorize("@ss.hasPermi('vr:content:add')")
    @Log(title = "VR内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrContent vrContent)
    {
        return toAjax(vrContentService.insertVrContent(vrContent));
    }

    /**
     * 修改VR内容
     */
    @PreAuthorize("@ss.hasPermi('vr:content:edit')")
    @Log(title = "VR内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrContent vrContent)
    {
        return toAjax(vrContentService.updateVrContent(vrContent));
    }

    /**
     * 删除VR内容
     */

    /**
     * 检查VR内容是否在使用中
     * @param vrContentIds VR内容ID数组
     * @return 是否在使用中
     */
    private boolean isVrContentInUse(Long[] vrContentIds) {
        for (Long vrContentId : vrContentIds) {
            VrContent vrContent = vrContentService.selectVrContentByVrContentId(vrContentId);
            //System.out.println("1".equals(vrContent.getUsageStatus()));
            if (vrContent != null && "1".equals(vrContent.getUsageStatus())) {
                //"1"是已使用，如果有任何VR内容在使用中，返回true
                //为null或未使用都能删除
                return true;
            }
        }
        return false; // 如果所有VR内容都不在使用中，返回false
    }

    @PreAuthorize("@ss.hasPermi('vr:content:remove')")
    @Log(title = "VR内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{vrContentIds}")
    public AjaxResult remove(@PathVariable Long[] vrContentIds)
    {
        // 检查VR内容是否在使用中
        if (isVrContentInUse(vrContentIds)) {
            return AjaxResult.error("存在正在使用的VR内容，无法删除");
        }
        return toAjax(vrContentService.deleteVrContentByVrContentIds(vrContentIds));
    }
}
