package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR素材对象 vr_material
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class VrMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** VR素材编号 */
    private Long materialId;

    /** 名称 */
    @Excel(name = "名称")
    private String materialName;

    /** 类别 */
    @Excel(name = "类别")
    private String category;

    /** 文件URL */
    @Excel(name = "文件URL")
    private String fileUrl;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 场景编号 */
    @Excel(name = "场景编号")
    private Long sceneId;

    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }
    public void setMaterialName(String materialName) 
    {
        this.materialName = materialName;
    }

    public String getMaterialName() 
    {
        return materialName;
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
            .append("materialId", getMaterialId())
            .append("materialName", getMaterialName())
            .append("category", getCategory())
            .append("fileUrl", getFileUrl())
            .append("description", getDescription())
            .append("sceneId", getSceneId())
            .toString();
    }
}
