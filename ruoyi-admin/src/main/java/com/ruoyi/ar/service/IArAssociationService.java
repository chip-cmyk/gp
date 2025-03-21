package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.ArAssociation;

/**
 * AR内容关联Service接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface IArAssociationService 
{
    /**
     * 查询AR内容关联
     * 
     * @param qrCodeId AR内容关联主键
     * @return AR内容关联
     */
    public ArAssociation selectArAssociationByQrCodeId(Long qrCodeId);

    /**
     * 查询AR内容关联列表
     * 
     * @param arAssociation AR内容关联
     * @return AR内容关联集合
     */
    public List<ArAssociation> selectArAssociationList(ArAssociation arAssociation);

    /**
     * 新增AR内容关联
     * 
     * @param arAssociation AR内容关联
     * @return 结果
     */
    public int insertArAssociation(ArAssociation arAssociation);

    /**
     * 修改AR内容关联
     * 
     * @param arAssociation AR内容关联
     * @return 结果
     */
    public int updateArAssociation(ArAssociation arAssociation);

    /**
     * 批量删除AR内容关联
     * 
     * @param qrCodeIds 需要删除的AR内容关联主键集合
     * @return 结果
     */
    public int deleteArAssociationByQrCodeIds(Long[] qrCodeIds);

    /**
     * 删除AR内容关联信息
     * 
     * @param qrCodeId AR内容关联主键
     * @return 结果
     */
    public int deleteArAssociationByQrCodeId(Long qrCodeId);

    boolean hasArAssociation(Long qrCodeId);
}
