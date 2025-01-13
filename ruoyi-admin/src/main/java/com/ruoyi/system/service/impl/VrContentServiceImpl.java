package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.VrContentMapper;
import com.ruoyi.system.domain.VrContent;
import com.ruoyi.system.service.IVrContentService;

/**
 * VR内容Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-13
 */
@Service
public class VrContentServiceImpl implements IVrContentService 
{
    @Autowired
    private VrContentMapper vrContentMapper;

    /**
     * 查询VR内容
     * 
     * @param contentId VR内容主键
     * @return VR内容
     */
    @Override
    public VrContent selectVrContentByContentId(Long contentId)
    {
        return vrContentMapper.selectVrContentByContentId(contentId);
    }

    /**
     * 查询VR内容列表
     * 
     * @param vrContent VR内容
     * @return VR内容
     */
    @Override
    public List<VrContent> selectVrContentList(VrContent vrContent)
    {
        return vrContentMapper.selectVrContentList(vrContent);
    }

    /**
     * 新增VR内容
     * 
     * @param vrContent VR内容
     * @return 结果
     */
    @Override
    public int insertVrContent(VrContent vrContent)
    {
        return vrContentMapper.insertVrContent(vrContent);
    }

    /**
     * 修改VR内容
     * 
     * @param vrContent VR内容
     * @return 结果
     */
    @Override
    public int updateVrContent(VrContent vrContent)
    {
        return vrContentMapper.updateVrContent(vrContent);
    }

    /**
     * 批量删除VR内容
     * 
     * @param contentIds 需要删除的VR内容主键
     * @return 结果
     */
    @Override
    public int deleteVrContentByContentIds(Long[] contentIds)
    {
        return vrContentMapper.deleteVrContentByContentIds(contentIds);
    }

    /**
     * 删除VR内容信息
     * 
     * @param contentId VR内容主键
     * @return 结果
     */
    @Override
    public int deleteVrContentByContentId(Long contentId)
    {
        return vrContentMapper.deleteVrContentByContentId(contentId);
    }
}
