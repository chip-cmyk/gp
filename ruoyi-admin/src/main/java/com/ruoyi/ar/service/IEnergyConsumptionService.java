package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.EnergyConsumption;

/**
 * 能耗清单Service接口
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public interface IEnergyConsumptionService 
{
    /**
     * 查询能耗清单
     * 
     * @param id 能耗清单主键
     * @return 能耗清单
     */
    public EnergyConsumption selectEnergyConsumptionById(Long id);

    /**
     * 查询能耗清单列表
     * 
     * @param energyConsumption 能耗清单
     * @return 能耗清单集合
     */
    public List<EnergyConsumption> selectEnergyConsumptionList(EnergyConsumption energyConsumption);

    /**
     * 新增能耗清单
     * 
     * @param energyConsumption 能耗清单
     * @return 结果
     */
    public int insertEnergyConsumption(EnergyConsumption energyConsumption);

    /**
     * 修改能耗清单
     * 
     * @param energyConsumption 能耗清单
     * @return 结果
     */
    public int updateEnergyConsumption(EnergyConsumption energyConsumption);

    /**
     * 批量删除能耗清单
     * 
     * @param ids 需要删除的能耗清单主键集合
     * @return 结果
     */
    public int deleteEnergyConsumptionByIds(Long[] ids);

    /**
     * 删除能耗清单信息
     * 
     * @param id 能耗清单主键
     * @return 结果
     */
    public int deleteEnergyConsumptionById(Long id);
}
