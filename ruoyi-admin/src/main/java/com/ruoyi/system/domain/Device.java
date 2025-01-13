package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备对象 device
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class Device extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备编号 */
    private Long deviceNumber;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 设备状态 */
    @Excel(name = "设备状态")
    private String status;

    /** 二维码编号 */
    @Excel(name = "二维码编号")
    private String qrCodeNumber;

    /** 工厂编号 */
    @Excel(name = "工厂编号")
    private String factoryNumber;

    public void setDeviceNumber(Long deviceNumber) 
    {
        this.deviceNumber = deviceNumber;
    }

    public Long getDeviceNumber() 
    {
        return deviceNumber;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setQrCodeNumber(String qrCodeNumber) 
    {
        this.qrCodeNumber = qrCodeNumber;
    }

    public String getQrCodeNumber() 
    {
        return qrCodeNumber;
    }
    public void setFactoryNumber(String factoryNumber) 
    {
        this.factoryNumber = factoryNumber;
    }

    public String getFactoryNumber() 
    {
        return factoryNumber;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deviceNumber", getDeviceNumber())
            .append("name", getName())
            .append("description", getDescription())
            .append("status", getStatus())
            .append("qrCodeNumber", getQrCodeNumber())
            .append("factoryNumber", getFactoryNumber())
            .toString();
    }
}
