package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.SandboxZone;

/**
 * 沙盘分区Mapper接口
 * 
 * @author lazy
 * @date 2025-01-24
 */
public interface SandboxZoneMapper 
{
    /**
     * 查询沙盘分区
     * 
     * @param zoneId 沙盘分区主键
     * @return 沙盘分区
     */
    public SandboxZone selectSandboxZoneByZoneId(Long zoneId);

    /**
     * 查询沙盘分区列表
     * 
     * @param sandboxZone 沙盘分区
     * @return 沙盘分区集合
     */
    public List<SandboxZone> selectSandboxZoneList(SandboxZone sandboxZone);

    /**
     * 新增沙盘分区
     * 
     * @param sandboxZone 沙盘分区
     * @return 结果
     */
    public int insertSandboxZone(SandboxZone sandboxZone);

    /**
     * 修改沙盘分区
     * 
     * @param sandboxZone 沙盘分区
     * @return 结果
     */
    public int updateSandboxZone(SandboxZone sandboxZone);

    /**
     * 删除沙盘分区
     * 
     * @param zoneId 沙盘分区主键
     * @return 结果
     */
    public int deleteSandboxZoneByZoneId(Long zoneId);

    /**
     * 批量删除沙盘分区
     * 
     * @param zoneIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSandboxZoneByZoneIds(Long[] zoneIds);
}
