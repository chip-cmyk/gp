package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.DeviceMapper;
import com.ruoyi.ar.domain.Device;
import com.ruoyi.ar.service.IDeviceService;

/**
 * 设备Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-20
 */
@Service
public class DeviceServiceImpl implements IDeviceService 
{
    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 查询设备
     * 
     * @param deviceNumber 设备主键
     * @return 设备
     */
    @Override
    public Device selectDeviceByDeviceNumber(Long deviceNumber)
    {
        return deviceMapper.selectDeviceByDeviceNumber(deviceNumber);
    }

    /**
     * 查询设备列表
     * 
     * @param device 设备
     * @return 设备
     */
    @Override
    public List<Device> selectDeviceList(Device device)
    {
        return deviceMapper.selectDeviceList(device);
    }

    /**
     * 新增设备
     * 
     * @param device 设备
     * @return 结果
     */
    @Override
    public int insertDevice(Device device)
    {
        return deviceMapper.insertDevice(device);
    }

    /**
     * 修改设备
     * 
     * @param device 设备
     * @return 结果
     */
    @Override
    public int updateDevice(Device device)
    {
        return deviceMapper.updateDevice(device);
    }

    /**
     * 批量删除设备
     * 
     * @param deviceNumbers 需要删除的设备主键
     * @return 结果
     */
    @Override
    public int deleteDeviceByDeviceNumbers(Long[] deviceNumbers)
    {
        return deviceMapper.deleteDeviceByDeviceNumbers(deviceNumbers);
    }

    /**
     * 删除设备信息
     * 
     * @param deviceNumber 设备主键
     * @return 结果
     */
    @Override
    public int deleteDeviceByDeviceNumber(Long deviceNumber)
    {
        return deviceMapper.deleteDeviceByDeviceNumber(deviceNumber);
    }
}
