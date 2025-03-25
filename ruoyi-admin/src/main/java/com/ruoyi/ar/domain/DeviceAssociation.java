package com.ruoyi.ar.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备关联对象 device_association
 * 
 * @author lazy
 * @date 2025-03-25
 */
public class DeviceAssociation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 二维码编号 */
    private Long qrCodeId;

    /** 二维码名称 */
    @Excel(name = "二维码名称")
    private String qrCodeName;

    /** 二维码 */
    @Excel(name = "二维码")
    private String qrCode;

    /** 使用情况 */
    @Excel(name = "使用情况")
    private String usageStatus;

    /** 设备信息 */
    private List<Device> deviceList;

    public void setQrCodeId(Long qrCodeId) 
    {
        this.qrCodeId = qrCodeId;
    }

    public Long getQrCodeId() 
    {
        return qrCodeId;
    }
    public void setQrCodeName(String qrCodeName) 
    {
        this.qrCodeName = qrCodeName;
    }

    public String getQrCodeName() 
    {
        return qrCodeName;
    }
    public void setQrCode(String qrCode) 
    {
        this.qrCode = qrCode;
    }

    public String getQrCode() 
    {
        return qrCode;
    }
    public void setUsageStatus(String usageStatus) 
    {
        this.usageStatus = usageStatus;
    }

    public String getUsageStatus() 
    {
        return usageStatus;
    }

    public List<Device> getDeviceList()
    {
        return deviceList;
    }

    public void setDeviceList(List<Device> deviceList)
    {
        this.deviceList = deviceList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("qrCodeId", getQrCodeId())
            .append("qrCodeName", getQrCodeName())
            .append("qrCode", getQrCode())
            .append("usageStatus", getUsageStatus())
            .append("deviceList", getDeviceList())
            .toString();
    }
}
