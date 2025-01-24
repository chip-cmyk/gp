package com.ruoyi.ar.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 能耗清单对象 energy_consumption
 * 
 * @author ruoyi
 * @date 2025-01-24
 */
public class EnergyConsumption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 能耗 */
    @Excel(name = "能耗")
    private BigDecimal energyConsumed;

    /** 计量单位 */
    @Excel(name = "计量单位")
    private String unit;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 年度 */
    @Excel(name = "年度")
    private Long year;

    /** 月份 */
    @Excel(name = "月份")
    private Long month;

    /** 工厂编号 */
    @Excel(name = "工厂编号")
    private String factoryId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setEnergyConsumed(BigDecimal energyConsumed) 
    {
        this.energyConsumed = energyConsumed;
    }

    public BigDecimal getEnergyConsumed() 
    {
        return energyConsumed;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
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
    public void setFactoryId(String factoryId) 
    {
        this.factoryId = factoryId;
    }

    public String getFactoryId() 
    {
        return factoryId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("energyConsumed", getEnergyConsumed())
            .append("unit", getUnit())
            .append("type", getType())
            .append("year", getYear())
            .append("month", getMonth())
            .append("factoryId", getFactoryId())
            .toString();
    }
}
