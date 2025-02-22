package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.ArApplicationConfiguration;

/**
 * 出厂配置Mapper接口
 * 
 * @author lazy
 * @date 2025-02-12
 */
public interface ArApplicationConfigurationMapper 
{
    /**
     * 查询出厂配置
     * 
     * @param id 出厂配置主键
     * @return 出厂配置
     */
    public ArApplicationConfiguration selectArApplicationConfigurationById(Long id);

    /**
     * 查询出厂配置列表
     * 
     * @param arApplicationConfiguration 出厂配置
     * @return 出厂配置集合
     */
    public List<ArApplicationConfiguration> selectArApplicationConfigurationList(ArApplicationConfiguration arApplicationConfiguration);

    /**
     * 新增出厂配置
     * 
     * @param arApplicationConfiguration 出厂配置
     * @return 结果
     */
    public int insertArApplicationConfiguration(ArApplicationConfiguration arApplicationConfiguration);

    /**
     * 修改出厂配置
     * 
     * @param arApplicationConfiguration 出厂配置
     * @return 结果
     */
    public int updateArApplicationConfiguration(ArApplicationConfiguration arApplicationConfiguration);

    /**
     * 删除出厂配置
     * 
     * @param id 出厂配置主键
     * @return 结果
     */
    public int deleteArApplicationConfigurationById(Long id);

    /**
     * 批量删除出厂配置
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArApplicationConfigurationByIds(Long[] ids);
}
