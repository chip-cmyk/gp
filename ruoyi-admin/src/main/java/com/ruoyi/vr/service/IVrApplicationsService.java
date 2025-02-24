package com.ruoyi.vr.service;

import java.util.List;
import com.ruoyi.vr.domain.VrApplications;

/**
 * VR应用Service接口
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
public interface IVrApplicationsService 
{
    /**
     * 查询VR应用
     * 
     * @param appId VR应用主键
     * @return VR应用
     */
    public VrApplications selectVrApplicationsByAppId(Long appId);

    /**
     * 查询VR应用列表
     * 
     * @param vrApplications VR应用
     * @return VR应用集合
     */
    public List<VrApplications> selectVrApplicationsList(VrApplications vrApplications);

    /**
     * 新增VR应用
     * 
     * @param vrApplications VR应用
     * @return 结果
     */
    public int insertVrApplications(VrApplications vrApplications);

    /**
     * 修改VR应用
     * 
     * @param vrApplications VR应用
     * @return 结果
     */
    public int updateVrApplications(VrApplications vrApplications);

    /**
     * 批量删除VR应用
     * 
     * @param appIds 需要删除的VR应用主键集合
     * @return 结果
     */
    public int deleteVrApplicationsByAppIds(Long[] appIds);

    /**
     * 删除VR应用信息
     * 
     * @param appId VR应用主键
     * @return 结果
     */
    public int deleteVrApplicationsByAppId(Long appId);
}
