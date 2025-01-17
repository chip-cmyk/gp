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
import com.ruoyi.system.domain.Work;
import com.ruoyi.system.service.IWorkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作品Controller
 * 
 * @author lazy
 * @date 2025-01-17
 */
@RestController
@RequestMapping("/system/work")
public class WorkController extends BaseController
{
    @Autowired
    private IWorkService workService;

    /**
     * 查询作品列表
     */
    @PreAuthorize("@ss.hasPermi('system:work:list')")
    @GetMapping("/list")
    public TableDataInfo list(Work work)
    {
        startPage();
        List<Work> list = workService.selectWorkList(work);
        return getDataTable(list);
    }

    /**
     * 导出作品列表
     */
    @PreAuthorize("@ss.hasPermi('system:work:export')")
    @Log(title = "作品", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Work work)
    {
        List<Work> list = workService.selectWorkList(work);
        ExcelUtil<Work> util = new ExcelUtil<Work>(Work.class);
        util.exportExcel(response, list, "作品数据");
    }

    /**
     * 获取作品详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:work:query')")
    @GetMapping(value = "/{workId}")
    public AjaxResult getInfo(@PathVariable("workId") Long workId)
    {
        return success(workService.selectWorkByWorkId(workId));
    }

    /**
     * 新增作品
     */
    @PreAuthorize("@ss.hasPermi('system:work:add')")
    @Log(title = "作品", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Work work)
    {
        return toAjax(workService.insertWork(work));
    }

    /**
     * 修改作品
     */
    @PreAuthorize("@ss.hasPermi('system:work:edit')")
    @Log(title = "作品", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Work work)
    {
        return toAjax(workService.updateWork(work));
    }

    /**
     * 删除作品
     */
    @PreAuthorize("@ss.hasPermi('system:work:remove')")
    @Log(title = "作品", businessType = BusinessType.DELETE)
	@DeleteMapping("/{workIds}")
    public AjaxResult remove(@PathVariable Long[] workIds)
    {
        return toAjax(workService.deleteWorkByWorkIds(workIds));
    }
}
