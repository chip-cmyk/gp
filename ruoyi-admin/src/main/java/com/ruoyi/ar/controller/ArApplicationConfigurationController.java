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
import com.ruoyi.ar.domain.ArApplicationConfiguration;
import com.ruoyi.ar.service.IArApplicationConfigurationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 出厂配置Controller
 * 
 * @author lazy
 * @date 2025-02-12
 */
@RestController
@RequestMapping("/ar/configuration")
public class ArApplicationConfigurationController extends BaseController
{
    @Autowired
    private IArApplicationConfigurationService arApplicationConfigurationService;

    /**
     * 查询出厂配置列表
     */
    @PreAuthorize("@ss.hasPermi('ar:configuration:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArApplicationConfiguration arApplicationConfiguration)
    {
        startPage();
        List<ArApplicationConfiguration> list = arApplicationConfigurationService.selectArApplicationConfigurationList(arApplicationConfiguration);
        return getDataTable(list);
    }

    /**
     * 导出出厂配置列表
     */
    @PreAuthorize("@ss.hasPermi('ar:configuration:export')")
    @Log(title = "出厂配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArApplicationConfiguration arApplicationConfiguration)
    {
        List<ArApplicationConfiguration> list = arApplicationConfigurationService.selectArApplicationConfigurationList(arApplicationConfiguration);
        ExcelUtil<ArApplicationConfiguration> util = new ExcelUtil<ArApplicationConfiguration>(ArApplicationConfiguration.class);
        util.exportExcel(response, list, "出厂配置数据");
    }

    /**
     * 获取出厂配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:configuration:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(arApplicationConfigurationService.selectArApplicationConfigurationById(id));
    }

    /**
     * 新增出厂配置
     */
    @PreAuthorize("@ss.hasPermi('ar:configuration:add')")
    @Log(title = "出厂配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArApplicationConfiguration arApplicationConfiguration)
    {
        return toAjax(arApplicationConfigurationService.insertArApplicationConfiguration(arApplicationConfiguration));
    }

    /**
     * 修改出厂配置
     */
    @PreAuthorize("@ss.hasPermi('ar:configuration:edit')")
    @Log(title = "出厂配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArApplicationConfiguration arApplicationConfiguration)
    {
        return toAjax(arApplicationConfigurationService.updateArApplicationConfiguration(arApplicationConfiguration));
    }

    /**
     * 删除出厂配置
     */
    @PreAuthorize("@ss.hasPermi('ar:configuration:remove')")
    @Log(title = "出厂配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(arApplicationConfigurationService.deleteArApplicationConfigurationByIds(ids));
    }
}
