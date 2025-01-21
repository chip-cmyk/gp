package com.ruoyi.vr.service;

import java.util.List;
import com.ruoyi.vr.domain.VrContent;

/**
 * VR内容Service接口
 * 
 * @author lazy
 * @date 2025-01-20
 */
public interface IVrContentService 
{
    /**
     * 查询VR内容
     * 
     * @param vrContentId VR内容主键
     * @return VR内容
     */
    public VrContent selectVrContentByVrContentId(Long vrContentId);

    /**
     * 查询VR内容列表
     * 
     * @param vrContent VR内容
     * @return VR内容集合
     */
    public List<VrContent> selectVrContentList(VrContent vrContent);

    /**
     * 新增VR内容
     * 
     * @param vrContent VR内容
     * @return 结果
     */
    public int insertVrContent(VrContent vrContent);

    /**
     * 修改VR内容
     * 
     * @param vrContent VR内容
     * @return 结果
     */
    public int updateVrContent(VrContent vrContent);

    /**
     * 批量删除VR内容
     * 
     * @param vrContentIds 需要删除的VR内容主键集合
     * @return 结果
     */
    public int deleteVrContentByVrContentIds(Long[] vrContentIds);

    /**
     * 删除VR内容信息
     * 
     * @param vrContentId VR内容主键
     * @return 结果
     */
    public int deleteVrContentByVrContentId(Long vrContentId);
}
