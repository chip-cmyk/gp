package com.ruoyi.system.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.ar.mapper.ProductTransactionMapper;
import com.ruoyi.system.ar.domain.ProductTransaction;
import com.ruoyi.system.ar.service.IProductTransactionService;

/**
 * 产品出入库单Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-14
 */
@Service
public class ProductTransactionServiceImpl implements IProductTransactionService 
{
    @Autowired
    private ProductTransactionMapper productTransactionMapper;

    /**
     * 查询产品出入库单
     * 
     * @param transactionId 产品出入库单主键
     * @return 产品出入库单
     */
    @Override
    public ProductTransaction selectProductTransactionByTransactionId(Long transactionId)
    {
        return productTransactionMapper.selectProductTransactionByTransactionId(transactionId);
    }

    /**
     * 查询产品出入库单列表
     * 
     * @param productTransaction 产品出入库单
     * @return 产品出入库单
     */
    @Override
    public List<ProductTransaction> selectProductTransactionList(ProductTransaction productTransaction)
    {
        return productTransactionMapper.selectProductTransactionList(productTransaction);
    }

    /**
     * 新增产品出入库单
     * 
     * @param productTransaction 产品出入库单
     * @return 结果
     */
    @Override
    public int insertProductTransaction(ProductTransaction productTransaction)
    {
        return productTransactionMapper.insertProductTransaction(productTransaction);
    }

    /**
     * 修改产品出入库单
     * 
     * @param productTransaction 产品出入库单
     * @return 结果
     */
    @Override
    public int updateProductTransaction(ProductTransaction productTransaction)
    {
        return productTransactionMapper.updateProductTransaction(productTransaction);
    }

    /**
     * 批量删除产品出入库单
     * 
     * @param transactionIds 需要删除的产品出入库单主键
     * @return 结果
     */
    @Override
    public int deleteProductTransactionByTransactionIds(Long[] transactionIds)
    {
        return productTransactionMapper.deleteProductTransactionByTransactionIds(transactionIds);
    }

    /**
     * 删除产品出入库单信息
     * 
     * @param transactionId 产品出入库单主键
     * @return 结果
     */
    @Override
    public int deleteProductTransactionByTransactionId(Long transactionId)
    {
        return productTransactionMapper.deleteProductTransactionByTransactionId(transactionId);
    }
}
