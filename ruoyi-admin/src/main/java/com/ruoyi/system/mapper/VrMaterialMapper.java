package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.VrMaterial;

/**
 * VR素材Mapper接口
 * 
 * @author lazy
 * @date 2025-01-13
 */
public interface VrMaterialMapper 
{
    /**
     * 查询VR素材
     * 
     * @param materialId VR素材主键
     * @return VR素材
     */
    public VrMaterial selectVrMaterialByMaterialId(Long materialId);

    /**
     * 查询VR素材列表
     * 
     * @param vrMaterial VR素材
     * @return VR素材集合
     */
    public List<VrMaterial> selectVrMaterialList(VrMaterial vrMaterial);

    /**
     * 新增VR素材
     * 
     * @param vrMaterial VR素材
     * @return 结果
     */
    public int insertVrMaterial(VrMaterial vrMaterial);

    /**
     * 修改VR素材
     * 
     * @param vrMaterial VR素材
     * @return 结果
     */
    public int updateVrMaterial(VrMaterial vrMaterial);

    /**
     * 删除VR素材
     * 
     * @param materialId VR素材主键
     * @return 结果
     */
    public int deleteVrMaterialByMaterialId(Long materialId);

    /**
     * 批量删除VR素材
     * 
     * @param materialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVrMaterialByMaterialIds(Long[] materialIds);
}
