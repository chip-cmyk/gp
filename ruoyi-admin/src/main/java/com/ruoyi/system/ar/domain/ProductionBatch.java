package com.ruoyi.system.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 生产批次对象 production_batch
 * 
 * @author laazy
 * @date 2025-01-14
 */
public class ProductionBatch extends BaseEntity
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

    /** 产品编号 */
    @Excel(name = "产品编号")
    private Long productId;

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
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("batchId", getBatchId())
            .append("quantity", getQuantity())
            .append("unit", getUnit())
            .append("productionDate", getProductionDate())
            .append("productId", getProductId())
            .toString();
    }
}
