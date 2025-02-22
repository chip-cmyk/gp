package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.ArApplicationConfigurationMapper;
import com.ruoyi.ar.domain.ArApplicationConfiguration;
import com.ruoyi.ar.service.IArApplicationConfigurationService;

/**
 * 出厂配置Service业务层处理
 * 
 * @author lazy
 * @date 2025-02-12
 */
@Service
public class ArApplicationConfigurationServiceImpl implements IArApplicationConfigurationService 
{
    @Autowired
    private ArApplicationConfigurationMapper arApplicationConfigurationMapper;

    /**
     * 查询出厂配置
     * 
     * @param id 出厂配置主键
     * @return 出厂配置
     */
    @Override
    public ArApplicationConfiguration selectArApplicationConfigurationById(Long id)
    {
        return arApplicationConfigurationMapper.selectArApplicationConfigurationById(id);
    }

    /**
     * 查询出厂配置列表
     * 
     * @param arApplicationConfiguration 出厂配置
     * @return 出厂配置
     */
    @Override
    public List<ArApplicationConfiguration> selectArApplicationConfigurationList(ArApplicationConfiguration arApplicationConfiguration)
    {
        return arApplicationConfigurationMapper.selectArApplicationConfigurationList(arApplicationConfiguration);
    }

    /**
     * 新增出厂配置
     * 
     * @param arApplicationConfiguration 出厂配置
     * @return 结果
     */
    @Override
    public int insertArApplicationConfiguration(ArApplicationConfiguration arApplicationConfiguration)
    {
        return arApplicationConfigurationMapper.insertArApplicationConfiguration(arApplicationConfiguration);
    }

    /**
     * 修改出厂配置
     * 
     * @param arApplicationConfiguration 出厂配置
     * @return 结果
     */
    @Override
    public int updateArApplicationConfiguration(ArApplicationConfiguration arApplicationConfiguration)
    {
        return arApplicationConfigurationMapper.updateArApplicationConfiguration(arApplicationConfiguration);
    }

    /**
     * 批量删除出厂配置
     * 
     * @param ids 需要删除的出厂配置主键
     * @return 结果
     */
    @Override
    public int deleteArApplicationConfigurationByIds(Long[] ids)
    {
        return arApplicationConfigurationMapper.deleteArApplicationConfigurationByIds(ids);
    }

    /**
     * 删除出厂配置信息
     * 
     * @param id 出厂配置主键
     * @return 结果
     */
    @Override
    public int deleteArApplicationConfigurationById(Long id)
    {
        return arApplicationConfigurationMapper.deleteArApplicationConfigurationById(id);
    }
}
