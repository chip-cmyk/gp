package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.ArApplicationsMapper;
import com.ruoyi.ar.domain.ArApplications;
import com.ruoyi.ar.service.IArApplicationsService;

/**
 * AR应用Service业务层处理
 * 
 * @author lazy
 * @date 2025-02-12
 */
@Service
public class ArApplicationsServiceImpl implements IArApplicationsService 
{
    @Autowired
    private ArApplicationsMapper arApplicationsMapper;

    /**
     * 查询AR应用
     * 
     * @param ApplicationID AR应用主键
     * @return AR应用
     */
    @Override
    public ArApplications selectArApplicationsByApplicationID(Long ApplicationID)
    {
        return arApplicationsMapper.selectArApplicationsByApplicationID(ApplicationID);
    }

    /**
     * 查询AR应用列表
     * 
     * @param arApplications AR应用
     * @return AR应用
     */
    @Override
    public List<ArApplications> selectArApplicationsList(ArApplications arApplications)
    {
        return arApplicationsMapper.selectArApplicationsList(arApplications);
    }

    /**
     * 新增AR应用
     * 
     * @param arApplications AR应用
     * @return 结果
     */
    @Override
    public int insertArApplications(ArApplications arApplications)
    {
        return arApplicationsMapper.insertArApplications(arApplications);
    }

    /**
     * 修改AR应用
     * 
     * @param arApplications AR应用
     * @return 结果
     */
    @Override
    public int updateArApplications(ArApplications arApplications)
    {
        return arApplicationsMapper.updateArApplications(arApplications);
    }

    /**
     * 批量删除AR应用
     * 
     * @param ApplicationIDs 需要删除的AR应用主键
     * @return 结果
     */
    @Override
    public int deleteArApplicationsByApplicationIDs(Long[] ApplicationIDs)
    {
        return arApplicationsMapper.deleteArApplicationsByApplicationIDs(ApplicationIDs);
    }

    /**
     * 删除AR应用信息
     * 
     * @param ApplicationID AR应用主键
     * @return 结果
     */
    @Override
    public int deleteArApplicationsByApplicationID(Long ApplicationID)
    {
        return arApplicationsMapper.deleteArApplicationsByApplicationID(ApplicationID);
    }
}
