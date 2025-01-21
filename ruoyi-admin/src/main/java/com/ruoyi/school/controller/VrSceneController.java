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
import com.ruoyi.school.domain.VrScene;
import com.ruoyi.school.service.IVrSceneService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR场景Controller
 * 
 * @author lazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/school/scene")
public class VrSceneController extends BaseController
{
    @Autowired
    private IVrSceneService vrSceneService;

    /**
     * 查询VR场景列表
     */
    @PreAuthorize("@ss.hasPermi('school:scene:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrScene vrScene)
    {
        startPage();
        List<VrScene> list = vrSceneService.selectVrSceneList(vrScene);
        return getDataTable(list);
    }

    /**
     * 导出VR场景列表
     */
    @PreAuthorize("@ss.hasPermi('school:scene:export')")
    @Log(title = "VR场景", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrScene vrScene)
    {
        List<VrScene> list = vrSceneService.selectVrSceneList(vrScene);
        ExcelUtil<VrScene> util = new ExcelUtil<VrScene>(VrScene.class);
        util.exportExcel(response, list, "VR场景数据");
    }

    /**
     * 获取VR场景详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:scene:query')")
    @GetMapping(value = "/{sceneId}")
    public AjaxResult getInfo(@PathVariable("sceneId") Long sceneId)
    {
        return success(vrSceneService.selectVrSceneBySceneId(sceneId));
    }

    /**
     * 新增VR场景
     */
    @PreAuthorize("@ss.hasPermi('school:scene:add')")
    @Log(title = "VR场景", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrScene vrScene)
    {
        return toAjax(vrSceneService.insertVrScene(vrScene));
    }

    /**
     * 修改VR场景
     */
    @PreAuthorize("@ss.hasPermi('school:scene:edit')")
    @Log(title = "VR场景", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrScene vrScene)
    {
        return toAjax(vrSceneService.updateVrScene(vrScene));
    }

    /**
     * 删除VR场景
     */
    @PreAuthorize("@ss.hasPermi('school:scene:remove')")
    @Log(title = "VR场景", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sceneIds}")
    public AjaxResult remove(@PathVariable Long[] sceneIds)
    {
        return toAjax(vrSceneService.deleteVrSceneBySceneIds(sceneIds));
    }
}
