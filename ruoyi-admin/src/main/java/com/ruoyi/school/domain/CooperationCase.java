package com.ruoyi.school.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 合作案例对象 cooperation_case
 * 
 * @author lazy
 * @date 2025-01-20
 */
public class CooperationCase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 案例编号 */
    private Long caseId;

    /** 案例名称 */
    @Excel(name = "案例名称")
    private String caseName;

    /** 合作单位 */
    @Excel(name = "合作单位")
    private String cooperationUnit;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    public void setCaseId(Long caseId) 
    {
        this.caseId = caseId;
    }

    public Long getCaseId() 
    {
        return caseId;
    }
    public void setCaseName(String caseName) 
    {
        this.caseName = caseName;
    }

    public String getCaseName() 
    {
        return caseName;
    }
    public void setCooperationUnit(String cooperationUnit) 
    {
        this.cooperationUnit = cooperationUnit;
    }

    public String getCooperationUnit() 
    {
        return cooperationUnit;
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
            .append("caseId", getCaseId())
            .append("caseName", getCaseName())
            .append("cooperationUnit", getCooperationUnit())
            .append("description", getDescription())
            .toString();
    }
}
