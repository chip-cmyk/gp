package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.DeviceAssociation;
import com.ruoyi.ar.domain.Device;

/**
 * 设备关联Mapper接口
 * 
 * @author lazy
 * @date 2025-03-25
 */
public interface DeviceAssociationMapper 
{
    /**
     * 查询设备关联
     * 
     * @param qrCodeId 设备关联主键
     * @return 设备关联
     */
    public DeviceAssociation selectDeviceAssociationByQrCodeId(Long qrCodeId);

    /**
     * 查询设备关联列表
     * 
     * @param deviceAssociation 设备关联
     * @return 设备关联集合
     */
    public List<DeviceAssociation> selectDeviceAssociationList(DeviceAssociation deviceAssociation);

    /**
     * 新增设备关联
     * 
     * @param deviceAssociation 设备关联
     * @return 结果
     */
    public int insertDeviceAssociation(DeviceAssociation deviceAssociation);

    /**
     * 修改设备关联
     * 
     * @param deviceAssociation 设备关联
     * @return 结果
     */
    public int updateDeviceAssociation(DeviceAssociation deviceAssociation);

    /**
     * 删除设备关联
     * 
     * @param qrCodeId 设备关联主键
     * @return 结果
     */
    public int deleteDeviceAssociationByQrCodeId(Long qrCodeId);

    /**
     * 批量删除设备关联
     * 
     * @param qrCodeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDeviceAssociationByQrCodeIds(Long[] qrCodeIds);

    /**
     * 批量删除设备
     * 
     * @param qrCodeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDeviceByQrCodeNumbers(Long[] qrCodeIds);
    
    /**
     * 批量新增设备
     * 
     * @param deviceList 设备列表
     * @return 结果
     */
    public int batchDevice(List<Device> deviceList);
    

    /**
     * 通过设备关联主键删除设备信息
     * 
     * @param qrCodeId 设备关联ID
     * @return 结果
     */
    public int deleteDeviceByQrCodeNumber(Long qrCodeId);
}
