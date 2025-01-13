package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SandboxZone;

/**
 * 沙盘分区Service接口
 * 
 * @author lazy
 * @date 2025-01-13
 */
public interface ISandboxZoneService 
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
     * 批量删除沙盘分区
     * 
     * @param zoneIds 需要删除的沙盘分区主键集合
     * @return 结果
     */
    public int deleteSandboxZoneByZoneIds(Long[] zoneIds);

    /**
     * 删除沙盘分区信息
     * 
     * @param zoneId 沙盘分区主键
     * @return 结果
     */
    public int deleteSandboxZoneByZoneId(Long zoneId);
}
