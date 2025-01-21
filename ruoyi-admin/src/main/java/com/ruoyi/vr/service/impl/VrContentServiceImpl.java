package com.ruoyi.vr.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.vr.mapper.VrContentMapper;
import com.ruoyi.vr.domain.VrContent;
import com.ruoyi.vr.service.IVrContentService;

/**
 * VR内容Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-20
 */
@Service
public class VrContentServiceImpl implements IVrContentService 
{
    @Autowired
    private VrContentMapper vrContentMapper;

    /**
     * 查询VR内容
     * 
     * @param vrContentId VR内容主键
     * @return VR内容
     */
    @Override
    public VrContent selectVrContentByVrContentId(Long vrContentId)
    {
        return vrContentMapper.selectVrContentByVrContentId(vrContentId);
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
     * @param vrContentIds 需要删除的VR内容主键
     * @return 结果
     */
    @Override
    public int deleteVrContentByVrContentIds(Long[] vrContentIds)
    {
        return vrContentMapper.deleteVrContentByVrContentIds(vrContentIds);
    }

    /**
     * 删除VR内容信息
     * 
     * @param vrContentId VR内容主键
     * @return 结果
     */
    @Override
    public int deleteVrContentByVrContentId(Long vrContentId)
    {
        return vrContentMapper.deleteVrContentByVrContentId(vrContentId);
    }
}
