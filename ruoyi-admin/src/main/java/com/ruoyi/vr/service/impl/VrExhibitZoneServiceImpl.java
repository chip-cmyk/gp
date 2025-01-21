package com.ruoyi.vr.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.vr.mapper.VrExhibitZoneMapper;
import com.ruoyi.vr.domain.VrExhibitZone;
import com.ruoyi.vr.service.IVrExhibitZoneService;

/**
 * VR展区Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-20
 */
@Service
public class VrExhibitZoneServiceImpl implements IVrExhibitZoneService 
{
    @Autowired
    private VrExhibitZoneMapper vrExhibitZoneMapper;

    /**
     * 查询VR展区
     * 
     * @param exhibitZoneId VR展区主键
     * @return VR展区
     */
    @Override
    public VrExhibitZone selectVrExhibitZoneByExhibitZoneId(Long exhibitZoneId)
    {
        return vrExhibitZoneMapper.selectVrExhibitZoneByExhibitZoneId(exhibitZoneId);
    }

    /**
     * 查询VR展区列表
     * 
     * @param vrExhibitZone VR展区
     * @return VR展区
     */
    @Override
    public List<VrExhibitZone> selectVrExhibitZoneList(VrExhibitZone vrExhibitZone)
    {
        return vrExhibitZoneMapper.selectVrExhibitZoneList(vrExhibitZone);
    }

    /**
     * 新增VR展区
     * 
     * @param vrExhibitZone VR展区
     * @return 结果
     */
    @Override
    public int insertVrExhibitZone(VrExhibitZone vrExhibitZone)
    {
        return vrExhibitZoneMapper.insertVrExhibitZone(vrExhibitZone);
    }

    /**
     * 修改VR展区
     * 
     * @param vrExhibitZone VR展区
     * @return 结果
     */
    @Override
    public int updateVrExhibitZone(VrExhibitZone vrExhibitZone)
    {
        return vrExhibitZoneMapper.updateVrExhibitZone(vrExhibitZone);
    }

    /**
     * 批量删除VR展区
     * 
     * @param exhibitZoneIds 需要删除的VR展区主键
     * @return 结果
     */
    @Override
    public int deleteVrExhibitZoneByExhibitZoneIds(Long[] exhibitZoneIds)
    {
        return vrExhibitZoneMapper.deleteVrExhibitZoneByExhibitZoneIds(exhibitZoneIds);
    }

    /**
     * 删除VR展区信息
     * 
     * @param exhibitZoneId VR展区主键
     * @return 结果
     */
    @Override
    public int deleteVrExhibitZoneByExhibitZoneId(Long exhibitZoneId)
    {
        return vrExhibitZoneMapper.deleteVrExhibitZoneByExhibitZoneId(exhibitZoneId);
    }
}
