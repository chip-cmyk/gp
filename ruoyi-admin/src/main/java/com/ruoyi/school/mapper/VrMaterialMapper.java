package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.VrMaterial;

/**
 * VR素材Mapper接口
 * 
 * @author lazy
 * @date 2025-01-21
 */
public interface VrMaterialMapper 
{
    /**
     * 查询VR素材
     * 
     * @param vrMaterialId VR素材主键
     * @return VR素材
     */
    public VrMaterial selectVrMaterialByVrMaterialId(Long vrMaterialId);

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
     * @param vrMaterialId VR素材主键
     * @return 结果
     */
    public int deleteVrMaterialByVrMaterialId(Long vrMaterialId);

    /**
     * 批量删除VR素材
     * 
     * @param vrMaterialIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVrMaterialByVrMaterialIds(Long[] vrMaterialIds);
}
