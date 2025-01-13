package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR内容对象 vr_content
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class VrContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** VR内容编号 */
    private Long contentId;

    /** 名称 */
    @Excel(name = "名称")
    private String contentName;

    /** 类别 */
    @Excel(name = "类别")
    private String category;

    /** 文件URL */
    @Excel(name = "文件URL")
    private String fileUrl;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 载体编号 */
    @Excel(name = "载体编号")
    private Long carrierId;

    /** 作品编号 */
    @Excel(name = "作品编号")
    private Long workId;

    public void setContentId(Long contentId) 
    {
        this.contentId = contentId;
    }

    public Long getContentId() 
    {
        return contentId;
    }
    public void setContentName(String contentName) 
    {
        this.contentName = contentName;
    }

    public String getContentName() 
    {
        return contentName;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("contentId", getContentId())
            .append("contentName", getContentName())
            .append("category", getCategory())
            .append("fileUrl", getFileUrl())
            .append("description", getDescription())
            .append("carrierId", getCarrierId())
            .append("workId", getWorkId())
            .toString();
    }
}
