package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.ArAssociation;
import com.ruoyi.ar.domain.ArContent;

/**
 * AR内容关联Mapper接口
 * 
 * @author ruoyi
 * @date 2025-02-23
 */
public interface ArAssociationMapper 
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
     * 删除AR内容关联
     * 
     * @param qrCodeId AR内容关联主键
     * @return 结果
     */
    public int deleteArAssociationByQrCodeId(Long qrCodeId);

    /**
     * 批量删除AR内容关联
     * 
     * @param qrCodeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArAssociationByQrCodeIds(Long[] qrCodeIds);

    /**
     * 批量删除AR内容
     * 
     * @param qrCodeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArContentByQrCodeIds(Long[] qrCodeIds);
    
    /**
     * 批量新增AR内容
     * 
     * @param arContentList AR内容列表
     * @return 结果
     */
    public int batchArContent(List<ArContent> arContentList);
    

    /**
     * 通过AR内容关联主键删除AR内容信息
     * 
     * @param qrCodeId AR内容关联ID
     * @return 结果
     */
    public int deleteArContentByQrCodeId(Long qrCodeId);

    /**
     * 检查二维码ID是否有关联的AR内容
     * @param qrCodeId 二维码ID
     * @return 关联的AR内容数量
     */
    int hasArAssociation(Long qrCodeId);
}
