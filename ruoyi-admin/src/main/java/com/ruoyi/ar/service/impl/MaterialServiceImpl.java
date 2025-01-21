package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ar.mapper.MaterialMapper;
import com.ruoyi.ar.domain.Material;
import com.ruoyi.ar.service.IMaterialService;

/**
 * 材料信息Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-20
 */
@Service
public class MaterialServiceImpl implements IMaterialService 
{
    @Autowired
    private MaterialMapper materialMapper;

    /**
     * 查询材料信息
     * 
     * @param materialId 材料信息主键
     * @return 材料信息
     */
    @Override
    public Material selectMaterialByMaterialId(Long materialId)
    {
        return materialMapper.selectMaterialByMaterialId(materialId);
    }

    /**
     * 查询材料信息列表
     * 
     * @param material 材料信息
     * @return 材料信息
     */
    @Override
    public List<Material> selectMaterialList(Material material)
    {
        return materialMapper.selectMaterialList(material);
    }

    /**
     * 新增材料信息
     * 
     * @param material 材料信息
     * @return 结果
     */
    @Override
    public int insertMaterial(Material material)
    {
        return materialMapper.insertMaterial(material);
    }

    /**
     * 修改材料信息
     * 
     * @param material 材料信息
     * @return 结果
     */
    @Override
    public int updateMaterial(Material material)
    {
        return materialMapper.updateMaterial(material);
    }

    /**
     * 批量删除材料信息
     * 
     * @param materialIds 需要删除的材料信息主键
     * @return 结果
     */
    @Override
    public int deleteMaterialByMaterialIds(Long[] materialIds)
    {
        return materialMapper.deleteMaterialByMaterialIds(materialIds);
    }

    /**
     * 删除材料信息信息
     * 
     * @param materialId 材料信息主键
     * @return 结果
     */
    @Override
    public int deleteMaterialByMaterialId(Long materialId)
    {
        return materialMapper.deleteMaterialByMaterialId(materialId);
    }
}
