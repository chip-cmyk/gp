package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.ArContentMapper;
import com.ruoyi.ar.domain.ArContent;
import com.ruoyi.ar.service.IArContentService;

/**
 * AR内容Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-20
 */
@Service
public class ArContentServiceImpl implements IArContentService 
{
    @Autowired
    private ArContentMapper arContentMapper;

    /**
     * 查询AR内容
     * 
     * @param arContentId AR内容主键
     * @return AR内容
     */
    @Override
    public ArContent selectArContentByArContentId(Long arContentId)
    {
        return arContentMapper.selectArContentByArContentId(arContentId);
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
     * @param arContentIds 需要删除的AR内容主键
     * @return 结果
     */
    @Override
    public int deleteArContentByArContentIds(Long[] arContentIds)
    {
        return arContentMapper.deleteArContentByArContentIds(arContentIds);
    }

    /**
     * 删除AR内容信息
     * 
     * @param arContentId AR内容主键
     * @return 结果
     */
    @Override
    public int deleteArContentByArContentId(Long arContentId)
    {
        return arContentMapper.deleteArContentByArContentId(arContentId);
    }
}
