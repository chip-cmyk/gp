package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.MaterialTransaction;

/**
 * 材料出入库单Service接口
 * 
 * @author laazy
 * @date 2025-01-20
 */
public interface IMaterialTransactionService 
{
    /**
     * 查询材料出入库单
     * 
     * @param transactionId 材料出入库单主键
     * @return 材料出入库单
     */
    public MaterialTransaction selectMaterialTransactionByTransactionId(Long transactionId);

    /**
     * 查询材料出入库单列表
     * 
     * @param materialTransaction 材料出入库单
     * @return 材料出入库单集合
     */
    public List<MaterialTransaction> selectMaterialTransactionList(MaterialTransaction materialTransaction);

    /**
     * 新增材料出入库单
     * 
     * @param materialTransaction 材料出入库单
     * @return 结果
     */
    public int insertMaterialTransaction(MaterialTransaction materialTransaction);

    /**
     * 修改材料出入库单
     * 
     * @param materialTransaction 材料出入库单
     * @return 结果
     */
    public int updateMaterialTransaction(MaterialTransaction materialTransaction);

    /**
     * 批量删除材料出入库单
     * 
     * @param transactionIds 需要删除的材料出入库单主键集合
     * @return 结果
     */
    public int deleteMaterialTransactionByTransactionIds(Long[] transactionIds);

    /**
     * 删除材料出入库单信息
     * 
     * @param transactionId 材料出入库单主键
     * @return 结果
     */
    public int deleteMaterialTransactionByTransactionId(Long transactionId);
}
