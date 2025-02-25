package com.ruoyi.school.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 校企应用对象 school_applications
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
public class SchoolApplications extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 应用ID */
    private Long appId;

    /** 名称 */
    @Excel(name = "名称")
    private String appName;

    /** 功能简介 */
    @Excel(name = "功能简介")
    private String description;

    /** 版本号 */
    @Excel(name = "版本号")
    private String version;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date releaseDate;

    public void setAppId(Long appId) 
    {
        this.appId = appId;
    }

    public Long getAppId() 
    {
        return appId;
    }
    public void setAppName(String appName) 
    {
        this.appName = appName;
    }

    public String getAppName() 
    {
        return appName;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setVersion(String version) 
    {
        this.version = version;
    }

    public String getVersion() 
    {
        return version;
    }
    public void setReleaseDate(Date releaseDate) 
    {
        this.releaseDate = releaseDate;
    }

    public Date getReleaseDate() 
    {
        return releaseDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("appId", getAppId())
            .append("appName", getAppName())
            .append("description", getDescription())
            .append("version", getVersion())
            .append("releaseDate", getReleaseDate())
            .toString();
    }
}
