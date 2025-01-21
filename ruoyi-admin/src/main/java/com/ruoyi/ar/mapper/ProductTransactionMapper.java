package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.ProductTransaction;

/**
 * 产品出入库单Mapper接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface ProductTransactionMapper 
{
    /**
     * 查询产品出入库单
     * 
     * @param transactionId 产品出入库单主键
     * @return 产品出入库单
     */
    public ProductTransaction selectProductTransactionByTransactionId(Long transactionId);

    /**
     * 查询产品出入库单列表
     * 
     * @param productTransaction 产品出入库单
     * @return 产品出入库单集合
     */
    public List<ProductTransaction> selectProductTransactionList(ProductTransaction productTransaction);

    /**
     * 新增产品出入库单
     * 
     * @param productTransaction 产品出入库单
     * @return 结果
     */
    public int insertProductTransaction(ProductTransaction productTransaction);

    /**
     * 修改产品出入库单
     * 
     * @param productTransaction 产品出入库单
     * @return 结果
     */
    public int updateProductTransaction(ProductTransaction productTransaction);

    /**
     * 删除产品出入库单
     * 
     * @param transactionId 产品出入库单主键
     * @return 结果
     */
    public int deleteProductTransactionByTransactionId(Long transactionId);

    /**
     * 批量删除产品出入库单
     * 
     * @param transactionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductTransactionByTransactionIds(Long[] transactionIds);
}
