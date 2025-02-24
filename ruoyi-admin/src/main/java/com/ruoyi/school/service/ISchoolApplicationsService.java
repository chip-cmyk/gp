package com.ruoyi.school.service;

import java.util.List;
import com.ruoyi.school.domain.SchoolApplications;

/**
 * 校企应用Service接口
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
public interface ISchoolApplicationsService 
{
    /**
     * 查询校企应用
     * 
     * @param appId 校企应用主键
     * @return 校企应用
     */
    public SchoolApplications selectSchoolApplicationsByAppId(Long appId);

    /**
     * 查询校企应用列表
     * 
     * @param schoolApplications 校企应用
     * @return 校企应用集合
     */
    public List<SchoolApplications> selectSchoolApplicationsList(SchoolApplications schoolApplications);

    /**
     * 新增校企应用
     * 
     * @param schoolApplications 校企应用
     * @return 结果
     */
    public int insertSchoolApplications(SchoolApplications schoolApplications);

    /**
     * 修改校企应用
     * 
     * @param schoolApplications 校企应用
     * @return 结果
     */
    public int updateSchoolApplications(SchoolApplications schoolApplications);

    /**
     * 批量删除校企应用
     * 
     * @param appIds 需要删除的校企应用主键集合
     * @return 结果
     */
    public int deleteSchoolApplicationsByAppIds(Long[] appIds);

    /**
     * 删除校企应用信息
     * 
     * @param appId 校企应用主键
     * @return 结果
     */
    public int deleteSchoolApplicationsByAppId(Long appId);
}
