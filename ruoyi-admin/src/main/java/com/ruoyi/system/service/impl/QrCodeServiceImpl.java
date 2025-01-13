package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.QrCodeMapper;
import com.ruoyi.system.domain.QrCode;
import com.ruoyi.system.service.IQrCodeService;

/**
 * 二维码Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-13
 */
@Service
public class QrCodeServiceImpl implements IQrCodeService 
{
    @Autowired
    private QrCodeMapper qrCodeMapper;

    /**
     * 查询二维码
     * 
     * @param qrCodeId 二维码主键
     * @return 二维码
     */
    @Override
    public QrCode selectQrCodeByQrCodeId(Long qrCodeId)
    {
        return qrCodeMapper.selectQrCodeByQrCodeId(qrCodeId);
    }

    /**
     * 查询二维码列表
     * 
     * @param qrCode 二维码
     * @return 二维码
     */
    @Override
    public List<QrCode> selectQrCodeList(QrCode qrCode)
    {
        return qrCodeMapper.selectQrCodeList(qrCode);
    }

    /**
     * 新增二维码
     * 
     * @param qrCode 二维码
     * @return 结果
     */
    @Override
    public int insertQrCode(QrCode qrCode)
    {
        return qrCodeMapper.insertQrCode(qrCode);
    }

    /**
     * 修改二维码
     * 
     * @param qrCode 二维码
     * @return 结果
     */
    @Override
    public int updateQrCode(QrCode qrCode)
    {
        return qrCodeMapper.updateQrCode(qrCode);
    }

    /**
     * 批量删除二维码
     * 
     * @param qrCodeIds 需要删除的二维码主键
     * @return 结果
     */
    @Override
    public int deleteQrCodeByQrCodeIds(Long[] qrCodeIds)
    {
        return qrCodeMapper.deleteQrCodeByQrCodeIds(qrCodeIds);
    }

    /**
     * 删除二维码信息
     * 
     * @param qrCodeId 二维码主键
     * @return 结果
     */
    @Override
    public int deleteQrCodeByQrCodeId(Long qrCodeId)
    {
        return qrCodeMapper.deleteQrCodeByQrCodeId(qrCodeId);
    }
}
