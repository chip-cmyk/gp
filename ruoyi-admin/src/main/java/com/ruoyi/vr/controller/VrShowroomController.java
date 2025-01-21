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
import com.ruoyi.vr.domain.VrShowroom;
import com.ruoyi.vr.service.IVrShowroomService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VR展厅Controller
 * 
 * @author laazy
 * @date 2025-01-20
 */
@RestController
@RequestMapping("/vr/showroom")
public class VrShowroomController extends BaseController
{
    @Autowired
    private IVrShowroomService vrShowroomService;

    /**
     * 查询VR展厅列表
     */
    @PreAuthorize("@ss.hasPermi('vr:showroom:list')")
    @GetMapping("/list")
    public TableDataInfo list(VrShowroom vrShowroom)
    {
        startPage();
        List<VrShowroom> list = vrShowroomService.selectVrShowroomList(vrShowroom);
        return getDataTable(list);
    }

    /**
     * 导出VR展厅列表
     */
    @PreAuthorize("@ss.hasPermi('vr:showroom:export')")
    @Log(title = "VR展厅", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VrShowroom vrShowroom)
    {
        List<VrShowroom> list = vrShowroomService.selectVrShowroomList(vrShowroom);
        ExcelUtil<VrShowroom> util = new ExcelUtil<VrShowroom>(VrShowroom.class);
        util.exportExcel(response, list, "VR展厅数据");
    }

    /**
     * 获取VR展厅详细信息
     */
    @PreAuthorize("@ss.hasPermi('vr:showroom:query')")
    @GetMapping(value = "/{showroomId}")
    public AjaxResult getInfo(@PathVariable("showroomId") Long showroomId)
    {
        return success(vrShowroomService.selectVrShowroomByShowroomId(showroomId));
    }

    /**
     * 新增VR展厅
     */
    @PreAuthorize("@ss.hasPermi('vr:showroom:add')")
    @Log(title = "VR展厅", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VrShowroom vrShowroom)
    {
        return toAjax(vrShowroomService.insertVrShowroom(vrShowroom));
    }

    /**
     * 修改VR展厅
     */
    @PreAuthorize("@ss.hasPermi('vr:showroom:edit')")
    @Log(title = "VR展厅", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VrShowroom vrShowroom)
    {
        return toAjax(vrShowroomService.updateVrShowroom(vrShowroom));
    }

    /**
     * 删除VR展厅
     */
    @PreAuthorize("@ss.hasPermi('vr:showroom:remove')")
    @Log(title = "VR展厅", businessType = BusinessType.DELETE)
	@DeleteMapping("/{showroomIds}")
    public AjaxResult remove(@PathVariable Long[] showroomIds)
    {
        return toAjax(vrShowroomService.deleteVrShowroomByShowroomIds(showroomIds));
    }
}
