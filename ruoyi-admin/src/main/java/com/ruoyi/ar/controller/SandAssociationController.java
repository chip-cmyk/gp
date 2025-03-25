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
import com.ruoyi.ar.domain.SandAssociation;
import com.ruoyi.ar.service.ISandAssociationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 二维码_沙盘分区关联Controller
 * 
 * @author lazy
 * @date 2025-03-25
 */
@RestController
@RequestMapping("/ar/sandAssociation")
public class SandAssociationController extends BaseController
{
    @Autowired
    private ISandAssociationService sandAssociationService;

    /**
     * 查询二维码_沙盘分区关联列表
     */
    @PreAuthorize("@ss.hasPermi('ar:sandAssociation:list')")
    @GetMapping("/list")
    public TableDataInfo list(SandAssociation sandAssociation)
    {
        startPage();
        List<SandAssociation> list = sandAssociationService.selectSandAssociationList(sandAssociation);
        return getDataTable(list);
    }

    /**
     * 导出二维码_沙盘分区关联列表
     */
    @PreAuthorize("@ss.hasPermi('ar:sandAssociation:export')")
    @Log(title = "二维码_沙盘分区关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SandAssociation sandAssociation)
    {
        List<SandAssociation> list = sandAssociationService.selectSandAssociationList(sandAssociation);
        ExcelUtil<SandAssociation> util = new ExcelUtil<SandAssociation>(SandAssociation.class);
        util.exportExcel(response, list, "二维码_沙盘分区关联数据");
    }

    /**
     * 获取二维码_沙盘分区关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:sandAssociation:query')")
    @GetMapping(value = "/{qrCodeId}")
    public AjaxResult getInfo(@PathVariable("qrCodeId") Long qrCodeId)
    {
        return success(sandAssociationService.selectSandAssociationByQrCodeId(qrCodeId));
    }

    /**
     * 新增二维码_沙盘分区关联
     */
    @PreAuthorize("@ss.hasPermi('ar:sandAssociation:add')")
    @Log(title = "二维码_沙盘分区关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SandAssociation sandAssociation)
    {
        return toAjax(sandAssociationService.insertSandAssociation(sandAssociation));
    }

    /**
     * 修改二维码_沙盘分区关联
     */
    @PreAuthorize("@ss.hasPermi('ar:sandAssociation:edit')")
    @Log(title = "二维码_沙盘分区关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SandAssociation sandAssociation)
    {
        return toAjax(sandAssociationService.updateSandAssociation(sandAssociation));
    }

    /**
     * 删除二维码_沙盘分区关联
     */
    @PreAuthorize("@ss.hasPermi('ar:sandAssociation:remove')")
    @Log(title = "二维码_沙盘分区关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{qrCodeIds}")
    public AjaxResult remove(@PathVariable Long[] qrCodeIds)
    {
        return toAjax(sandAssociationService.deleteSandAssociationByQrCodeIds(qrCodeIds));
    }
}
