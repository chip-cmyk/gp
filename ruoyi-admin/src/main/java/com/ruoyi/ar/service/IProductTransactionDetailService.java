package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.ProductTransactionDetail;

/**
 * 产品清单明细Service接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface IProductTransactionDetailService 
{
    /**
     * 查询产品清单明细
     * 
     * @param productId 产品清单明细主键
     * @return 产品清单明细
     */
    public ProductTransactionDetail selectProductTransactionDetailByProductId(Long productId);

    /**
     * 查询产品清单明细列表
     * 
     * @param productTransactionDetail 产品清单明细
     * @return 产品清单明细集合
     */
    public List<ProductTransactionDetail> selectProductTransactionDetailList(ProductTransactionDetail productTransactionDetail);

    /**
     * 新增产品清单明细
     * 
     * @param productTransactionDetail 产品清单明细
     * @return 结果
     */
    public int insertProductTransactionDetail(ProductTransactionDetail productTransactionDetail);

    /**
     * 修改产品清单明细
     * 
     * @param productTransactionDetail 产品清单明细
     * @return 结果
     */
    public int updateProductTransactionDetail(ProductTransactionDetail productTransactionDetail);

    /**
     * 批量删除产品清单明细
     * 
     * @param productIds 需要删除的产品清单明细主键集合
     * @return 结果
     */
    public int deleteProductTransactionDetailByProductIds(Long[] productIds);

    /**
     * 删除产品清单明细信息
     * 
     * @param productId 产品清单明细主键
     * @return 结果
     */
    public int deleteProductTransactionDetailByProductId(Long productId);
}
