package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作品对象 work
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class Work extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 作品编号 */
    private Long workId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 作者列表 */
    @Excel(name = "作者列表")
    private String authors;

    /** 指导教师 */
    @Excel(name = "指导教师")
    private String instructor;

    /** 获奖情况 */
    @Excel(name = "获奖情况")
    private String awardInfo;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    public void setWorkId(Long workId) 
    {
        this.workId = workId;
    }

    public Long getWorkId() 
    {
        return workId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setAuthors(String authors) 
    {
        this.authors = authors;
    }

    public String getAuthors() 
    {
        return authors;
    }
    public void setInstructor(String instructor) 
    {
        this.instructor = instructor;
    }

    public String getInstructor() 
    {
        return instructor;
    }
    public void setAwardInfo(String awardInfo) 
    {
        this.awardInfo = awardInfo;
    }

    public String getAwardInfo() 
    {
        return awardInfo;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("workId", getWorkId())
            .append("title", getTitle())
            .append("authors", getAuthors())
            .append("instructor", getInstructor())
            .append("awardInfo", getAwardInfo())
            .append("description", getDescription())
            .toString();
    }
}
