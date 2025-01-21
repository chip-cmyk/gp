package com.ruoyi.ar.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 能耗清单对象 energy_consumption
 * 
 * @author lazy
 * @date 2025-01-20
 */
public class EnergyConsumption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long energyId;

    /** 能耗 */
    @Excel(name = "能耗")
    private BigDecimal energyAmount;

    /** 计量单位 */
    @Excel(name = "计量单位")
    private String unit;

    /** 类型 */
    @Excel(name = "类型")
    private String energyType;

    /** 年度 */
    @Excel(name = "年度")
    private Long year;

    /** 月份 */
    @Excel(name = "月份")
    private Long month;

    /** 工厂编号 */
    @Excel(name = "工厂编号")
    private Long factoryId;

    public void setEnergyId(Long energyId) 
    {
        this.energyId = energyId;
    }

    public Long getEnergyId() 
    {
        return energyId;
    }
    public void setEnergyAmount(BigDecimal energyAmount) 
    {
        this.energyAmount = energyAmount;
    }

    public BigDecimal getEnergyAmount() 
    {
        return energyAmount;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setEnergyType(String energyType) 
    {
        this.energyType = energyType;
    }

    public String getEnergyType() 
    {
        return energyType;
    }
    public void setYear(Long year) 
    {
        this.year = year;
    }

    public Long getYear() 
    {
        return year;
    }
    public void setMonth(Long month) 
    {
        this.month = month;
    }

    public Long getMonth() 
    {
        return month;
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
            .append("energyId", getEnergyId())
            .append("energyAmount", getEnergyAmount())
            .append("unit", getUnit())
            .append("energyType", getEnergyType())
            .append("year", getYear())
            .append("month", getMonth())
            .append("factoryId", getFactoryId())
            .toString();
    }
}
