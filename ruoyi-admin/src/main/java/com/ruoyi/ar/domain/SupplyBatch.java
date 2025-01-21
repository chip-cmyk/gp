package com.ruoyi.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 供应批次对象 supply_batch
 * 
 * @author laazy
 * @date 2025-01-20
 */
public class SupplyBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 批号 */
    private Long batchId;

    /** 数量 */
    @Excel(name = "数量")
    private Long quantity;

    /** 计量单位 */
    @Excel(name = "计量单位")
    private String unit;

    /** 生产日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生产日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date productionDate;

    /** 保质期 */
    @Excel(name = "保质期")
    private Long shelfLife;

    /** 生产厂家 */
    @Excel(name = "生产厂家")
    private String manufacturer;

    /** 材料编号 */
    @Excel(name = "材料编号")
    private Long materialId;

    public void setBatchId(Long batchId) 
    {
        this.batchId = batchId;
    }

    public Long getBatchId() 
    {
        return batchId;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setProductionDate(Date productionDate) 
    {
        this.productionDate = productionDate;
    }

    public Date getProductionDate() 
    {
        return productionDate;
    }
    public void setShelfLife(Long shelfLife) 
    {
        this.shelfLife = shelfLife;
    }

    public Long getShelfLife() 
    {
        return shelfLife;
    }
    public void setManufacturer(String manufacturer) 
    {
        this.manufacturer = manufacturer;
    }

    public String getManufacturer() 
    {
        return manufacturer;
    }
    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("batchId", getBatchId())
            .append("quantity", getQuantity())
            .append("unit", getUnit())
            .append("productionDate", getProductionDate())
            .append("shelfLife", getShelfLife())
            .append("manufacturer", getManufacturer())
            .append("materialId", getMaterialId())
            .toString();
    }
}
