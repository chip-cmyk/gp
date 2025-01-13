package com.ruoyi.system.ar.mapper;

import java.util.List;
import com.ruoyi.system.ar.domain.ArContent;

/**
 * AR内容Mapper接口
 * 
 * @author lazy
 * @date 2025-01-13
 */
public interface ArContentMapper 
{
    /**
     * 查询AR内容
     * 
     * @param contentId AR内容主键
     * @return AR内容
     */
    public ArContent selectArContentByContentId(Long contentId);

    /**
     * 查询AR内容列表
     * 
     * @param arContent AR内容
     * @return AR内容集合
     */
    public List<ArContent> selectArContentList(ArContent arContent);

    /**
     * 新增AR内容
     * 
     * @param arContent AR内容
     * @return 结果
     */
    public int insertArContent(ArContent arContent);

    /**
     * 修改AR内容
     * 
     * @param arContent AR内容
     * @return 结果
     */
    public int updateArContent(ArContent arContent);

    /**
     * 删除AR内容
     * 
     * @param contentId AR内容主键
     * @return 结果
     */
    public int deleteArContentByContentId(Long contentId);

    /**
     * 批量删除AR内容
     * 
     * @param contentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArContentByContentIds(Long[] contentIds);
}
