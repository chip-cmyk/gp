package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Factory;

/**
 * 工厂Service接口
 * 
 * @author lazy
 * @date 2025-01-13
 */
public interface IFactoryService 
{
    /**
     * 查询工厂
     * 
     * @param factoryId 工厂主键
     * @return 工厂
     */
    public Factory selectFactoryByFactoryId(Long factoryId);

    /**
     * 查询工厂列表
     * 
     * @param factory 工厂
     * @return 工厂集合
     */
    public List<Factory> selectFactoryList(Factory factory);

    /**
     * 新增工厂
     * 
     * @param factory 工厂
     * @return 结果
     */
    public int insertFactory(Factory factory);

    /**
     * 修改工厂
     * 
     * @param factory 工厂
     * @return 结果
     */
    public int updateFactory(Factory factory);

    /**
     * 批量删除工厂
     * 
     * @param factoryIds 需要删除的工厂主键集合
     * @return 结果
     */
    public int deleteFactoryByFactoryIds(Long[] factoryIds);

    /**
     * 删除工厂信息
     * 
     * @param factoryId 工厂主键
     * @return 结果
     */
    public int deleteFactoryByFactoryId(Long factoryId);
}
