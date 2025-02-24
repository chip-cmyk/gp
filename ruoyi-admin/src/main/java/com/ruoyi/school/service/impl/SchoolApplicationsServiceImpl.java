package com.ruoyi.school.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.SchoolApplicationsMapper;
import com.ruoyi.school.domain.SchoolApplications;
import com.ruoyi.school.service.ISchoolApplicationsService;

/**
 * 校企应用Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
@Service
public class SchoolApplicationsServiceImpl implements ISchoolApplicationsService 
{
    @Autowired
    private SchoolApplicationsMapper schoolApplicationsMapper;

    /**
     * 查询校企应用
     * 
     * @param appId 校企应用主键
     * @return 校企应用
     */
    @Override
    public SchoolApplications selectSchoolApplicationsByAppId(Long appId)
    {
        return schoolApplicationsMapper.selectSchoolApplicationsByAppId(appId);
    }

    /**
     * 查询校企应用列表
     * 
     * @param schoolApplications 校企应用
     * @return 校企应用
     */
    @Override
    public List<SchoolApplications> selectSchoolApplicationsList(SchoolApplications schoolApplications)
    {
        return schoolApplicationsMapper.selectSchoolApplicationsList(schoolApplications);
    }

    /**
     * 新增校企应用
     * 
     * @param schoolApplications 校企应用
     * @return 结果
     */
    @Override
    public int insertSchoolApplications(SchoolApplications schoolApplications)
    {
        return schoolApplicationsMapper.insertSchoolApplications(schoolApplications);
    }

    /**
     * 修改校企应用
     * 
     * @param schoolApplications 校企应用
     * @return 结果
     */
    @Override
    public int updateSchoolApplications(SchoolApplications schoolApplications)
    {
        return schoolApplicationsMapper.updateSchoolApplications(schoolApplications);
    }

    /**
     * 批量删除校企应用
     * 
     * @param appIds 需要删除的校企应用主键
     * @return 结果
     */
    @Override
    public int deleteSchoolApplicationsByAppIds(Long[] appIds)
    {
        return schoolApplicationsMapper.deleteSchoolApplicationsByAppIds(appIds);
    }

    /**
     * 删除校企应用信息
     * 
     * @param appId 校企应用主键
     * @return 结果
     */
    @Override
    public int deleteSchoolApplicationsByAppId(Long appId)
    {
        return schoolApplicationsMapper.deleteSchoolApplicationsByAppId(appId);
    }
}
