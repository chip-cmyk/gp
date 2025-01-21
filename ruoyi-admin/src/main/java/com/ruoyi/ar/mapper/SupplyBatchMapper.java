package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.SupplyBatch;

/**
 * 供应批次Mapper接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface SupplyBatchMapper 
{
    /**
     * 查询供应批次
     * 
     * @param batchId 供应批次主键
     * @return 供应批次
     */
    public SupplyBatch selectSupplyBatchByBatchId(Long batchId);

    /**
     * 查询供应批次列表
     * 
     * @param supplyBatch 供应批次
     * @return 供应批次集合
     */
    public List<SupplyBatch> selectSupplyBatchList(SupplyBatch supplyBatch);

    /**
     * 新增供应批次
     * 
     * @param supplyBatch 供应批次
     * @return 结果
     */
    public int insertSupplyBatch(SupplyBatch supplyBatch);

    /**
     * 修改供应批次
     * 
     * @param supplyBatch 供应批次
     * @return 结果
     */
    public int updateSupplyBatch(SupplyBatch supplyBatch);

    /**
     * 删除供应批次
     * 
     * @param batchId 供应批次主键
     * @return 结果
     */
    public int deleteSupplyBatchByBatchId(Long batchId);

    /**
     * 批量删除供应批次
     * 
     * @param batchIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSupplyBatchByBatchIds(Long[] batchIds);
}
