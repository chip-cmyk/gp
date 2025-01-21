package com.ruoyi.school.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR素材对象 vr_material
 * 
 * @author lazy
 * @date 2025-01-21
 */
public class VrMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long vrMaterialId;

    /**  */
    @Excel(name = "")
    private String name;

    /**  */
    @Excel(name = "")
    private String category;

    /**  */
    @Excel(name = "")
    private String fileUrl;

    /**  */
    @Excel(name = "")
    private String description;

    /**  */
    @Excel(name = "")
    private Long sceneId;

    public void setVrMaterialId(Long vrMaterialId) 
    {
        this.vrMaterialId = vrMaterialId;
    }

    public Long getVrMaterialId() 
    {
        return vrMaterialId;
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
    public void setSceneId(Long sceneId) 
    {
        this.sceneId = sceneId;
    }

    public Long getSceneId() 
    {
        return sceneId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("vrMaterialId", getVrMaterialId())
            .append("name", getName())
            .append("category", getCategory())
            .append("fileUrl", getFileUrl())
            .append("description", getDescription())
            .append("sceneId", getSceneId())
            .toString();
    }
}
