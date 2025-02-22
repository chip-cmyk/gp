package com.ruoyi.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * AR应用对象 ar_applications
 * 
 * @author lazy
 * @date 2025-02-12
 */
public class ArApplications extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 应用ID */
    private Long ApplicationID;

    /** 名称 */
    @Excel(name = "名称")
    private String Name;

    /** 功能简介 */
    @Excel(name = "功能简介")
    private String Description;

    /** 版本号 */
    @Excel(name = "版本号")
    private String Version;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date ReleaseDate;

    public void setApplicationID(Long ApplicationID) 
    {
        this.ApplicationID = ApplicationID;
    }

    public Long getApplicationID() 
    {
        return ApplicationID;
    }
    public void setName(String Name) 
    {
        this.Name = Name;
    }

    public String getName() 
    {
        return Name;
    }
    public void setDescription(String Description) 
    {
        this.Description = Description;
    }

    public String getDescription() 
    {
        return Description;
    }
    public void setVersion(String Version) 
    {
        this.Version = Version;
    }

    public String getVersion() 
    {
        return Version;
    }
    public void setReleaseDate(Date ReleaseDate) 
    {
        this.ReleaseDate = ReleaseDate;
    }

    public Date getReleaseDate() 
    {
        return ReleaseDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ApplicationID", getApplicationID())
            .append("Name", getName())
            .append("Description", getDescription())
            .append("Version", getVersion())
            .append("ReleaseDate", getReleaseDate())
            .toString();
    }
}
