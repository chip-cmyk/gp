package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.DeviceAssociation;

/**
 * 设备关联Service接口
 * 
 * @author lazy
 * @date 2025-03-25
 */
public interface IDeviceAssociationService 
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
     * 批量删除设备关联
     * 
     * @param qrCodeIds 需要删除的设备关联主键集合
     * @return 结果
     */
    public int deleteDeviceAssociationByQrCodeIds(Long[] qrCodeIds);

    /**
     * 删除设备关联信息
     * 
     * @param qrCodeId 设备关联主键
     * @return 结果
     */
    public int deleteDeviceAssociationByQrCodeId(Long qrCodeId);
}
