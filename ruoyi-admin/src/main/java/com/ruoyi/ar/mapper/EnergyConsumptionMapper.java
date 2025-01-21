package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.EnergyConsumption;

/**
 * 能耗清单Mapper接口
 * 
 * @author lazy
 * @date 2025-01-20
 */
public interface EnergyConsumptionMapper 
{
    /**
     * 查询能耗清单
     * 
     * @param energyId 能耗清单主键
     * @return 能耗清单
     */
    public EnergyConsumption selectEnergyConsumptionByEnergyId(Long energyId);

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
     * 删除能耗清单
     * 
     * @param energyId 能耗清单主键
     * @return 结果
     */
    public int deleteEnergyConsumptionByEnergyId(Long energyId);

    /**
     * 批量删除能耗清单
     * 
     * @param energyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEnergyConsumptionByEnergyIds(Long[] energyIds);
}
