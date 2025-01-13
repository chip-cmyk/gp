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
import com.ruoyi.system.domain.EnergyConsumption;
import com.ruoyi.system.service.IEnergyConsumptionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 能耗清单Controller
 * 
 * @author lazy
 * @date 2025-01-13
 */
@RestController
@RequestMapping("/system/consumption")
public class EnergyConsumptionController extends BaseController
{
    @Autowired
    private IEnergyConsumptionService energyConsumptionService;

    /**
     * 查询能耗清单列表
     */
    @PreAuthorize("@ss.hasPermi('system:consumption:list')")
    @GetMapping("/list")
    public TableDataInfo list(EnergyConsumption energyConsumption)
    {
        startPage();
        List<EnergyConsumption> list = energyConsumptionService.selectEnergyConsumptionList(energyConsumption);
        return getDataTable(list);
    }

    /**
     * 导出能耗清单列表
     */
    @PreAuthorize("@ss.hasPermi('system:consumption:export')")
    @Log(title = "能耗清单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EnergyConsumption energyConsumption)
    {
        List<EnergyConsumption> list = energyConsumptionService.selectEnergyConsumptionList(energyConsumption);
        ExcelUtil<EnergyConsumption> util = new ExcelUtil<EnergyConsumption>(EnergyConsumption.class);
        util.exportExcel(response, list, "能耗清单数据");
    }

    /**
     * 获取能耗清单详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:consumption:query')")
    @GetMapping(value = "/{energyId}")
    public AjaxResult getInfo(@PathVariable("energyId") Long energyId)
    {
        return success(energyConsumptionService.selectEnergyConsumptionByEnergyId(energyId));
    }

    /**
     * 新增能耗清单
     */
    @PreAuthorize("@ss.hasPermi('system:consumption:add')")
    @Log(title = "能耗清单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EnergyConsumption energyConsumption)
    {
        return toAjax(energyConsumptionService.insertEnergyConsumption(energyConsumption));
    }

    /**
     * 修改能耗清单
     */
    @PreAuthorize("@ss.hasPermi('system:consumption:edit')")
    @Log(title = "能耗清单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EnergyConsumption energyConsumption)
    {
        return toAjax(energyConsumptionService.updateEnergyConsumption(energyConsumption));
    }

    /**
     * 删除能耗清单
     */
    @PreAuthorize("@ss.hasPermi('system:consumption:remove')")
    @Log(title = "能耗清单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{energyIds}")
    public AjaxResult remove(@PathVariable Long[] energyIds)
    {
        return toAjax(energyConsumptionService.deleteEnergyConsumptionByEnergyIds(energyIds));
    }
}
