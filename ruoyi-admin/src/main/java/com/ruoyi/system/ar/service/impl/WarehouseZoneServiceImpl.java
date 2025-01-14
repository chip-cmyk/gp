package com.ruoyi.system.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.ar.mapper.WarehouseZoneMapper;
import com.ruoyi.system.ar.domain.WarehouseZone;
import com.ruoyi.system.ar.service.IWarehouseZoneService;

/**
 * 库区Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-14
 */
@Service
public class WarehouseZoneServiceImpl implements IWarehouseZoneService 
{
    @Autowired
    private WarehouseZoneMapper warehouseZoneMapper;

    /**
     * 查询库区
     * 
     * @param zoneId 库区主键
     * @return 库区
     */
    @Override
    public WarehouseZone selectWarehouseZoneByZoneId(Long zoneId)
    {
        return warehouseZoneMapper.selectWarehouseZoneByZoneId(zoneId);
    }

    /**
     * 查询库区列表
     * 
     * @param warehouseZone 库区
     * @return 库区
     */
    @Override
    public List<WarehouseZone> selectWarehouseZoneList(WarehouseZone warehouseZone)
    {
        return warehouseZoneMapper.selectWarehouseZoneList(warehouseZone);
    }

    /**
     * 新增库区
     * 
     * @param warehouseZone 库区
     * @return 结果
     */
    @Override
    public int insertWarehouseZone(WarehouseZone warehouseZone)
    {
        return warehouseZoneMapper.insertWarehouseZone(warehouseZone);
    }

    /**
     * 修改库区
     * 
     * @param warehouseZone 库区
     * @return 结果
     */
    @Override
    public int updateWarehouseZone(WarehouseZone warehouseZone)
    {
        return warehouseZoneMapper.updateWarehouseZone(warehouseZone);
    }

    /**
     * 批量删除库区
     * 
     * @param zoneIds 需要删除的库区主键
     * @return 结果
     */
    @Override
    public int deleteWarehouseZoneByZoneIds(Long[] zoneIds)
    {
        return warehouseZoneMapper.deleteWarehouseZoneByZoneIds(zoneIds);
    }

    /**
     * 删除库区信息
     * 
     * @param zoneId 库区主键
     * @return 结果
     */
    @Override
    public int deleteWarehouseZoneByZoneId(Long zoneId)
    {
        return warehouseZoneMapper.deleteWarehouseZoneByZoneId(zoneId);
    }
}
