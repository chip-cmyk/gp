package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.ProductTransactionDetailMapper;
import com.ruoyi.ar.domain.ProductTransactionDetail;
import com.ruoyi.ar.service.IProductTransactionDetailService;

/**
 * 产品清单明细Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-20
 */
@Service
public class ProductTransactionDetailServiceImpl implements IProductTransactionDetailService 
{
    @Autowired
    private ProductTransactionDetailMapper productTransactionDetailMapper;

    /**
     * 查询产品清单明细
     * 
     * @param productId 产品清单明细主键
     * @return 产品清单明细
     */
    @Override
    public ProductTransactionDetail selectProductTransactionDetailByProductId(Long productId)
    {
        return productTransactionDetailMapper.selectProductTransactionDetailByProductId(productId);
    }

    /**
     * 查询产品清单明细列表
     * 
     * @param productTransactionDetail 产品清单明细
     * @return 产品清单明细
     */
    @Override
    public List<ProductTransactionDetail> selectProductTransactionDetailList(ProductTransactionDetail productTransactionDetail)
    {
        return productTransactionDetailMapper.selectProductTransactionDetailList(productTransactionDetail);
    }

    /**
     * 新增产品清单明细
     * 
     * @param productTransactionDetail 产品清单明细
     * @return 结果
     */
    @Override
    public int insertProductTransactionDetail(ProductTransactionDetail productTransactionDetail)
    {
        return productTransactionDetailMapper.insertProductTransactionDetail(productTransactionDetail);
    }

    /**
     * 修改产品清单明细
     * 
     * @param productTransactionDetail 产品清单明细
     * @return 结果
     */
    @Override
    public int updateProductTransactionDetail(ProductTransactionDetail productTransactionDetail)
    {
        return productTransactionDetailMapper.updateProductTransactionDetail(productTransactionDetail);
    }

    /**
     * 批量删除产品清单明细
     * 
     * @param productIds 需要删除的产品清单明细主键
     * @return 结果
     */
    @Override
    public int deleteProductTransactionDetailByProductIds(Long[] productIds)
    {
        return productTransactionDetailMapper.deleteProductTransactionDetailByProductIds(productIds);
    }

    /**
     * 删除产品清单明细信息
     * 
     * @param productId 产品清单明细主键
     * @return 结果
     */
    @Override
    public int deleteProductTransactionDetailByProductId(Long productId)
    {
        return productTransactionDetailMapper.deleteProductTransactionDetailByProductId(productId);
    }
}
