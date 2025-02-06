package com.ruoyi.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品清单明细对象 product_transaction_detail
 * 
 * @author laazy
 * @date 2025-02-07
 */
public class ProductTransactionDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 产品编号 */
    @Excel(name = "产品编号")
    private Long productId;

    /** 单号 */
    @Excel(name = "单号")
    private Long transactionId;

    /** 数量 */
    @Excel(name = "数量")
    private Long quantity;

    /** 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date transactionDate;

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setTransactionId(Long transactionId) 
    {
        this.transactionId = transactionId;
    }

    public Long getTransactionId() 
    {
        return transactionId;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setTransactionDate(Date transactionDate) 
    {
        this.transactionDate = transactionDate;
    }

    public Date getTransactionDate() 
    {
        return transactionDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("productId", getProductId())
            .append("transactionId", getTransactionId())
            .append("quantity", getQuantity())
            .append("transactionDate", getTransactionDate())
            .toString();
    }
}
