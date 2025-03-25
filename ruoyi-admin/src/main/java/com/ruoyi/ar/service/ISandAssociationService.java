package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.SandAssociation;

/**
 * 二维码_沙盘分区关联Service接口
 * 
 * @author lazy
 * @date 2025-03-25
 */
public interface ISandAssociationService 
{
    /**
     * 查询二维码_沙盘分区关联
     * 
     * @param qrCodeId 二维码_沙盘分区关联主键
     * @return 二维码_沙盘分区关联
     */
    public SandAssociation selectSandAssociationByQrCodeId(Long qrCodeId);

    /**
     * 查询二维码_沙盘分区关联列表
     * 
     * @param sandAssociation 二维码_沙盘分区关联
     * @return 二维码_沙盘分区关联集合
     */
    public List<SandAssociation> selectSandAssociationList(SandAssociation sandAssociation);

    /**
     * 新增二维码_沙盘分区关联
     * 
     * @param sandAssociation 二维码_沙盘分区关联
     * @return 结果
     */
    public int insertSandAssociation(SandAssociation sandAssociation);

    /**
     * 修改二维码_沙盘分区关联
     * 
     * @param sandAssociation 二维码_沙盘分区关联
     * @return 结果
     */
    public int updateSandAssociation(SandAssociation sandAssociation);

    /**
     * 批量删除二维码_沙盘分区关联
     * 
     * @param qrCodeIds 需要删除的二维码_沙盘分区关联主键集合
     * @return 结果
     */
    public int deleteSandAssociationByQrCodeIds(Long[] qrCodeIds);

    /**
     * 删除二维码_沙盘分区关联信息
     * 
     * @param qrCodeId 二维码_沙盘分区关联主键
     * @return 结果
     */
    public int deleteSandAssociationByQrCodeId(Long qrCodeId);
}
