package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.ArApplications;

/**
 * AR应用Service接口
 * 
 * @author lazy
 * @date 2025-02-12
 */
public interface IArApplicationsService 
{
    /**
     * 查询AR应用
     * 
     * @param ApplicationID AR应用主键
     * @return AR应用
     */
    public ArApplications selectArApplicationsByApplicationID(Long ApplicationID);

    /**
     * 查询AR应用列表
     * 
     * @param arApplications AR应用
     * @return AR应用集合
     */
    public List<ArApplications> selectArApplicationsList(ArApplications arApplications);

    /**
     * 新增AR应用
     * 
     * @param arApplications AR应用
     * @return 结果
     */
    public int insertArApplications(ArApplications arApplications);

    /**
     * 修改AR应用
     * 
     * @param arApplications AR应用
     * @return 结果
     */
    public int updateArApplications(ArApplications arApplications);

    /**
     * 批量删除AR应用
     * 
     * @param ApplicationIDs 需要删除的AR应用主键集合
     * @return 结果
     */
    public int deleteArApplicationsByApplicationIDs(Long[] ApplicationIDs);

    /**
     * 删除AR应用信息
     * 
     * @param ApplicationID AR应用主键
     * @return 结果
     */
    public int deleteArApplicationsByApplicationID(Long ApplicationID);
}
