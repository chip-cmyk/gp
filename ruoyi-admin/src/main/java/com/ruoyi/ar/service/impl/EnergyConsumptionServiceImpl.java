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
 * @author ruoyi
 * @date 2025-01-24
 */
@Service
public class EnergyConsumptionServiceImpl implements IEnergyConsumptionService 
{
    @Autowired
    private EnergyConsumptionMapper energyConsumptionMapper;

    /**
     * 查询能耗清单
     * 
     * @param id 能耗清单主键
     * @return 能耗清单
     */
    @Override
    public EnergyConsumption selectEnergyConsumptionById(Long id)
    {
        return energyConsumptionMapper.selectEnergyConsumptionById(id);
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
     * @param ids 需要删除的能耗清单主键
     * @return 结果
     */
    @Override
    public int deleteEnergyConsumptionByIds(Long[] ids)
    {
        return energyConsumptionMapper.deleteEnergyConsumptionByIds(ids);
    }

    /**
     * 删除能耗清单信息
     * 
     * @param id 能耗清单主键
     * @return 结果
     */
    @Override
    public int deleteEnergyConsumptionById(Long id)
    {
        return energyConsumptionMapper.deleteEnergyConsumptionById(id);
    }
}
