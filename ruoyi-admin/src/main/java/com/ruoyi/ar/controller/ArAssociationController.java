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
import com.ruoyi.ar.domain.ArAssociation;
import com.ruoyi.ar.service.IArAssociationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * AR内容关联Controller
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@RestController
@RequestMapping("/ar/arAssociation")
public class ArAssociationController extends BaseController
{
    @Autowired
    private IArAssociationService arAssociationService;

    /**
     * 查询AR内容关联列表
     */
    @PreAuthorize("@ss.hasPermi('ar:arAssociation:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArAssociation arAssociation)
    {
        startPage();
        List<ArAssociation> list = arAssociationService.selectArAssociationList(arAssociation);
        return getDataTable(list);
    }

    /**
     * 导出AR内容关联列表
     */
    @PreAuthorize("@ss.hasPermi('ar:arAssociation:export')")
    @Log(title = "AR内容关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArAssociation arAssociation)
    {
        List<ArAssociation> list = arAssociationService.selectArAssociationList(arAssociation);
        ExcelUtil<ArAssociation> util = new ExcelUtil<ArAssociation>(ArAssociation.class);
        util.exportExcel(response, list, "AR内容关联数据");
    }

    /**
     * 获取AR内容关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:arAssociation:query')")
    @GetMapping(value = "/{qrCodeId}")
    public AjaxResult getInfo(@PathVariable("qrCodeId") Long qrCodeId)
    {
        return success(arAssociationService.selectArAssociationByQrCodeId(qrCodeId));
    }

    /**
     * 新增AR内容关联
     */
    @PreAuthorize("@ss.hasPermi('ar:arAssociation:add')")
    @Log(title = "AR内容关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArAssociation arAssociation)
    {
        return toAjax(arAssociationService.insertArAssociation(arAssociation));
    }

    /**
     * 修改AR内容关联
     */
    @PreAuthorize("@ss.hasPermi('ar:arAssociation:edit')")
    @Log(title = "AR内容关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArAssociation arAssociation)
    {
        return toAjax(arAssociationService.updateArAssociation(arAssociation));
    }

    /**
     * 删除AR内容关联
     */
    @PreAuthorize("@ss.hasPermi('ar:arAssociation:remove')")
    @Log(title = "AR内容关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{qrCodeIds}")
    public AjaxResult remove(@PathVariable Long[] qrCodeIds)
    {
        return toAjax(arAssociationService.deleteArAssociationByQrCodeIds(qrCodeIds));
    }
}
