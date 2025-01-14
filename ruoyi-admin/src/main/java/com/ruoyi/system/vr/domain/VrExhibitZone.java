package com.ruoyi.system.vr.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR展区对象 vr_exhibit_zone
 * 
 * @author laazy
 * @date 2025-01-14
 */
public class VrExhibitZone extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 展区编号 */
    private Long exhibitZoneId;

    /** 展区名称 */
    @Excel(name = "展区名称")
    private String exhibitZoneName;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 展厅编号 */
    @Excel(name = "展厅编号")
    private Long showroomId;

    public void setExhibitZoneId(Long exhibitZoneId) 
    {
        this.exhibitZoneId = exhibitZoneId;
    }

    public Long getExhibitZoneId() 
    {
        return exhibitZoneId;
    }
    public void setExhibitZoneName(String exhibitZoneName) 
    {
        this.exhibitZoneName = exhibitZoneName;
    }

    public String getExhibitZoneName() 
    {
        return exhibitZoneName;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setShowroomId(Long showroomId) 
    {
        this.showroomId = showroomId;
    }

    public Long getShowroomId() 
    {
        return showroomId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("exhibitZoneId", getExhibitZoneId())
            .append("exhibitZoneName", getExhibitZoneName())
            .append("description", getDescription())
            .append("showroomId", getShowroomId())
            .toString();
    }
}
