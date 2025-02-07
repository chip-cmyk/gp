package com.ruoyi.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 材料清单明细对象 material_transaction_detail
 * 
 * @author laazy
 * @date 2025-02-06
 */
public class MaterialTransactionDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 材料编号 */
    @Excel(name = "材料编号")
    private Long materialId;

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

    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
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
            .append("materialId", getMaterialId())
            .append("transactionId", getTransactionId())
            .append("quantity", getQuantity())
            .append("transactionDate", getTransactionDate())
            .toString();
    }
}
