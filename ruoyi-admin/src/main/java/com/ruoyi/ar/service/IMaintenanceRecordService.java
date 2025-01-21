package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.MaintenanceRecord;

/**
 * 运维记录Service接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface IMaintenanceRecordService 
{
    /**
     * 查询运维记录
     * 
     * @param recordId 运维记录主键
     * @return 运维记录
     */
    public MaintenanceRecord selectMaintenanceRecordByRecordId(Long recordId);

    /**
     * 查询运维记录列表
     * 
     * @param maintenanceRecord 运维记录
     * @return 运维记录集合
     */
    public List<MaintenanceRecord> selectMaintenanceRecordList(MaintenanceRecord maintenanceRecord);

    /**
     * 新增运维记录
     * 
     * @param maintenanceRecord 运维记录
     * @return 结果
     */
    public int insertMaintenanceRecord(MaintenanceRecord maintenanceRecord);

    /**
     * 修改运维记录
     * 
     * @param maintenanceRecord 运维记录
     * @return 结果
     */
    public int updateMaintenanceRecord(MaintenanceRecord maintenanceRecord);

    /**
     * 批量删除运维记录
     * 
     * @param recordIds 需要删除的运维记录主键集合
     * @return 结果
     */
    public int deleteMaintenanceRecordByRecordIds(Long[] recordIds);

    /**
     * 删除运维记录信息
     * 
     * @param recordId 运维记录主键
     * @return 结果
     */
    public int deleteMaintenanceRecordByRecordId(Long recordId);
}
