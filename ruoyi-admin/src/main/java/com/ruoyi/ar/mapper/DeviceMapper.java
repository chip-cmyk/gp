package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.Device;

/**
 * 设备Mapper接口
 * 
 * @author lazy
 * @date 2025-01-20
 */
public interface DeviceMapper 
{
    /**
     * 查询设备
     * 
     * @param deviceNumber 设备主键
     * @return 设备
     */
    public Device selectDeviceByDeviceNumber(Long deviceNumber);

    /**
     * 查询设备列表
     * 
     * @param device 设备
     * @return 设备集合
     */
    public List<Device> selectDeviceList(Device device);

    /**
     * 新增设备
     * 
     * @param device 设备
     * @return 结果
     */
    public int insertDevice(Device device);

    /**
     * 修改设备
     * 
     * @param device 设备
     * @return 结果
     */
    public int updateDevice(Device device);

    /**
     * 删除设备
     * 
     * @param deviceNumber 设备主键
     * @return 结果
     */
    public int deleteDeviceByDeviceNumber(Long deviceNumber);

    /**
     * 批量删除设备
     * 
     * @param deviceNumbers 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDeviceByDeviceNumbers(Long[] deviceNumbers);
}
