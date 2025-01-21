package com.ruoyi.school.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.VrMaterialMapper;
import com.ruoyi.school.domain.VrMaterial;
import com.ruoyi.school.service.IVrMaterialService;

/**
 * VR素材Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-21
 */
@Service
public class VrMaterialServiceImpl implements IVrMaterialService 
{
    @Autowired
    private VrMaterialMapper vrMaterialMapper;

    /**
     * 查询VR素材
     * 
     * @param vrMaterialId VR素材主键
     * @return VR素材
     */
    @Override
    public VrMaterial selectVrMaterialByVrMaterialId(Long vrMaterialId)
    {
        return vrMaterialMapper.selectVrMaterialByVrMaterialId(vrMaterialId);
    }

    /**
     * 查询VR素材列表
     * 
     * @param vrMaterial VR素材
     * @return VR素材
     */
    @Override
    public List<VrMaterial> selectVrMaterialList(VrMaterial vrMaterial)
    {
        return vrMaterialMapper.selectVrMaterialList(vrMaterial);
    }

    /**
     * 新增VR素材
     * 
     * @param vrMaterial VR素材
     * @return 结果
     */
    @Override
    public int insertVrMaterial(VrMaterial vrMaterial)
    {
        return vrMaterialMapper.insertVrMaterial(vrMaterial);
    }

    /**
     * 修改VR素材
     * 
     * @param vrMaterial VR素材
     * @return 结果
     */
    @Override
    public int updateVrMaterial(VrMaterial vrMaterial)
    {
        return vrMaterialMapper.updateVrMaterial(vrMaterial);
    }

    /**
     * 批量删除VR素材
     * 
     * @param vrMaterialIds 需要删除的VR素材主键
     * @return 结果
     */
    @Override
    public int deleteVrMaterialByVrMaterialIds(Long[] vrMaterialIds)
    {
        return vrMaterialMapper.deleteVrMaterialByVrMaterialIds(vrMaterialIds);
    }

    /**
     * 删除VR素材信息
     * 
     * @param vrMaterialId VR素材主键
     * @return 结果
     */
    @Override
    public int deleteVrMaterialByVrMaterialId(Long vrMaterialId)
    {
        return vrMaterialMapper.deleteVrMaterialByVrMaterialId(vrMaterialId);
    }
}
