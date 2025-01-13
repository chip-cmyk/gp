package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.VrSceneMapper;
import com.ruoyi.system.domain.VrScene;
import com.ruoyi.system.service.IVrSceneService;

/**
 * VR场景Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-13
 */
@Service
public class VrSceneServiceImpl implements IVrSceneService 
{
    @Autowired
    private VrSceneMapper vrSceneMapper;

    /**
     * 查询VR场景
     * 
     * @param sceneId VR场景主键
     * @return VR场景
     */
    @Override
    public VrScene selectVrSceneBySceneId(Long sceneId)
    {
        return vrSceneMapper.selectVrSceneBySceneId(sceneId);
    }

    /**
     * 查询VR场景列表
     * 
     * @param vrScene VR场景
     * @return VR场景
     */
    @Override
    public List<VrScene> selectVrSceneList(VrScene vrScene)
    {
        return vrSceneMapper.selectVrSceneList(vrScene);
    }

    /**
     * 新增VR场景
     * 
     * @param vrScene VR场景
     * @return 结果
     */
    @Override
    public int insertVrScene(VrScene vrScene)
    {
        return vrSceneMapper.insertVrScene(vrScene);
    }

    /**
     * 修改VR场景
     * 
     * @param vrScene VR场景
     * @return 结果
     */
    @Override
    public int updateVrScene(VrScene vrScene)
    {
        return vrSceneMapper.updateVrScene(vrScene);
    }

    /**
     * 批量删除VR场景
     * 
     * @param sceneIds 需要删除的VR场景主键
     * @return 结果
     */
    @Override
    public int deleteVrSceneBySceneIds(Long[] sceneIds)
    {
        return vrSceneMapper.deleteVrSceneBySceneIds(sceneIds);
    }

    /**
     * 删除VR场景信息
     * 
     * @param sceneId VR场景主键
     * @return 结果
     */
    @Override
    public int deleteVrSceneBySceneId(Long sceneId)
    {
        return vrSceneMapper.deleteVrSceneBySceneId(sceneId);
    }
}
