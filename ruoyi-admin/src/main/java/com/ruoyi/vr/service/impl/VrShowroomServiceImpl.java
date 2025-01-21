package com.ruoyi.vr.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.vr.mapper.VrShowroomMapper;
import com.ruoyi.vr.domain.VrShowroom;
import com.ruoyi.vr.service.IVrShowroomService;

/**
 * VR展厅Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-20
 */
@Service
public class VrShowroomServiceImpl implements IVrShowroomService 
{
    @Autowired
    private VrShowroomMapper vrShowroomMapper;

    /**
     * 查询VR展厅
     * 
     * @param showroomId VR展厅主键
     * @return VR展厅
     */
    @Override
    public VrShowroom selectVrShowroomByShowroomId(Long showroomId)
    {
        return vrShowroomMapper.selectVrShowroomByShowroomId(showroomId);
    }

    /**
     * 查询VR展厅列表
     * 
     * @param vrShowroom VR展厅
     * @return VR展厅
     */
    @Override
    public List<VrShowroom> selectVrShowroomList(VrShowroom vrShowroom)
    {
        return vrShowroomMapper.selectVrShowroomList(vrShowroom);
    }

    /**
     * 新增VR展厅
     * 
     * @param vrShowroom VR展厅
     * @return 结果
     */
    @Override
    public int insertVrShowroom(VrShowroom vrShowroom)
    {
        return vrShowroomMapper.insertVrShowroom(vrShowroom);
    }

    /**
     * 修改VR展厅
     * 
     * @param vrShowroom VR展厅
     * @return 结果
     */
    @Override
    public int updateVrShowroom(VrShowroom vrShowroom)
    {
        return vrShowroomMapper.updateVrShowroom(vrShowroom);
    }

    /**
     * 批量删除VR展厅
     * 
     * @param showroomIds 需要删除的VR展厅主键
     * @return 结果
     */
    @Override
    public int deleteVrShowroomByShowroomIds(Long[] showroomIds)
    {
        return vrShowroomMapper.deleteVrShowroomByShowroomIds(showroomIds);
    }

    /**
     * 删除VR展厅信息
     * 
     * @param showroomId VR展厅主键
     * @return 结果
     */
    @Override
    public int deleteVrShowroomByShowroomId(Long showroomId)
    {
        return vrShowroomMapper.deleteVrShowroomByShowroomId(showroomId);
    }
}
