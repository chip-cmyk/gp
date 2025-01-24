package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.FactoryMapper;
import com.ruoyi.ar.domain.Factory;
import com.ruoyi.ar.service.IFactoryService;

/**
 * 工厂Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-24
 */
@Service
public class FactoryServiceImpl implements IFactoryService 
{
    @Autowired
    private FactoryMapper factoryMapper;

    /**
     * 查询工厂
     * 
     * @param factoryId 工厂主键
     * @return 工厂
     */
    @Override
    public Factory selectFactoryByFactoryId(Long factoryId)
    {
        return factoryMapper.selectFactoryByFactoryId(factoryId);
    }

    /**
     * 查询工厂列表
     * 
     * @param factory 工厂
     * @return 工厂
     */
    @Override
    public List<Factory> selectFactoryList(Factory factory)
    {
        return factoryMapper.selectFactoryList(factory);
    }

    /**
     * 新增工厂
     * 
     * @param factory 工厂
     * @return 结果
     */
    @Override
    public int insertFactory(Factory factory)
    {
        return factoryMapper.insertFactory(factory);
    }

    /**
     * 修改工厂
     * 
     * @param factory 工厂
     * @return 结果
     */
    @Override
    public int updateFactory(Factory factory)
    {
        return factoryMapper.updateFactory(factory);
    }

    /**
     * 批量删除工厂
     * 
     * @param factoryIds 需要删除的工厂主键
     * @return 结果
     */
    @Override
    public int deleteFactoryByFactoryIds(Long[] factoryIds)
    {
        return factoryMapper.deleteFactoryByFactoryIds(factoryIds);
    }

    /**
     * 删除工厂信息
     * 
     * @param factoryId 工厂主键
     * @return 结果
     */
    @Override
    public int deleteFactoryByFactoryId(Long factoryId)
    {
        return factoryMapper.deleteFactoryByFactoryId(factoryId);
    }
}
