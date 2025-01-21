package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.ProductionBatchMapper;
import com.ruoyi.ar.domain.ProductionBatch;
import com.ruoyi.ar.service.IProductionBatchService;

/**
 * 生产批次Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-21
 */
@Service
public class ProductionBatchServiceImpl implements IProductionBatchService 
{
    @Autowired
    private ProductionBatchMapper productionBatchMapper;

    /**
     * 查询生产批次
     * 
     * @param batchId 生产批次主键
     * @return 生产批次
     */
    @Override
    public ProductionBatch selectProductionBatchByBatchId(Long batchId)
    {
        return productionBatchMapper.selectProductionBatchByBatchId(batchId);
    }

    /**
     * 查询生产批次列表
     * 
     * @param productionBatch 生产批次
     * @return 生产批次
     */
    @Override
    public List<ProductionBatch> selectProductionBatchList(ProductionBatch productionBatch)
    {
        return productionBatchMapper.selectProductionBatchList(productionBatch);
    }

    /**
     * 新增生产批次
     * 
     * @param productionBatch 生产批次
     * @return 结果
     */
    @Override
    public int insertProductionBatch(ProductionBatch productionBatch)
    {
        return productionBatchMapper.insertProductionBatch(productionBatch);
    }

    /**
     * 修改生产批次
     * 
     * @param productionBatch 生产批次
     * @return 结果
     */
    @Override
    public int updateProductionBatch(ProductionBatch productionBatch)
    {
        return productionBatchMapper.updateProductionBatch(productionBatch);
    }

    /**
     * 批量删除生产批次
     * 
     * @param batchIds 需要删除的生产批次主键
     * @return 结果
     */
    @Override
    public int deleteProductionBatchByBatchIds(Long[] batchIds)
    {
        return productionBatchMapper.deleteProductionBatchByBatchIds(batchIds);
    }

    /**
     * 删除生产批次信息
     * 
     * @param batchId 生产批次主键
     * @return 结果
     */
    @Override
    public int deleteProductionBatchByBatchId(Long batchId)
    {
        return productionBatchMapper.deleteProductionBatchByBatchId(batchId);
    }
}
