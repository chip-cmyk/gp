package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.EnergyConsumptionMapper;
import com.ruoyi.ar.domain.EnergyConsumption;
import com.ruoyi.ar.service.IEnergyConsumptionService;

/**
 * 能耗清单Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-20
 */
@Service
public class EnergyConsumptionServiceImpl implements IEnergyConsumptionService 
{
    @Autowired
    private EnergyConsumptionMapper energyConsumptionMapper;

    /**
     * 查询能耗清单
     * 
     * @param energyId 能耗清单主键
     * @return 能耗清单
     */
    @Override
    public EnergyConsumption selectEnergyConsumptionByEnergyId(Long energyId)
    {
        return energyConsumptionMapper.selectEnergyConsumptionByEnergyId(energyId);
    }

    /**
     * 查询能耗清单列表
     * 
     * @param energyConsumption 能耗清单
     * @return 能耗清单
     */
    @Override
    public List<EnergyConsumption> selectEnergyConsumptionList(EnergyConsumption energyConsumption)
    {
        return energyConsumptionMapper.selectEnergyConsumptionList(energyConsumption);
    }

    /**
     * 新增能耗清单
     * 
     * @param energyConsumption 能耗清单
     * @return 结果
     */
    @Override
    public int insertEnergyConsumption(EnergyConsumption energyConsumption)
    {
        return energyConsumptionMapper.insertEnergyConsumption(energyConsumption);
    }

    /**
     * 修改能耗清单
     * 
     * @param energyConsumption 能耗清单
     * @return 结果
     */
    @Override
    public int updateEnergyConsumption(EnergyConsumption energyConsumption)
    {
        return energyConsumptionMapper.updateEnergyConsumption(energyConsumption);
    }

    /**
     * 批量删除能耗清单
     * 
     * @param energyIds 需要删除的能耗清单主键
     * @return 结果
     */
    @Override
    public int deleteEnergyConsumptionByEnergyIds(Long[] energyIds)
    {
        return energyConsumptionMapper.deleteEnergyConsumptionByEnergyIds(energyIds);
    }

    /**
     * 删除能耗清单信息
     * 
     * @param energyId 能耗清单主键
     * @return 结果
     */
    @Override
    public int deleteEnergyConsumptionByEnergyId(Long energyId)
    {
        return energyConsumptionMapper.deleteEnergyConsumptionByEnergyId(energyId);
    }
}
