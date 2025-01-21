package com.ruoyi.ar.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * AR内容对象 ar_content
 * 
 * @author lazy
 * @date 2025-01-20
 */
public class ArContent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** AR内容编号 */
    private Long arContentId;

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

    /** 二维码编号 */
    @Excel(name = "二维码编号")
    private Long qrCodeId;

    public void setArContentId(Long arContentId) 
    {
        this.arContentId = arContentId;
    }

    public Long getArContentId() 
    {
        return arContentId;
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
            .append("arContentId", getArContentId())
            .append("name", getName())
            .append("category", getCategory())
            .append("fileUrl", getFileUrl())
            .append("description", getDescription())
            .append("usageStatus", getUsageStatus())
            .append("qrCodeId", getQrCodeId())
            .toString();
    }
}
