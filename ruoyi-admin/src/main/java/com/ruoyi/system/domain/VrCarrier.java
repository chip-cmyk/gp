package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 载体对象 vr_carrier
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class VrCarrier extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 载体编号 */
    private Long carrierId;

    /** 载体名称 */
    @Excel(name = "载体名称")
    private String carrierName;

    /** 载体类型 */
    @Excel(name = "载体类型")
    private Long carrierType;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 规格 */
    @Excel(name = "规格")
    private String specifications;

    /** 展区编号 */
    @Excel(name = "展区编号")
    private Long exhibitZoneId;

    public void setCarrierId(Long carrierId) 
    {
        this.carrierId = carrierId;
    }

    public Long getCarrierId() 
    {
        return carrierId;
    }
    public void setCarrierName(String carrierName) 
    {
        this.carrierName = carrierName;
    }

    public String getCarrierName() 
    {
        return carrierName;
    }
    public void setCarrierType(Long carrierType) 
    {
        this.carrierType = carrierType;
    }

    public Long getCarrierType() 
    {
        return carrierType;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setSpecifications(String specifications) 
    {
        this.specifications = specifications;
    }

    public String getSpecifications() 
    {
        return specifications;
    }
    public void setExhibitZoneId(Long exhibitZoneId) 
    {
        this.exhibitZoneId = exhibitZoneId;
    }

    public Long getExhibitZoneId() 
    {
        return exhibitZoneId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("carrierId", getCarrierId())
            .append("carrierName", getCarrierName())
            .append("carrierType", getCarrierType())
            .append("status", getStatus())
            .append("specifications", getSpecifications())
            .append("exhibitZoneId", getExhibitZoneId())
            .toString();
    }
}
