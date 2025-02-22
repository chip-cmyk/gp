package com.ruoyi.ar.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 出厂配置对象 ar_application_configuration
 * 
 * @author lazy
 * @date 2025-02-12
 */
public class ArApplicationConfiguration extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 触发方式 */
    @Excel(name = "触发方式")
    private String triggerMethod;

    /** 呈现方式 */
    @Excel(name = "呈现方式")
    private String displayMethod;

    /** 屏幕分辨率 */
    @Excel(name = "屏幕分辨率")
    private String screenResolution;

    /** 视频分辨率 */
    @Excel(name = "视频分辨率")
    private String videoResolution;

    /** 隐私设置 */
    @Excel(name = "隐私设置")
    private String privacySettings;

    /** 应用ID */
    @Excel(name = "应用ID")
    private Long appId;

    /** $column.columnComment */
    private Date createdAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTriggerMethod(String triggerMethod) 
    {
        this.triggerMethod = triggerMethod;
    }

    public String getTriggerMethod() 
    {
        return triggerMethod;
    }
    public void setDisplayMethod(String displayMethod) 
    {
        this.displayMethod = displayMethod;
    }

    public String getDisplayMethod() 
    {
        return displayMethod;
    }
    public void setScreenResolution(String screenResolution) 
    {
        this.screenResolution = screenResolution;
    }

    public String getScreenResolution() 
    {
        return screenResolution;
    }
    public void setVideoResolution(String videoResolution) 
    {
        this.videoResolution = videoResolution;
    }

    public String getVideoResolution() 
    {
        return videoResolution;
    }
    public void setPrivacySettings(String privacySettings) 
    {
        this.privacySettings = privacySettings;
    }

    public String getPrivacySettings() 
    {
        return privacySettings;
    }
    public void setAppId(Long appId) 
    {
        this.appId = appId;
    }

    public Long getAppId() 
    {
        return appId;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("triggerMethod", getTriggerMethod())
            .append("displayMethod", getDisplayMethod())
            .append("screenResolution", getScreenResolution())
            .append("videoResolution", getVideoResolution())
            .append("privacySettings", getPrivacySettings())
            .append("appId", getAppId())
            .append("createdAt", getCreatedAt())
            .toString();
    }
}
