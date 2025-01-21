package com.ruoyi.vr.service;

import java.util.List;
import com.ruoyi.vr.domain.VrShowroom;

/**
 * VR展厅Service接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface IVrShowroomService 
{
    /**
     * 查询VR展厅
     * 
     * @param showroomId VR展厅主键
     * @return VR展厅
     */
    public VrShowroom selectVrShowroomByShowroomId(Long showroomId);

    /**
     * 查询VR展厅列表
     * 
     * @param vrShowroom VR展厅
     * @return VR展厅集合
     */
    public List<VrShowroom> selectVrShowroomList(VrShowroom vrShowroom);

    /**
     * 新增VR展厅
     * 
     * @param vrShowroom VR展厅
     * @return 结果
     */
    public int insertVrShowroom(VrShowroom vrShowroom);

    /**
     * 修改VR展厅
     * 
     * @param vrShowroom VR展厅
     * @return 结果
     */
    public int updateVrShowroom(VrShowroom vrShowroom);

    /**
     * 批量删除VR展厅
     * 
     * @param showroomIds 需要删除的VR展厅主键集合
     * @return 结果
     */
    public int deleteVrShowroomByShowroomIds(Long[] showroomIds);

    /**
     * 删除VR展厅信息
     * 
     * @param showroomId VR展厅主键
     * @return 结果
     */
    public int deleteVrShowroomByShowroomId(Long showroomId);
}
