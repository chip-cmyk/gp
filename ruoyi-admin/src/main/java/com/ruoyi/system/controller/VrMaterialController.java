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
import com.ruoyi.system.domain.VrMaterial;
import com.ruoyi.system.service.IVrMaterialService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR素材Controller
 * 
 * @author lazy
 * @date 2025-01-13
 */
@RestController
@RequestMapping("/system/material")
public class VrMaterialController extends BaseController
{
    @Autowired
    private IVrMaterialService vrMaterialService;

    /**
     * 查询VR素材列表
     */
    @PreAuthorize("@ss.hasPermi('system:material:list')")
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
    @PreAuthorize("@ss.hasPermi('system:material:export')")
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
    @PreAuthorize("@ss.hasPermi('system:material:query')")
    @GetMapping(value = "/{materialId}")
    public AjaxResult getInfo(@PathVariable("materialId") Long materialId)
    {
        return success(vrMaterialService.selectVrMaterialByMaterialId(materialId));
    }

    /**
     * 新增VR素材
     */
    @PreAuthorize("@ss.hasPermi('system:material:add')")
    @Log(title = "VR素材", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrMaterial vrMaterial)
    {
        return toAjax(vrMaterialService.insertVrMaterial(vrMaterial));
    }

    /**
     * 修改VR素材
     */
    @PreAuthorize("@ss.hasPermi('system:material:edit')")
    @Log(title = "VR素材", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrMaterial vrMaterial)
    {
        return toAjax(vrMaterialService.updateVrMaterial(vrMaterial));
    }

    /**
     * 删除VR素材
     */
    @PreAuthorize("@ss.hasPermi('system:material:remove')")
    @Log(title = "VR素材", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public AjaxResult remove(@PathVariable Long[] materialIds)
    {
        return toAjax(vrMaterialService.deleteVrMaterialByMaterialIds(materialIds));
    }
}
