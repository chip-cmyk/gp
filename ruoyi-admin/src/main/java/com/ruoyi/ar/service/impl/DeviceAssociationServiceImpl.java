package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.ar.domain.Device;
import com.ruoyi.ar.mapper.DeviceAssociationMapper;
import com.ruoyi.ar.domain.DeviceAssociation;
import com.ruoyi.ar.service.IDeviceAssociationService;

/**
 * 设备关联Service业务层处理
 * 
 * @author lazy
 * @date 2025-03-25
 */
@Service
public class DeviceAssociationServiceImpl implements IDeviceAssociationService 
{
    @Autowired
    private DeviceAssociationMapper deviceAssociationMapper;

    /**
     * 查询设备关联
     * 
     * @param qrCodeId 设备关联主键
     * @return 设备关联
     */
    @Override
    public DeviceAssociation selectDeviceAssociationByQrCodeId(Long qrCodeId)
    {
        return deviceAssociationMapper.selectDeviceAssociationByQrCodeId(qrCodeId);
    }

    /**
     * 查询设备关联列表
     * 
     * @param deviceAssociation 设备关联
     * @return 设备关联
     */
    @Override
    public List<DeviceAssociation> selectDeviceAssociationList(DeviceAssociation deviceAssociation)
    {
        return deviceAssociationMapper.selectDeviceAssociationList(deviceAssociation);
    }

    /**
     * 新增设备关联
     * 
     * @param deviceAssociation 设备关联
     * @return 结果
     */
    @Transactional
    @Override
    public int insertDeviceAssociation(DeviceAssociation deviceAssociation)
    {
        int rows = deviceAssociationMapper.insertDeviceAssociation(deviceAssociation);
        insertDevice(deviceAssociation);
        return rows;
    }

    /**
     * 修改设备关联
     * 
     * @param deviceAssociation 设备关联
     * @return 结果
     */
    @Transactional
    @Override
    public int updateDeviceAssociation(DeviceAssociation deviceAssociation)
    {
        deviceAssociationMapper.deleteDeviceByQrCodeNumber(deviceAssociation.getQrCodeId());
        insertDevice(deviceAssociation);
        return deviceAssociationMapper.updateDeviceAssociation(deviceAssociation);
    }

    /**
     * 批量删除设备关联
     * 
     * @param qrCodeIds 需要删除的设备关联主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteDeviceAssociationByQrCodeIds(Long[] qrCodeIds)
    {
        deviceAssociationMapper.deleteDeviceByQrCodeNumbers(qrCodeIds);
        return deviceAssociationMapper.deleteDeviceAssociationByQrCodeIds(qrCodeIds);
    }

    /**
     * 删除设备关联信息
     * 
     * @param qrCodeId 设备关联主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteDeviceAssociationByQrCodeId(Long qrCodeId)
    {
        deviceAssociationMapper.deleteDeviceByQrCodeNumber(qrCodeId);
        return deviceAssociationMapper.deleteDeviceAssociationByQrCodeId(qrCodeId);
    }

    /**
     * 新增设备信息
     * 
     * @param deviceAssociation 设备关联对象
     */
    public void insertDevice(DeviceAssociation deviceAssociation)
    {
        List<Device> deviceList = deviceAssociation.getDeviceList();
        Long qrCodeId = deviceAssociation.getQrCodeId();
        if (StringUtils.isNotNull(deviceList))
        {
            List<Device> list = new ArrayList<Device>();
            for (Device device : deviceList)
            {
                device.setQrCodeNumber(qrCodeId);
                list.add(device);
            }
            if (list.size() > 0)
            {
                deviceAssociationMapper.batchDevice(list);
            }
        }
    }
}
