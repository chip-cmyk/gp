package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.WarehouseZone;

/**
 * 库区Mapper接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface WarehouseZoneMapper 
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
     * 删除库区
     * 
     * @param zoneId 库区主键
     * @return 结果
     */
    public int deleteWarehouseZoneByZoneId(Long zoneId);

    /**
     * 批量删除库区
     * 
     * @param zoneIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWarehouseZoneByZoneIds(Long[] zoneIds);
}
