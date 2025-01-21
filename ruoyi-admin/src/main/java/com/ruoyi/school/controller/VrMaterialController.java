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
import com.ruoyi.school.domain.VrMaterial;
import com.ruoyi.school.service.IVrMaterialService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR素材Controller
 * 
 * @author lazy
 * @date 2025-01-21
 */
@RestController
@RequestMapping("/school/material")
public class VrMaterialController extends BaseController
{
    @Autowired
    private IVrMaterialService vrMaterialService;

    /**
     * 查询VR素材列表
     */
    @PreAuthorize("@ss.hasPermi('school:material:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrMaterial vrMaterial)
    {
        startPage();
        List<VrMaterial> list = vrMaterialService.selectVrMaterialList(vrMaterial);
        return getDataTable(list);
    }

    /**
     * 导出VR素材列表
     */
    @PreAuthorize("@ss.hasPermi('school:material:export')")
    @Log(title = "VR素材", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrMaterial vrMaterial)
    {
        List<VrMaterial> list = vrMaterialService.selectVrMaterialList(vrMaterial);
        ExcelUtil<VrMaterial> util = new ExcelUtil<VrMaterial>(VrMaterial.class);
        util.exportExcel(response, list, "VR素材数据");
    }

    /**
     * 获取VR素材详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:material:query')")
    @GetMapping(value = "/{vrMaterialId}")
    public AjaxResult getInfo(@PathVariable("vrMaterialId") Long vrMaterialId)
    {
        return success(vrMaterialService.selectVrMaterialByVrMaterialId(vrMaterialId));
    }

    /**
     * 新增VR素材
     */
    @PreAuthorize("@ss.hasPermi('school:material:add')")
    @Log(title = "VR素材", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrMaterial vrMaterial)
    {
        return toAjax(vrMaterialService.insertVrMaterial(vrMaterial));
    }

    /**
     * 修改VR素材
     */
    @PreAuthorize("@ss.hasPermi('school:material:edit')")
    @Log(title = "VR素材", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrMaterial vrMaterial)
    {
        return toAjax(vrMaterialService.updateVrMaterial(vrMaterial));
    }

    /**
     * 删除VR素材
     */
    @PreAuthorize("@ss.hasPermi('school:material:remove')")
    @Log(title = "VR素材", businessType = BusinessType.DELETE)
	@DeleteMapping("/{vrMaterialIds}")
    public AjaxResult remove(@PathVariable Long[] vrMaterialIds)
    {
        return toAjax(vrMaterialService.deleteVrMaterialByVrMaterialIds(vrMaterialIds));
    }
}
