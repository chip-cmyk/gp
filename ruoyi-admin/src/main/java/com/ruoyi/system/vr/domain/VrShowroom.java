package com.ruoyi.system.vr.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR展厅对象 vr_showroom
 * 
 * @author laazy
 * @date 2025-01-14
 */
public class VrShowroom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 展厅编号 */
    private Long showroomId;

    /** 展厅编号 */
    @Excel(name = "展厅编号")
    private String showroomName;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    public void setShowroomId(Long showroomId) 
    {
        this.showroomId = showroomId;
    }

    public Long getShowroomId() 
    {
        return showroomId;
    }
    public void setShowroomName(String showroomName) 
    {
        this.showroomName = showroomName;
    }

    public String getShowroomName() 
    {
        return showroomName;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("showroomId", getShowroomId())
            .append("showroomName", getShowroomName())
            .append("description", getDescription())
            .toString();
    }
}
