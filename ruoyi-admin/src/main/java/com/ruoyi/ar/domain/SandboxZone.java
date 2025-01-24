package com.ruoyi.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 沙盘分区对象 sandbox_zone
 * 
 * @author lazy
 * @date 2025-01-24
 */
public class SandboxZone extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 分区编号 */
    private Long zoneId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 二维码编号 */
    @Excel(name = "二维码编号")
    private Long qrCodeId;

    /** 工厂编号 */
    @Excel(name = "工厂编号")
    private Long factoryId;

    public void setZoneId(Long zoneId) 
    {
        this.zoneId = zoneId;
    }

    public Long getZoneId() 
    {
        return zoneId;
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
    public void setQrCodeId(Long qrCodeId) 
    {
        this.qrCodeId = qrCodeId;
    }

    public Long getQrCodeId() 
    {
        return qrCodeId;
    }
    public void setFactoryId(Long factoryId) 
    {
        this.factoryId = factoryId;
    }

    public Long getFactoryId() 
    {
        return factoryId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("zoneId", getZoneId())
            .append("name", getName())
            .append("description", getDescription())
            .append("qrCodeId", getQrCodeId())
            .append("factoryId", getFactoryId())
            .toString();
    }
}
