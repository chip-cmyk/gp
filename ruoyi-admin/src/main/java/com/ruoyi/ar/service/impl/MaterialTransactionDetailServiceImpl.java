package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.MaterialTransactionDetailMapper;
import com.ruoyi.ar.domain.MaterialTransactionDetail;
import com.ruoyi.ar.service.IMaterialTransactionDetailService;

/**
 * 材料清单明细Service业务层处理
 * 
 * @author laazy
 * @date 2025-01-21
 */
@Service
public class MaterialTransactionDetailServiceImpl implements IMaterialTransactionDetailService 
{
    @Autowired
    private MaterialTransactionDetailMapper materialTransactionDetailMapper;

    /**
     * 查询材料清单明细
     * 
     * @param materialId 材料清单明细主键
     * @return 材料清单明细
     */
    @Override
    public MaterialTransactionDetail selectMaterialTransactionDetailByMaterialId(Long materialId)
    {
        return materialTransactionDetailMapper.selectMaterialTransactionDetailByMaterialId(materialId);
    }

    /**
     * 查询材料清单明细列表
     * 
     * @param materialTransactionDetail 材料清单明细
     * @return 材料清单明细
     */
    @Override
    public List<MaterialTransactionDetail> selectMaterialTransactionDetailList(MaterialTransactionDetail materialTransactionDetail)
    {
        return materialTransactionDetailMapper.selectMaterialTransactionDetailList(materialTransactionDetail);
    }

    /**
     * 新增材料清单明细
     * 
     * @param materialTransactionDetail 材料清单明细
     * @return 结果
     */
    @Override
    public int insertMaterialTransactionDetail(MaterialTransactionDetail materialTransactionDetail)
    {
        return materialTransactionDetailMapper.insertMaterialTransactionDetail(materialTransactionDetail);
    }

    /**
     * 修改材料清单明细
     * 
     * @param materialTransactionDetail 材料清单明细
     * @return 结果
     */
    @Override
    public int updateMaterialTransactionDetail(MaterialTransactionDetail materialTransactionDetail)
    {
        return materialTransactionDetailMapper.updateMaterialTransactionDetail(materialTransactionDetail);
    }

    /**
     * 批量删除材料清单明细
     * 
     * @param materialIds 需要删除的材料清单明细主键
     * @return 结果
     */
    @Override
    public int deleteMaterialTransactionDetailByMaterialIds(Long[] materialIds)
    {
        return materialTransactionDetailMapper.deleteMaterialTransactionDetailByMaterialIds(materialIds);
    }

    /**
     * 删除材料清单明细信息
     * 
     * @param materialId 材料清单明细主键
     * @return 结果
     */
    @Override
    public int deleteMaterialTransactionDetailByMaterialId(Long materialId)
    {
        return materialTransactionDetailMapper.deleteMaterialTransactionDetailByMaterialId(materialId);
    }
}
