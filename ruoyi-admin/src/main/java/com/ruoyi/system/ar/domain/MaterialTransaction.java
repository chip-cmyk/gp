package com.ruoyi.system.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 材料出入库单对象 material_transaction
 * 
 * @author laazy
 * @date 2025-01-14
 */
public class MaterialTransaction extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 单号 */
    private Long transactionId;

    /** 出入库类型 */
    @Excel(name = "出入库类型")
    private Long transactionType;

    /** 经办人 */
    @Excel(name = "经办人")
    private String operatorName;

    /** 库区管理员 */
    @Excel(name = "库区管理员")
    private String warehouseAdminName;

    public void setTransactionId(Long transactionId) 
    {
        this.transactionId = transactionId;
    }

    public Long getTransactionId() 
    {
        return transactionId;
    }
    public void setTransactionType(Long transactionType) 
    {
        this.transactionType = transactionType;
    }

    public Long getTransactionType() 
    {
        return transactionType;
    }
    public void setOperatorName(String operatorName) 
    {
        this.operatorName = operatorName;
    }

    public String getOperatorName() 
    {
        return operatorName;
    }
    public void setWarehouseAdminName(String warehouseAdminName) 
    {
        this.warehouseAdminName = warehouseAdminName;
    }

    public String getWarehouseAdminName() 
    {
        return warehouseAdminName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("transactionId", getTransactionId())
            .append("transactionType", getTransactionType())
            .append("operatorName", getOperatorName())
            .append("warehouseAdminName", getWarehouseAdminName())
            .toString();
    }
}
