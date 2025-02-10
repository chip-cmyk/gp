package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.ar.domain.MaterialTransactionDetail;
import com.ruoyi.ar.mapper.MaterialTransactionMapper;
import com.ruoyi.ar.domain.MaterialTransaction;
import com.ruoyi.ar.service.IMaterialTransactionService;

/**
 * 材料出入库单Service业务层处理
 * 
 * @author laazy
 * @date 2025-02-06
 */
@Service
public class MaterialTransactionServiceImpl implements IMaterialTransactionService 
{
    @Autowired
    private MaterialTransactionMapper materialTransactionMapper;

    /**
     * 查询材料出入库单
     * 
     * @param transactionId 材料出入库单主键
     * @return 材料出入库单
     */
    @Override
    public MaterialTransaction selectMaterialTransactionByTransactionId(Long transactionId)
    {
        return materialTransactionMapper.selectMaterialTransactionByTransactionId(transactionId);
    }

    /**
     * 查询材料出入库单列表
     * 
     * @param materialTransaction 材料出入库单
     * @return 材料出入库单
     */
    @Override
    public List<MaterialTransaction> selectMaterialTransactionList(MaterialTransaction materialTransaction)
    {
        return materialTransactionMapper.selectMaterialTransactionList(materialTransaction);
    }

    /**
     * 新增材料出入库单
     * 
     * @param materialTransaction 材料出入库单
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMaterialTransaction(MaterialTransaction materialTransaction)
    {
        int rows = materialTransactionMapper.insertMaterialTransaction(materialTransaction);
        insertMaterialTransactionDetail(materialTransaction);
        return rows;
    }

    /**
     * 修改材料出入库单
     * 
     * @param materialTransaction 材料出入库单
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMaterialTransaction(MaterialTransaction materialTransaction)
    {
        materialTransactionMapper.deleteMaterialTransactionDetailByTransactionId(materialTransaction.getTransactionId());
        insertMaterialTransactionDetail(materialTransaction);
        return materialTransactionMapper.updateMaterialTransaction(materialTransaction);
    }

    /**
     * 批量删除材料出入库单
     * 
     * @param transactionIds 需要删除的材料出入库单主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMaterialTransactionByTransactionIds(Long[] transactionIds)
    {
//        materialTransactionMapper.deleteMaterialTransactionDetailByTransactionIds(transactionIds);
        return materialTransactionMapper.deleteMaterialTransactionByTransactionIds(transactionIds);
    }

    /**
     * 删除材料出入库单信息
     * 
     * @param transactionId 材料出入库单主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMaterialTransactionByTransactionId(Long transactionId)
    {
//        materialTransactionMapper.deleteMaterialTransactionDetailByTransactionId(transactionId);
        return materialTransactionMapper.deleteMaterialTransactionByTransactionId(transactionId);
    }

    /**
     * 新增材料清单明细信息
     * 
     * @param materialTransaction 材料出入库单对象
     */
    public void insertMaterialTransactionDetail(MaterialTransaction materialTransaction)
    {
        List<MaterialTransactionDetail> materialTransactionDetailList = materialTransaction.getMaterialTransactionDetailList();
        Long transactionId = materialTransaction.getTransactionId();
        if (StringUtils.isNotNull(materialTransactionDetailList))
        {
            List<MaterialTransactionDetail> list = new ArrayList<MaterialTransactionDetail>();
            for (MaterialTransactionDetail materialTransactionDetail : materialTransactionDetailList)
            {
                materialTransactionDetail.setTransactionId(transactionId);
                list.add(materialTransactionDetail);
            }
            if (list.size() > 0)
            {
                materialTransactionMapper.batchMaterialTransactionDetail(list);
            }
        }
    }
}
