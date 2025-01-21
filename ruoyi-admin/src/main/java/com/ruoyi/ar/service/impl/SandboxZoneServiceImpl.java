package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.SandboxZoneMapper;
import com.ruoyi.ar.domain.SandboxZone;
import com.ruoyi.ar.service.ISandboxZoneService;

/**
 * 沙盘分区Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-20
 */
@Service
public class SandboxZoneServiceImpl implements ISandboxZoneService 
{
    @Autowired
    private SandboxZoneMapper sandboxZoneMapper;

    /**
     * 查询沙盘分区
     * 
     * @param zoneId 沙盘分区主键
     * @return 沙盘分区
     */
    @Override
    public SandboxZone selectSandboxZoneByZoneId(Long zoneId)
    {
        return sandboxZoneMapper.selectSandboxZoneByZoneId(zoneId);
    }

    /**
     * 查询沙盘分区列表
     * 
     * @param sandboxZone 沙盘分区
     * @return 沙盘分区
     */
    @Override
    public List<SandboxZone> selectSandboxZoneList(SandboxZone sandboxZone)
    {
        return sandboxZoneMapper.selectSandboxZoneList(sandboxZone);
    }

    /**
     * 新增沙盘分区
     * 
     * @param sandboxZone 沙盘分区
     * @return 结果
     */
    @Override
    public int insertSandboxZone(SandboxZone sandboxZone)
    {
        return sandboxZoneMapper.insertSandboxZone(sandboxZone);
    }

    /**
     * 修改沙盘分区
     * 
     * @param sandboxZone 沙盘分区
     * @return 结果
     */
    @Override
    public int updateSandboxZone(SandboxZone sandboxZone)
    {
        return sandboxZoneMapper.updateSandboxZone(sandboxZone);
    }

    /**
     * 批量删除沙盘分区
     * 
     * @param zoneIds 需要删除的沙盘分区主键
     * @return 结果
     */
    @Override
    public int deleteSandboxZoneByZoneIds(Long[] zoneIds)
    {
        return sandboxZoneMapper.deleteSandboxZoneByZoneIds(zoneIds);
    }

    /**
     * 删除沙盘分区信息
     * 
     * @param zoneId 沙盘分区主键
     * @return 结果
     */
    @Override
    public int deleteSandboxZoneByZoneId(Long zoneId)
    {
        return sandboxZoneMapper.deleteSandboxZoneByZoneId(zoneId);
    }
}
