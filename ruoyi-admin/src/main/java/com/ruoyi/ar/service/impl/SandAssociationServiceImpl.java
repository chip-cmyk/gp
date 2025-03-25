package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.ar.domain.SandboxZone;
import com.ruoyi.ar.mapper.SandAssociationMapper;
import com.ruoyi.ar.domain.SandAssociation;
import com.ruoyi.ar.service.ISandAssociationService;

/**
 * 二维码_沙盘分区关联Service业务层处理
 * 
 * @author lazy
 * @date 2025-03-25
 */
@Service
public class SandAssociationServiceImpl implements ISandAssociationService 
{
    @Autowired
    private SandAssociationMapper sandAssociationMapper;

    /**
     * 查询二维码_沙盘分区关联
     * 
     * @param qrCodeId 二维码_沙盘分区关联主键
     * @return 二维码_沙盘分区关联
     */
    @Override
    public SandAssociation selectSandAssociationByQrCodeId(Long qrCodeId)
    {
        return sandAssociationMapper.selectSandAssociationByQrCodeId(qrCodeId);
    }

    /**
     * 查询二维码_沙盘分区关联列表
     * 
     * @param sandAssociation 二维码_沙盘分区关联
     * @return 二维码_沙盘分区关联
     */
    @Override
    public List<SandAssociation> selectSandAssociationList(SandAssociation sandAssociation)
    {
        return sandAssociationMapper.selectSandAssociationList(sandAssociation);
    }

    /**
     * 新增二维码_沙盘分区关联
     * 
     * @param sandAssociation 二维码_沙盘分区关联
     * @return 结果
     */
    @Transactional
    @Override
    public int insertSandAssociation(SandAssociation sandAssociation)
    {
        int rows = sandAssociationMapper.insertSandAssociation(sandAssociation);
        insertSandboxZone(sandAssociation);
        return rows;
    }

    /**
     * 修改二维码_沙盘分区关联
     * 
     * @param sandAssociation 二维码_沙盘分区关联
     * @return 结果
     */
    @Transactional
    @Override
    public int updateSandAssociation(SandAssociation sandAssociation)
    {
        sandAssociationMapper.deleteSandboxZoneByQrCodeId(sandAssociation.getQrCodeId());
        insertSandboxZone(sandAssociation);
        return sandAssociationMapper.updateSandAssociation(sandAssociation);
    }

    /**
     * 批量删除二维码_沙盘分区关联
     * 
     * @param qrCodeIds 需要删除的二维码_沙盘分区关联主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSandAssociationByQrCodeIds(Long[] qrCodeIds)
    {
        sandAssociationMapper.deleteSandboxZoneByQrCodeIds(qrCodeIds);
        return sandAssociationMapper.deleteSandAssociationByQrCodeIds(qrCodeIds);
    }

    /**
     * 删除二维码_沙盘分区关联信息
     * 
     * @param qrCodeId 二维码_沙盘分区关联主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSandAssociationByQrCodeId(Long qrCodeId)
    {
        sandAssociationMapper.deleteSandboxZoneByQrCodeId(qrCodeId);
        return sandAssociationMapper.deleteSandAssociationByQrCodeId(qrCodeId);
    }

    /**
     * 新增沙盘分区信息
     * 
     * @param sandAssociation 二维码_沙盘分区关联对象
     */
    public void insertSandboxZone(SandAssociation sandAssociation)
    {
        List<SandboxZone> sandboxZoneList = sandAssociation.getSandboxZoneList();
        Long qrCodeId = sandAssociation.getQrCodeId();
        if (StringUtils.isNotNull(sandboxZoneList))
        {
            List<SandboxZone> list = new ArrayList<SandboxZone>();
            for (SandboxZone sandboxZone : sandboxZoneList)
            {
                sandboxZone.setQrCodeId(qrCodeId);
                list.add(sandboxZone);
            }
            if (list.size() > 0)
            {
                sandAssociationMapper.batchSandboxZone(list);
            }
        }
    }
}
