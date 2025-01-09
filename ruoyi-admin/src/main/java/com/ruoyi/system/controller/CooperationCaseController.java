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
import com.ruoyi.system.domain.CooperationCase;
import com.ruoyi.system.service.ICooperationCaseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 合作案例Controller
 * 
 * @author lazy
 * @date 2025-01-09
 */
@RestController
@RequestMapping("/system/case")
public class CooperationCaseController extends BaseController
{
    @Autowired
    private ICooperationCaseService cooperationCaseService;

    /**
     * 查询合作案例列表
     */
    @PreAuthorize("@ss.hasPermi('system:case:list')")
    @GetMapping("/list")
    public TableDataInfo list(CooperationCase cooperationCase)
    {
        startPage();
        List<CooperationCase> list = cooperationCaseService.selectCooperationCaseList(cooperationCase);
        return getDataTable(list);
    }

    /**
     * 导出合作案例列表
     */
    @PreAuthorize("@ss.hasPermi('system:case:export')")
    @Log(title = "合作案例", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CooperationCase cooperationCase)
    {
        List<CooperationCase> list = cooperationCaseService.selectCooperationCaseList(cooperationCase);
        ExcelUtil<CooperationCase> util = new ExcelUtil<CooperationCase>(CooperationCase.class);
        util.exportExcel(response, list, "合作案例数据");
    }

    /**
     * 获取合作案例详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:case:query')")
    @GetMapping(value = "/{caseId}")
    public AjaxResult getInfo(@PathVariable("caseId") Long caseId)
    {
        return success(cooperationCaseService.selectCooperationCaseByCaseId(caseId));
    }

    /**
     * 新增合作案例
     */
    @PreAuthorize("@ss.hasPermi('system:case:add')")
    @Log(title = "合作案例", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CooperationCase cooperationCase)
    {
        return toAjax(cooperationCaseService.insertCooperationCase(cooperationCase));
    }

    /**
     * 修改合作案例
     */
    @PreAuthorize("@ss.hasPermi('system:case:edit')")
    @Log(title = "合作案例", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CooperationCase cooperationCase)
    {
        return toAjax(cooperationCaseService.updateCooperationCase(cooperationCase));
    }

    /**
     * 删除合作案例
     */
    @PreAuthorize("@ss.hasPermi('system:case:remove')")
    @Log(title = "合作案例", businessType = BusinessType.DELETE)
	@DeleteMapping("/{caseIds}")
    public AjaxResult remove(@PathVariable Long[] caseIds)
    {
        return toAjax(cooperationCaseService.deleteCooperationCaseByCaseIds(caseIds));
    }
}
