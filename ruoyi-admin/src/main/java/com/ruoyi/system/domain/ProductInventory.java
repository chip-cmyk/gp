package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品库存对象 product_inventory
 * 
 * @author lazy
 * @date 2025-02-10
 */
public class ProductInventory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 产品id */
    @Excel(name = "产品id")
    private Long productId;

    /** 产品库存量 */
    @Excel(name = "产品库存量")
    private Long stockAmount;

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setStockAmount(Long stockAmount) 
    {
        this.stockAmount = stockAmount;
    }

    public Long getStockAmount() 
    {
        return stockAmount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productId", getProductId())
            .append("stockAmount", getStockAmount())
            .toString();
    }
}
