package com.ruoyi.school.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * VR场景对象 vr_scene
 * 
 * @author lazy
 * @date 2025-01-20
 */
public class VrScene extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 场景编号 */
    private Long sceneId;

    /** 场景名称 */
    @Excel(name = "场景名称")
    private String sceneName;

    /** 文件URL */
    @Excel(name = "文件URL")
    private String fileUrl;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 案例编号 */
    @Excel(name = "案例编号")
    private Long caseId;

    public void setSceneId(Long sceneId) 
    {
        this.sceneId = sceneId;
    }

    public Long getSceneId() 
    {
        return sceneId;
    }
    public void setSceneName(String sceneName) 
    {
        this.sceneName = sceneName;
    }

    public String getSceneName() 
    {
        return sceneName;
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
    public void setCaseId(Long caseId) 
    {
        this.caseId = caseId;
    }

    public Long getCaseId() 
    {
        return caseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sceneId", getSceneId())
            .append("sceneName", getSceneName())
            .append("fileUrl", getFileUrl())
            .append("description", getDescription())
            .append("caseId", getCaseId())
            .toString();
    }
}
