package com.ruoyi.ar.service;

import java.util.List;
import com.ruoyi.ar.domain.QrCode;

/**
 * 二维码Service接口
 * 
 * @author lazy
 * @date 2025-01-25
 */
public interface IQrCodeService 
{
    /**
     * 查询二维码
     * 
     * @param qrCodeId 二维码主键
     * @return 二维码
     */
    public QrCode selectQrCodeByQrCodeId(Long qrCodeId);

    /**
     * 查询二维码列表
     * 
     * @param qrCode 二维码
     * @return 二维码集合
     */
    public List<QrCode> selectQrCodeList(QrCode qrCode);

    /**
     * 新增二维码
     * 
     * @param qrCode 二维码
     * @return 结果
     */
    public int insertQrCode(QrCode qrCode);

    /**
     * 修改二维码
     * 
     * @param qrCode 二维码
     * @return 结果
     */
    public int updateQrCode(QrCode qrCode);

    /**
     * 批量删除二维码
     * 
     * @param qrCodeIds 需要删除的二维码主键集合
     * @return 结果
     */
    public int deleteQrCodeByQrCodeIds(Long[] qrCodeIds);

    /**
     * 删除二维码信息
     * 
     * @param qrCodeId 二维码主键
     * @return 结果
     */
    public int deleteQrCodeByQrCodeId(Long qrCodeId);
}
