package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.VrScene;

/**
 * VR场景Service接口
 * 
 * @author lazy
 * @date 2025-01-13
 */
public interface IVrSceneService 
{
    /**
     * 查询VR场景
     * 
     * @param sceneId VR场景主键
     * @return VR场景
     */
    public VrScene selectVrSceneBySceneId(Long sceneId);

    /**
     * 查询VR场景列表
     * 
     * @param vrScene VR场景
     * @return VR场景集合
     */
    public List<VrScene> selectVrSceneList(VrScene vrScene);

    /**
     * 新增VR场景
     * 
     * @param vrScene VR场景
     * @return 结果
     */
    public int insertVrScene(VrScene vrScene);

    /**
     * 修改VR场景
     * 
     * @param vrScene VR场景
     * @return 结果
     */
    public int updateVrScene(VrScene vrScene);

    /**
     * 批量删除VR场景
     * 
     * @param sceneIds 需要删除的VR场景主键集合
     * @return 结果
     */
    public int deleteVrSceneBySceneIds(Long[] sceneIds);

    /**
     * 删除VR场景信息
     * 
     * @param sceneId VR场景主键
     * @return 结果
     */
    public int deleteVrSceneBySceneId(Long sceneId);
}
