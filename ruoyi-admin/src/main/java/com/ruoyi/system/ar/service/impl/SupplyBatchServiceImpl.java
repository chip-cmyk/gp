package com.ruoyi.system.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.ar.mapper.SupplyBatchMapper;
import com.ruoyi.system.ar.domain.SupplyBatch;
import com.ruoyi.system.ar.service.ISupplyBatchService;

/**
 * 供应批次Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-14
 */
@Service
public class SupplyBatchServiceImpl implements ISupplyBatchService 
{
    @Autowired
    private SupplyBatchMapper supplyBatchMapper;

    /**
     * 查询供应批次
     * 
     * @param batchId 供应批次主键
     * @return 供应批次
     */
    @Override
    public SupplyBatch selectSupplyBatchByBatchId(Long batchId)
    {
        return supplyBatchMapper.selectSupplyBatchByBatchId(batchId);
    }

    /**
     * 查询供应批次列表
     * 
     * @param supplyBatch 供应批次
     * @return 供应批次
     */
    @Override
    public List<SupplyBatch> selectSupplyBatchList(SupplyBatch supplyBatch)
    {
        return supplyBatchMapper.selectSupplyBatchList(supplyBatch);
    }

    /**
     * 新增供应批次
     * 
     * @param supplyBatch 供应批次
     * @return 结果
     */
    @Override
    public int insertSupplyBatch(SupplyBatch supplyBatch)
    {
        return supplyBatchMapper.insertSupplyBatch(supplyBatch);
    }

    /**
     * 修改供应批次
     * 
     * @param supplyBatch 供应批次
     * @return 结果
     */
    @Override
    public int updateSupplyBatch(SupplyBatch supplyBatch)
    {
        return supplyBatchMapper.updateSupplyBatch(supplyBatch);
    }

    /**
     * 批量删除供应批次
     * 
     * @param batchIds 需要删除的供应批次主键
     * @return 结果
     */
    @Override
    public int deleteSupplyBatchByBatchIds(Long[] batchIds)
    {
        return supplyBatchMapper.deleteSupplyBatchByBatchIds(batchIds);
    }

    /**
     * 删除供应批次信息
     * 
     * @param batchId 供应批次主键
     * @return 结果
     */
    @Override
    public int deleteSupplyBatchByBatchId(Long batchId)
    {
        return supplyBatchMapper.deleteSupplyBatchByBatchId(batchId);
    }
}
