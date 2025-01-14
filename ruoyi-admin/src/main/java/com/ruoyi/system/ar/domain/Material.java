package com.ruoyi.system.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 材料信息对象 material
 * 
 * @author laazy
 * @date 2025-01-14
 */
public class Material extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 材料编号 */
    private Long materialId;

    /** 材料名称 */
    @Excel(name = "材料名称")
    private String materialName;

    /** 材料型号 */
    @Excel(name = "材料型号")
    private String materialModel;

    /** 材料简介 */
    @Excel(name = "材料简介")
    private String materialDescription;

    /** 库存量 */
    @Excel(name = "库存量")
    private Long stockAmount;

    /** 库区编号 */
    @Excel(name = "库区编号")
    private Long warehouseZoneId;

    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }
    public void setMaterialName(String materialName) 
    {
        this.materialName = materialName;
    }

    public String getMaterialName() 
    {
        return materialName;
    }
    public void setMaterialModel(String materialModel) 
    {
        this.materialModel = materialModel;
    }

    public String getMaterialModel() 
    {
        return materialModel;
    }
    public void setMaterialDescription(String materialDescription) 
    {
        this.materialDescription = materialDescription;
    }

    public String getMaterialDescription() 
    {
        return materialDescription;
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
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("materialModel", getMaterialModel())
            .append("materialDescription", getMaterialDescription())
            .append("stockAmount", getStockAmount())
            .append("warehouseZoneId", getWarehouseZoneId())
            .toString();
    }
}
