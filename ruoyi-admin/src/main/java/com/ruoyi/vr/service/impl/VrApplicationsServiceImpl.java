package com.ruoyi.vr.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.vr.mapper.VrApplicationsMapper;
import com.ruoyi.vr.domain.VrApplications;
import com.ruoyi.vr.service.IVrApplicationsService;

/**
 * VR应用Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
@Service
public class VrApplicationsServiceImpl implements IVrApplicationsService 
{
    @Autowired
    private VrApplicationsMapper vrApplicationsMapper;

    /**
     * 查询VR应用
     * 
     * @param appId VR应用主键
     * @return VR应用
     */
    @Override
    public VrApplications selectVrApplicationsByAppId(Long appId)
    {
        return vrApplicationsMapper.selectVrApplicationsByAppId(appId);
    }

    /**
     * 查询VR应用列表
     * 
     * @param vrApplications VR应用
     * @return VR应用
     */
    @Override
    public List<VrApplications> selectVrApplicationsList(VrApplications vrApplications)
    {
        return vrApplicationsMapper.selectVrApplicationsList(vrApplications);
    }

    /**
     * 新增VR应用
     * 
     * @param vrApplications VR应用
     * @return 结果
     */
    @Override
    public int insertVrApplications(VrApplications vrApplications)
    {
        return vrApplicationsMapper.insertVrApplications(vrApplications);
    }

    /**
     * 修改VR应用
     * 
     * @param vrApplications VR应用
     * @return 结果
     */
    @Override
    public int updateVrApplications(VrApplications vrApplications)
    {
        return vrApplicationsMapper.updateVrApplications(vrApplications);
    }

    /**
     * 批量删除VR应用
     * 
     * @param appIds 需要删除的VR应用主键
     * @return 结果
     */
    @Override
    public int deleteVrApplicationsByAppIds(Long[] appIds)
    {
        return vrApplicationsMapper.deleteVrApplicationsByAppIds(appIds);
    }

    /**
     * 删除VR应用信息
     * 
     * @param appId VR应用主键
     * @return 结果
     */
    @Override
    public int deleteVrApplicationsByAppId(Long appId)
    {
        return vrApplicationsMapper.deleteVrApplicationsByAppId(appId);
    }
}
