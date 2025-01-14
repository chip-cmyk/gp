package com.ruoyi.system.vr.mapper;

import java.util.List;
import com.ruoyi.system.vr.domain.VrExhibitZone;

/**
 * VR展区Mapper接口
 * 
 * @author laazy
 * @date 2025-01-14
 */
public interface VrExhibitZoneMapper 
{
    /**
     * 查询VR展区
     * 
     * @param exhibitZoneId VR展区主键
     * @return VR展区
     */
    public VrExhibitZone selectVrExhibitZoneByExhibitZoneId(Long exhibitZoneId);

    /**
     * 查询VR展区列表
     * 
     * @param vrExhibitZone VR展区
     * @return VR展区集合
     */
    public List<VrExhibitZone> selectVrExhibitZoneList(VrExhibitZone vrExhibitZone);

    /**
     * 新增VR展区
     * 
     * @param vrExhibitZone VR展区
     * @return 结果
     */
    public int insertVrExhibitZone(VrExhibitZone vrExhibitZone);

    /**
     * 修改VR展区
     * 
     * @param vrExhibitZone VR展区
     * @return 结果
     */
    public int updateVrExhibitZone(VrExhibitZone vrExhibitZone);

    /**
     * 删除VR展区
     * 
     * @param exhibitZoneId VR展区主键
     * @return 结果
     */
    public int deleteVrExhibitZoneByExhibitZoneId(Long exhibitZoneId);

    /**
     * 批量删除VR展区
     * 
     * @param exhibitZoneIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVrExhibitZoneByExhibitZoneIds(Long[] exhibitZoneIds);
}
