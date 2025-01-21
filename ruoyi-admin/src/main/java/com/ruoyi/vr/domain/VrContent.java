package com.ruoyi.vr.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR内容对象 vr_content
 * 
 * @author lazy
 * @date 2025-01-20
 */
public class VrContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** VR内容编号 */
    private Long vrContentId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 类别 */
    @Excel(name = "类别")
    private String category;

    /** 文件URL */
    @Excel(name = "文件URL")
    private String fileUrl;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 使用情况 */
    @Excel(name = "使用情况")
    private String usageStatus;

    /** 载体编号 */
    @Excel(name = "载体编号")
    private Long carrierId;

    /** 作品编号 */
    @Excel(name = "作品编号")
    private Long workId;

    /** 创建时间 */
    private Date createdAt;

    /** 更新时间 */
    private Date updatedAt;

    public void setVrContentId(Long vrContentId) 
    {
        this.vrContentId = vrContentId;
    }

    public Long getVrContentId() 
    {
        return vrContentId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setFileUrl(String fileUrl) 
    {
        this.fileUrl = fileUrl;
    }

    public String getFileUrl() 
    {
        return fileUrl;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setUsageStatus(String usageStatus) 
    {
        this.usageStatus = usageStatus;
    }

    public String getUsageStatus() 
    {
        return usageStatus;
    }
    public void setCarrierId(Long carrierId) 
    {
        this.carrierId = carrierId;
    }

    public Long getCarrierId() 
    {
        return carrierId;
    }
    public void setWorkId(Long workId) 
    {
        this.workId = workId;
    }

    public Long getWorkId() 
    {
        return workId;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }
    public void setUpdatedAt(Date updatedAt) 
    {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedAt() 
    {
        return updatedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("vrContentId", getVrContentId())
            .append("name", getName())
            .append("category", getCategory())
            .append("fileUrl", getFileUrl())
            .append("description", getDescription())
            .append("usageStatus", getUsageStatus())
            .append("carrierId", getCarrierId())
            .append("workId", getWorkId())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .toString();
    }
}
