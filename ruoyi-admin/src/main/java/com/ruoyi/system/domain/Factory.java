package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工厂对象 factory
 * 
 * @author lazy
 * @date 2025-01-13
 */
public class Factory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工厂编号 */
    private Long factoryId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactPerson;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    public void setFactoryId(Long factoryId) 
    {
        this.factoryId = factoryId;
    }

    public Long getFactoryId() 
    {
        return factoryId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setContactPerson(String contactPerson) 
    {
        this.contactPerson = contactPerson;
    }

    public String getContactPerson() 
    {
        return contactPerson;
    }
    public void setContactPhone(String contactPhone) 
    {
        this.contactPhone = contactPhone;
    }

    public String getContactPhone() 
    {
        return contactPhone;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("factoryId", getFactoryId())
            .append("name", getName())
            .append("description", getDescription())
            .append("contactPerson", getContactPerson())
            .append("contactPhone", getContactPhone())
            .append("address", getAddress())
            .toString();
    }
}
