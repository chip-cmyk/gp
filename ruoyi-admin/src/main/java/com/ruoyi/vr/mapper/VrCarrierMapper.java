package com.ruoyi.vr.mapper;

import java.util.List;
import com.ruoyi.vr.domain.VrCarrier;

/**
 * 载体Mapper接口
 * 
 * @author lazy
 * @date 2025-01-20
 */
public interface VrCarrierMapper 
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
     * 删除载体
     * 
     * @param carrierId 载体主键
     * @return 结果
     */
    public int deleteVrCarrierByCarrierId(Long carrierId);

    /**
     * 批量删除载体
     * 
     * @param carrierIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVrCarrierByCarrierIds(Long[] carrierIds);
}
