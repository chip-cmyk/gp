package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.VrCarrierMapper;
import com.ruoyi.system.domain.VrCarrier;
import com.ruoyi.system.service.IVrCarrierService;

/**
 * 载体Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-13
 */
@Service
public class VrCarrierServiceImpl implements IVrCarrierService 
{
    @Autowired
    private VrCarrierMapper vrCarrierMapper;

    /**
     * 查询载体
     * 
     * @param carrierId 载体主键
     * @return 载体
     */
    @Override
    public VrCarrier selectVrCarrierByCarrierId(Long carrierId)
    {
        return vrCarrierMapper.selectVrCarrierByCarrierId(carrierId);
    }

    /**
     * 查询载体列表
     * 
     * @param vrCarrier 载体
     * @return 载体
     */
    @Override
    public List<VrCarrier> selectVrCarrierList(VrCarrier vrCarrier)
    {
        return vrCarrierMapper.selectVrCarrierList(vrCarrier);
    }

    /**
     * 新增载体
     * 
     * @param vrCarrier 载体
     * @return 结果
     */
    @Override
    public int insertVrCarrier(VrCarrier vrCarrier)
    {
        return vrCarrierMapper.insertVrCarrier(vrCarrier);
    }

    /**
     * 修改载体
     * 
     * @param vrCarrier 载体
     * @return 结果
     */
    @Override
    public int updateVrCarrier(VrCarrier vrCarrier)
    {
        return vrCarrierMapper.updateVrCarrier(vrCarrier);
    }

    /**
     * 批量删除载体
     * 
     * @param carrierIds 需要删除的载体主键
     * @return 结果
     */
    @Override
    public int deleteVrCarrierByCarrierIds(Long[] carrierIds)
    {
        return vrCarrierMapper.deleteVrCarrierByCarrierIds(carrierIds);
    }

    /**
     * 删除载体信息
     * 
     * @param carrierId 载体主键
     * @return 结果
     */
    @Override
    public int deleteVrCarrierByCarrierId(Long carrierId)
    {
        return vrCarrierMapper.deleteVrCarrierByCarrierId(carrierId);
    }
}
