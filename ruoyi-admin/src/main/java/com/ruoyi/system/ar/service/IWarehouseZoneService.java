package com.ruoyi.system.ar.service;

import java.util.List;
import com.ruoyi.system.ar.domain.WarehouseZone;

/**
 * 库区Service接口
 * 
 * @author laazy
 * @date 2025-01-14
 */
public interface IWarehouseZoneService 
{
    /**
     * 查询库区
     * 
     * @param zoneId 库区主键
     * @return 库区
     */
    public WarehouseZone selectWarehouseZoneByZoneId(Long zoneId);

    /**
     * 查询库区列表
     * 
     * @param warehouseZone 库区
     * @return 库区集合
     */
    public List<WarehouseZone> selectWarehouseZoneList(WarehouseZone warehouseZone);

    /**
     * 新增库区
     * 
     * @param warehouseZone 库区
     * @return 结果
     */
    public int insertWarehouseZone(WarehouseZone warehouseZone);

    /**
     * 修改库区
     * 
     * @param warehouseZone 库区
     * @return 结果
     */
    public int updateWarehouseZone(WarehouseZone warehouseZone);

    /**
     * 批量删除库区
     * 
     * @param zoneIds 需要删除的库区主键集合
     * @return 结果
     */
    public int deleteWarehouseZoneByZoneIds(Long[] zoneIds);

    /**
     * 删除库区信息
     * 
     * @param zoneId 库区主键
     * @return 结果
     */
    public int deleteWarehouseZoneByZoneId(Long zoneId);
}
