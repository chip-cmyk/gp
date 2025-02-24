package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.SchoolApplications;

/**
 * 校企应用Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
public interface SchoolApplicationsMapper 
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
     * 删除校企应用
     * 
     * @param appId 校企应用主键
     * @return 结果
     */
    public int deleteSchoolApplicationsByAppId(Long appId);

    /**
     * 批量删除校企应用
     * 
     * @param appIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSchoolApplicationsByAppIds(Long[] appIds);
}
