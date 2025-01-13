package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 二维码对象 qr_code
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class QrCode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 二维码编号 */
    private Long qrCodeId;

    /** 二维码 */
    @Excel(name = "二维码")
    private String qrCodeImageUrl;

    public void setQrCodeId(Long qrCodeId) 
    {
        this.qrCodeId = qrCodeId;
    }

    public Long getQrCodeId() 
    {
        return qrCodeId;
    }
    public void setQrCodeImageUrl(String qrCodeImageUrl) 
    {
        this.qrCodeImageUrl = qrCodeImageUrl;
    }

    public String getQrCodeImageUrl() 
    {
        return qrCodeImageUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("qrCodeId", getQrCodeId())
            .append("qrCodeImageUrl", getQrCodeImageUrl())
            .toString();
    }
}
