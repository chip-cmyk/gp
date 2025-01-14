package com.ruoyi.system.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.ar.mapper.MaintenanceRecordMapper;
import com.ruoyi.system.ar.domain.MaintenanceRecord;
import com.ruoyi.system.ar.service.IMaintenanceRecordService;

/**
 * 运维记录Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-14
 */
@Service
public class MaintenanceRecordServiceImpl implements IMaintenanceRecordService 
{
    @Autowired
    private MaintenanceRecordMapper maintenanceRecordMapper;

    /**
     * 查询运维记录
     * 
     * @param recordId 运维记录主键
     * @return 运维记录
     */
    @Override
    public MaintenanceRecord selectMaintenanceRecordByRecordId(Long recordId)
    {
        return maintenanceRecordMapper.selectMaintenanceRecordByRecordId(recordId);
    }

    /**
     * 查询运维记录列表
     * 
     * @param maintenanceRecord 运维记录
     * @return 运维记录
     */
    @Override
    public List<MaintenanceRecord> selectMaintenanceRecordList(MaintenanceRecord maintenanceRecord)
    {
        return maintenanceRecordMapper.selectMaintenanceRecordList(maintenanceRecord);
    }

    /**
     * 新增运维记录
     * 
     * @param maintenanceRecord 运维记录
     * @return 结果
     */
    @Override
    public int insertMaintenanceRecord(MaintenanceRecord maintenanceRecord)
    {
        return maintenanceRecordMapper.insertMaintenanceRecord(maintenanceRecord);
    }

    /**
     * 修改运维记录
     * 
     * @param maintenanceRecord 运维记录
     * @return 结果
     */
    @Override
    public int updateMaintenanceRecord(MaintenanceRecord maintenanceRecord)
    {
        return maintenanceRecordMapper.updateMaintenanceRecord(maintenanceRecord);
    }

    /**
     * 批量删除运维记录
     * 
     * @param recordIds 需要删除的运维记录主键
     * @return 结果
     */
    @Override
    public int deleteMaintenanceRecordByRecordIds(Long[] recordIds)
    {
        return maintenanceRecordMapper.deleteMaintenanceRecordByRecordIds(recordIds);
    }

    /**
     * 删除运维记录信息
     * 
     * @param recordId 运维记录主键
     * @return 结果
     */
    @Override
    public int deleteMaintenanceRecordByRecordId(Long recordId)
    {
        return maintenanceRecordMapper.deleteMaintenanceRecordByRecordId(recordId);
    }
}
