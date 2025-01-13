package com.ruoyi.system.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.ar.mapper.ArContentMapper;
import com.ruoyi.system.ar.domain.ArContent;
import com.ruoyi.system.ar.service.IArContentService;

/**
 * AR内容Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-13
 */
@Service
public class ArContentServiceImpl implements IArContentService 
{
    @Autowired
    private ArContentMapper arContentMapper;

    /**
     * 查询AR内容
     * 
     * @param contentId AR内容主键
     * @return AR内容
     */
    @Override
    public ArContent selectArContentByContentId(Long contentId)
    {
        return arContentMapper.selectArContentByContentId(contentId);
    }

    /**
     * 查询AR内容列表
     * 
     * @param arContent AR内容
     * @return AR内容
     */
    @Override
    public List<ArContent> selectArContentList(ArContent arContent)
    {
        return arContentMapper.selectArContentList(arContent);
    }

    /**
     * 新增AR内容
     * 
     * @param arContent AR内容
     * @return 结果
     */
    @Override
    public int insertArContent(ArContent arContent)
    {
        return arContentMapper.insertArContent(arContent);
    }

    /**
     * 修改AR内容
     * 
     * @param arContent AR内容
     * @return 结果
     */
    @Override
    public int updateArContent(ArContent arContent)
    {
        return arContentMapper.updateArContent(arContent);
    }

    /**
     * 批量删除AR内容
     * 
     * @param contentIds 需要删除的AR内容主键
     * @return 结果
     */
    @Override
    public int deleteArContentByContentIds(Long[] contentIds)
    {
        return arContentMapper.deleteArContentByContentIds(contentIds);
    }

    /**
     * 删除AR内容信息
     * 
     * @param contentId AR内容主键
     * @return 结果
     */
    @Override
    public int deleteArContentByContentId(Long contentId)
    {
        return arContentMapper.deleteArContentByContentId(contentId);
    }
}
