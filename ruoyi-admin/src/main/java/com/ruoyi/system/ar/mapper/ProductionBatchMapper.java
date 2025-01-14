package com.ruoyi.system.ar.mapper;

import java.util.List;
import com.ruoyi.system.ar.domain.ProductionBatch;

/**
 * 生产批次Mapper接口
 * 
 * @author laazy
 * @date 2025-01-14
 */
public interface ProductionBatchMapper 
{
    /**
     * 查询生产批次
     * 
     * @param batchId 生产批次主键
     * @return 生产批次
     */
    public ProductionBatch selectProductionBatchByBatchId(Long batchId);

    /**
     * 查询生产批次列表
     * 
     * @param productionBatch 生产批次
     * @return 生产批次集合
     */
    public List<ProductionBatch> selectProductionBatchList(ProductionBatch productionBatch);

    /**
     * 新增生产批次
     * 
     * @param productionBatch 生产批次
     * @return 结果
     */
    public int insertProductionBatch(ProductionBatch productionBatch);

    /**
     * 修改生产批次
     * 
     * @param productionBatch 生产批次
     * @return 结果
     */
    public int updateProductionBatch(ProductionBatch productionBatch);

    /**
     * 删除生产批次
     * 
     * @param batchId 生产批次主键
     * @return 结果
     */
    public int deleteProductionBatchByBatchId(Long batchId);

    /**
     * 批量删除生产批次
     * 
     * @param batchIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductionBatchByBatchIds(Long[] batchIds);
}
