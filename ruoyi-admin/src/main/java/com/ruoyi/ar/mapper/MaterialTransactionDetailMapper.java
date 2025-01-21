package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.MaterialTransactionDetail;

/**
 * 材料清单明细Mapper接口
 * 
 * @author laazy
 * @date 2025-01-21
 */
public interface MaterialTransactionDetailMapper 
{
    /**
     * 查询材料清单明细
     * 
     * @param materialId 材料清单明细主键
     * @return 材料清单明细
     */
    public MaterialTransactionDetail selectMaterialTransactionDetailByMaterialId(Long materialId);

    /**
     * 查询材料清单明细列表
     * 
     * @param materialTransactionDetail 材料清单明细
     * @return 材料清单明细集合
     */
    public List<MaterialTransactionDetail> selectMaterialTransactionDetailList(MaterialTransactionDetail materialTransactionDetail);

    /**
     * 新增材料清单明细
     * 
     * @param materialTransactionDetail 材料清单明细
     * @return 结果
     */
    public int insertMaterialTransactionDetail(MaterialTransactionDetail materialTransactionDetail);

    /**
     * 修改材料清单明细
     * 
     * @param materialTransactionDetail 材料清单明细
     * @return 结果
     */
    public int updateMaterialTransactionDetail(MaterialTransactionDetail materialTransactionDetail);

    /**
     * 删除材料清单明细
     * 
     * @param materialId 材料清单明细主键
     * @return 结果
     */
    public int deleteMaterialTransactionDetailByMaterialId(Long materialId);

    /**
     * 批量删除材料清单明细
     * 
     * @param materialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialTransactionDetailByMaterialIds(Long[] materialIds);
}
