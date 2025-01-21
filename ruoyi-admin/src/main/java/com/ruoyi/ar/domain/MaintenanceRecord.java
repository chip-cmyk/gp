package com.ruoyi.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 运维记录对象 maintenance_record
 * 
 * @author laazy
 * @date 2025-01-20
 */
public class MaintenanceRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 运维记录编号 */
    private Long recordId;

    /** 运维日记 */
    @Excel(name = "运维日记")
    private String maintenanceLog;

    /** 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date date;

    /** 维护负责人 */
    @Excel(name = "维护负责人")
    private String maintainerName;

    /** 设备编号 */
    @Excel(name = "设备编号")
    private Long equipmentId;

    public void setRecordId(Long recordId) 
    {
        this.recordId = recordId;
    }

    public Long getRecordId() 
    {
        return recordId;
    }
    public void setMaintenanceLog(String maintenanceLog) 
    {
        this.maintenanceLog = maintenanceLog;
    }

    public String getMaintenanceLog() 
    {
        return maintenanceLog;
    }
    public void setDate(Date date) 
    {
        this.date = date;
    }

    public Date getDate() 
    {
        return date;
    }
    public void setMaintainerName(String maintainerName) 
    {
        this.maintainerName = maintainerName;
    }

    public String getMaintainerName() 
    {
        return maintainerName;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("maintenanceLog", getMaintenanceLog())
            .append("date", getDate())
            .append("maintainerName", getMaintainerName())
            .append("equipmentId", getEquipmentId())
            .toString();
    }
}
