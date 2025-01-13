package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.VrCarrier;

/**
 * 载体Service接口
 * 
 * @author lazy
 * @date 2025-01-13
 */
public interface IVrCarrierService 
{
    /**
     * 查询载体
     * 
     * @param carrierId 载体主键
     * @return 载体
     */
    public VrCarrier selectVrCarrierByCarrierId(Long carrierId);

    /**
     * 查询载体列表
     * 
     * @param vrCarrier 载体
     * @return 载体集合
     */
    public List<VrCarrier> selectVrCarrierList(VrCarrier vrCarrier);

    /**
     * 新增载体
     * 
     * @param vrCarrier 载体
     * @return 结果
     */
    public int insertVrCarrier(VrCarrier vrCarrier);

    /**
     * 修改载体
     * 
     * @param vrCarrier 载体
     * @return 结果
     */
    public int updateVrCarrier(VrCarrier vrCarrier);

    /**
     * 批量删除载体
     * 
     * @param carrierIds 需要删除的载体主键集合
     * @return 结果
     */
    public int deleteVrCarrierByCarrierIds(Long[] carrierIds);

    /**
     * 删除载体信息
     * 
     * @param carrierId 载体主键
     * @return 结果
     */
    public int deleteVrCarrierByCarrierId(Long carrierId);
}
