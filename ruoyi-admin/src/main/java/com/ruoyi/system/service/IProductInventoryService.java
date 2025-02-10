package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ProductInventory;

/**
 * 产品库存Service接口
 * 
 * @author lazy
 * @date 2025-02-10
 */
public interface IProductInventoryService 
{
    /**
     * 查询产品库存
     * 
     * @param productId 产品库存主键
     * @return 产品库存
     */
    public ProductInventory selectProductInventoryByProductId(Long productId);

    /**
     * 查询产品库存列表
     * 
     * @param productInventory 产品库存
     * @return 产品库存集合
     */
    public List<ProductInventory> selectProductInventoryList(ProductInventory productInventory);

    /**
     * 新增产品库存
     * 
     * @param productInventory 产品库存
     * @return 结果
     */
    public int insertProductInventory(ProductInventory productInventory);

    /**
     * 修改产品库存
     * 
     * @param productInventory 产品库存
     * @return 结果
     */
    public int updateProductInventory(ProductInventory productInventory);

    /**
     * 批量删除产品库存
     * 
     * @param productIds 需要删除的产品库存主键集合
     * @return 结果
     */
    public int deleteProductInventoryByProductIds(Long[] productIds);

    /**
     * 删除产品库存信息
     * 
     * @param productId 产品库存主键
     * @return 结果
     */
    public int deleteProductInventoryByProductId(Long productId);
}
