package com.ruoyi.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 二维码对象 qr_code
 * 
 * @author lazy
 * @date 2025-01-20
 */
public class QrCode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 二维码编号 */
    private Long qrCodeId;

    /** 二维码内容 */
    @Excel(name = "二维码内容")
    private String qrCode;

    /** 使用情况 */
    @Excel(name = "使用情况")
    private String usageStatus;

    public void setQrCodeId(Long qrCodeId) 
    {
        this.qrCodeId = qrCodeId;
    }

    public Long getQrCodeId() 
    {
        return qrCodeId;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("qrCodeId", getQrCodeId())
            .append("qrCode", getQrCode())
            .append("usageStatus", getUsageStatus())
            .toString();
    }
}
