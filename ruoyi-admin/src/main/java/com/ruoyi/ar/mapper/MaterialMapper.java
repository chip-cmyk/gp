package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.Material;

/**
 * 材料信息Mapper接口
 * 
 * @author lazy
 * @date 2025-01-20
 */
public interface MaterialMapper 
{
    /**
     * 查询材料信息
     * 
     * @param materialId 材料信息主键
     * @return 材料信息
     */
    public Material selectMaterialByMaterialId(Long materialId);

    /**
     * 查询材料信息列表
     * 
     * @param material 材料信息
     * @return 材料信息集合
     */
    public List<Material> selectMaterialList(Material material);

    /**
     * 新增材料信息
     * 
     * @param material 材料信息
     * @return 结果
     */
    public int insertMaterial(Material material);

    /**
     * 修改材料信息
     * 
     * @param material 材料信息
     * @return 结果
     */
    public int updateMaterial(Material material);

    /**
     * 删除材料信息
     * 
     * @param materialId 材料信息主键
     * @return 结果
     */
    public int deleteMaterialByMaterialId(Long materialId);

    /**
     * 批量删除材料信息
     * 
     * @param materialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMaterialByMaterialIds(Long[] materialIds);
}
