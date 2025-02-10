package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ProductInventoryMapper;
import com.ruoyi.system.domain.ProductInventory;
import com.ruoyi.system.service.IProductInventoryService;

/**
 * 产品库存Service业务层处理
 * 
 * @author lazy
 * @date 2025-02-10
 */
@Service
public class ProductInventoryServiceImpl implements IProductInventoryService 
{
    @Autowired
    private ProductInventoryMapper productInventoryMapper;

    /**
     * 查询产品库存
     * 
     * @param productId 产品库存主键
     * @return 产品库存
     */
    @Override
    public ProductInventory selectProductInventoryByProductId(Long productId)
    {
        return productInventoryMapper.selectProductInventoryByProductId(productId);
    }

    /**
     * 查询产品库存列表
     * 
     * @param productInventory 产品库存
     * @return 产品库存
     */
    @Override
    public List<ProductInventory> selectProductInventoryList(ProductInventory productInventory)
    {
        return productInventoryMapper.selectProductInventoryList(productInventory);
    }

    /**
     * 新增产品库存
     * 
     * @param productInventory 产品库存
     * @return 结果
     */
    @Override
    public int insertProductInventory(ProductInventory productInventory)
    {
        return productInventoryMapper.insertProductInventory(productInventory);
    }

    /**
     * 修改产品库存
     * 
     * @param productInventory 产品库存
     * @return 结果
     */
    @Override
    public int updateProductInventory(ProductInventory productInventory)
    {
        return productInventoryMapper.updateProductInventory(productInventory);
    }

    /**
     * 批量删除产品库存
     * 
     * @param productIds 需要删除的产品库存主键
     * @return 结果
     */
    @Override
    public int deleteProductInventoryByProductIds(Long[] productIds)
    {
        return productInventoryMapper.deleteProductInventoryByProductIds(productIds);
    }

    /**
     * 删除产品库存信息
     * 
     * @param productId 产品库存主键
     * @return 结果
     */
    @Override
    public int deleteProductInventoryByProductId(Long productId)
    {
        return productInventoryMapper.deleteProductInventoryByProductId(productId);
    }
}
