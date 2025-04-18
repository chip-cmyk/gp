package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.ar.domain.ProductTransactionDetail;
import com.ruoyi.ar.mapper.ProductTransactionMapper;
import com.ruoyi.ar.domain.ProductTransaction;
import com.ruoyi.ar.service.IProductTransactionService;

/**
 * 产品出入库单Service业务层处理
 * 
 * @author laazy
 * @date 2025-02-07
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
    @Transactional
    @Override
    public int insertProductTransaction(ProductTransaction productTransaction)
    {
        int rows = productTransactionMapper.insertProductTransaction(productTransaction);
        insertProductTransactionDetail(productTransaction);
        return rows;
    }

    /**
     * 修改产品出入库单
     * 
     * @param productTransaction 产品出入库单
     * @return 结果
     */
    @Transactional
    @Override
    public int updateProductTransaction(ProductTransaction productTransaction)
    {
        productTransactionMapper.deleteProductTransactionDetailByTransactionId(productTransaction.getTransactionId());
        insertProductTransactionDetail(productTransaction);
        return productTransactionMapper.updateProductTransaction(productTransaction);
    }

    /**
     * 批量删除产品出入库单
     * 
     * @param transactionIds 需要删除的产品出入库单主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteProductTransactionByTransactionIds(Long[] transactionIds)
    {
        //productTransactionMapper.deleteProductTransactionDetailByTransactionIds(transactionIds);
        return productTransactionMapper.deleteProductTransactionByTransactionIds(transactionIds);
    }

    /**
     * 删除产品出入库单信息
     * 
     * @param transactionId 产品出入库单主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteProductTransactionByTransactionId(Long transactionId)
    {
//        productTransactionMapper.deleteProductTransactionDetailByTransactionId(transactionId);
        return productTransactionMapper.deleteProductTransactionByTransactionId(transactionId);
    }

    /**
     * 新增产品清单明细信息
     * 
     * @param productTransaction 产品出入库单对象
     */
    public void insertProductTransactionDetail(ProductTransaction productTransaction)
    {
        List<ProductTransactionDetail> productTransactionDetailList = productTransaction.getProductTransactionDetailList();
        Long transactionId = productTransaction.getTransactionId();
        if (StringUtils.isNotNull(productTransactionDetailList))
        {
            List<ProductTransactionDetail> list = new ArrayList<ProductTransactionDetail>();
            for (ProductTransactionDetail productTransactionDetail : productTransactionDetailList)
            {
                productTransactionDetail.setTransactionId(transactionId);
                list.add(productTransactionDetail);
            }
            if (list.size() > 0)
            {
                productTransactionMapper.batchProductTransactionDetail(list);
            }
        }
    }
}
