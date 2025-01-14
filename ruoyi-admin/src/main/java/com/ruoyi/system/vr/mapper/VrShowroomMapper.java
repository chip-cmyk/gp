package com.ruoyi.system.vr.mapper;

import java.util.List;
import com.ruoyi.system.vr.domain.VrShowroom;

/**
 * VR展厅Mapper接口
 * 
 * @author laazy
 * @date 2025-01-14
 */
public interface VrShowroomMapper 
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
     * 删除VR展厅
     * 
     * @param showroomId VR展厅主键
     * @return 结果
     */
    public int deleteVrShowroomByShowroomId(Long showroomId);

    /**
     * 批量删除VR展厅
     * 
     * @param showroomIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVrShowroomByShowroomIds(Long[] showroomIds);
}
