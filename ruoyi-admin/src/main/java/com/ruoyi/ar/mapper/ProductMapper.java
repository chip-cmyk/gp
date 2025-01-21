package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.Product;

/**
 * 产品信息Mapper接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface ProductMapper 
{
    /**
     * 查询产品信息
     * 
     * @param productId 产品信息主键
     * @return 产品信息
     */
    public Product selectProductByProductId(Long productId);

    /**
     * 查询产品信息列表
     * 
     * @param product 产品信息
     * @return 产品信息集合
     */
    public List<Product> selectProductList(Product product);

    /**
     * 新增产品信息
     * 
     * @param product 产品信息
     * @return 结果
     */
    public int insertProduct(Product product);

    /**
     * 修改产品信息
     * 
     * @param product 产品信息
     * @return 结果
     */
    public int updateProduct(Product product);

    /**
     * 删除产品信息
     * 
     * @param productId 产品信息主键
     * @return 结果
     */
    public int deleteProductByProductId(Long productId);

    /**
     * 批量删除产品信息
     * 
     * @param productIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductByProductIds(Long[] productIds);
}
