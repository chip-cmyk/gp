package com.ruoyi.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品信息对象 product
 * 
 * @author laazy
 * @date 2025-01-20
 */
public class Product extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 产品编号 */
    private Long productId;

    /** 产品名称 */
    @Excel(name = "产品名称")
    private String productName;

    /** 产品型号 */
    @Excel(name = "产品型号")
    private String productModel;

    /** 产品简介 */
    @Excel(name = "产品简介")
    private String productDescription;

    /** 库存量 */
    @Excel(name = "库存量")
    private Long stockAmount;

    /** 库区编号 */
    @Excel(name = "库区编号")
    private Long warehouseZoneId;

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setProductName(String productName) 
    {
        this.productName = productName;
    }

    public String getProductName() 
    {
        return productName;
    }
    public void setProductModel(String productModel) 
    {
        this.productModel = productModel;
    }

    public String getProductModel() 
    {
        return productModel;
    }
    public void setProductDescription(String productDescription) 
    {
        this.productDescription = productDescription;
    }

    public String getProductDescription() 
    {
        return productDescription;
    }
    public void setStockAmount(Long stockAmount) 
    {
        this.stockAmount = stockAmount;
    }

    public Long getStockAmount() 
    {
        return stockAmount;
    }
    public void setWarehouseZoneId(Long warehouseZoneId) 
    {
        this.warehouseZoneId = warehouseZoneId;
    }

    public Long getWarehouseZoneId() 
    {
        return warehouseZoneId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productId", getProductId())
            .append("productName", getProductName())
            .append("productModel", getProductModel())
            .append("productDescription", getProductDescription())
            .append("stockAmount", getStockAmount())
            .append("warehouseZoneId", getWarehouseZoneId())
            .toString();
    }
}
