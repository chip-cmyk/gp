package com.ruoyi.system.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * AR内容对象 ar_content
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class ArContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 内容编号 */
    private Long contentId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 类别 */
    @Excel(name = "类别")
    private String category;

    /** URL */
    @Excel(name = "URL")
    private String url;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 二维码编号 */
    @Excel(name = "二维码编号")
    private Long qrCodeId;

    public void setContentId(Long contentId) 
    {
        this.contentId = contentId;
    }

    public Long getContentId() 
    {
        return contentId;
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
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setQrCodeId(Long qrCodeId) 
    {
        this.qrCodeId = qrCodeId;
    }

    public Long getQrCodeId() 
    {
        return qrCodeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("contentId", getContentId())
            .append("name", getName())
            .append("category", getCategory())
            .append("url", getUrl())
            .append("description", getDescription())
            .append("qrCodeId", getQrCodeId())
            .toString();
    }
}
