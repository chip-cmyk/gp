package com.ruoyi.ar.mapper;

import java.util.List;
import com.ruoyi.ar.domain.SandAssociation;
import com.ruoyi.ar.domain.SandboxZone;

/**
 * 二维码_沙盘分区关联Mapper接口
 * 
 * @author lazy
 * @date 2025-03-25
 */
public interface SandAssociationMapper 
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
     * 删除二维码_沙盘分区关联
     * 
     * @param qrCodeId 二维码_沙盘分区关联主键
     * @return 结果
     */
    public int deleteSandAssociationByQrCodeId(Long qrCodeId);

    /**
     * 批量删除二维码_沙盘分区关联
     * 
     * @param qrCodeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSandAssociationByQrCodeIds(Long[] qrCodeIds);

    /**
     * 批量删除沙盘分区
     * 
     * @param qrCodeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSandboxZoneByQrCodeIds(Long[] qrCodeIds);
    
    /**
     * 批量新增沙盘分区
     * 
     * @param sandboxZoneList 沙盘分区列表
     * @return 结果
     */
    public int batchSandboxZone(List<SandboxZone> sandboxZoneList);
    

    /**
     * 通过二维码_沙盘分区关联主键删除沙盘分区信息
     * 
     * @param qrCodeId 二维码_沙盘分区关联ID
     * @return 结果
     */
    public int deleteSandboxZoneByQrCodeId(Long qrCodeId);
}
