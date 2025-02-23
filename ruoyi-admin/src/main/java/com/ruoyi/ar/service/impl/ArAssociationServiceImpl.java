package com.ruoyi.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.ar.domain.ArContent;
import com.ruoyi.ar.mapper.ArAssociationMapper;
import com.ruoyi.ar.domain.ArAssociation;
import com.ruoyi.ar.service.IArAssociationService;

/**
 * AR内容关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
@Service
public class ArAssociationServiceImpl implements IArAssociationService 
{
    @Autowired
    private ArAssociationMapper arAssociationMapper;

    /**
     * 查询AR内容关联
     * 
     * @param qrCodeId AR内容关联主键
     * @return AR内容关联
     */
    @Override
    public ArAssociation selectArAssociationByQrCodeId(Long qrCodeId)
    {
        return arAssociationMapper.selectArAssociationByQrCodeId(qrCodeId);
    }

    /**
     * 查询AR内容关联列表
     * 
     * @param arAssociation AR内容关联
     * @return AR内容关联
     */
    @Override
    public List<ArAssociation> selectArAssociationList(ArAssociation arAssociation)
    {
        return arAssociationMapper.selectArAssociationList(arAssociation);
    }

    /**
     * 新增AR内容关联
     * 
     * @param arAssociation AR内容关联
     * @return 结果
     */
    @Transactional
    @Override
    public int insertArAssociation(ArAssociation arAssociation)
    {
        int rows = arAssociationMapper.insertArAssociation(arAssociation);
        insertArContent(arAssociation);
        return rows;
    }

    /**
     * 修改AR内容关联
     * 
     * @param arAssociation AR内容关联
     * @return 结果
     */
    @Transactional
    @Override
    public int updateArAssociation(ArAssociation arAssociation)
    {
        arAssociationMapper.deleteArContentByQrCodeId(arAssociation.getQrCodeId());
        insertArContent(arAssociation);
        return arAssociationMapper.updateArAssociation(arAssociation);
    }

    /**
     * 批量删除AR内容关联
     * 
     * @param qrCodeIds 需要删除的AR内容关联主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteArAssociationByQrCodeIds(Long[] qrCodeIds)
    {
        arAssociationMapper.deleteArContentByQrCodeIds(qrCodeIds);
        return arAssociationMapper.deleteArAssociationByQrCodeIds(qrCodeIds);
    }

    /**
     * 删除AR内容关联信息
     * 
     * @param qrCodeId AR内容关联主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteArAssociationByQrCodeId(Long qrCodeId)
    {
        arAssociationMapper.deleteArContentByQrCodeId(qrCodeId);
        return arAssociationMapper.deleteArAssociationByQrCodeId(qrCodeId);
    }

    /**
     * 新增AR内容信息
     * 
     * @param arAssociation AR内容关联对象
     */
    public void insertArContent(ArAssociation arAssociation)
    {
        List<ArContent> arContentList = arAssociation.getArContentList();
        Long qrCodeId = arAssociation.getQrCodeId();
        if (StringUtils.isNotNull(arContentList))
        {
            List<ArContent> list = new ArrayList<ArContent>();
            for (ArContent arContent : arContentList)
            {
                arContent.setQrCodeId(qrCodeId);
                list.add(arContent);
            }
            if (list.size() > 0)
            {
                arAssociationMapper.batchArContent(list);
            }
        }
    }
}
