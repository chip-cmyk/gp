package com.ruoyi.ar.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ar.domain.QrCode;
import com.ruoyi.ar.service.IQrCodeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.ar.service.IArAssociationService;

/**
 * 二维码Controller
 *
 * @author lazy
 * @date 2025-01-25
 */
@RestController
@RequestMapping("/ar/code")
public class QrCodeController extends BaseController {
    @Autowired
    private IQrCodeService qrCodeService;

    @Autowired
    private IArAssociationService arAssociationService;

    /**
     * 查询二维码列表
     */
    @PreAuthorize("@ss.hasPermi('ar:code:list')")
    @GetMapping("/list")
    public TableDataInfo list(QrCode qrCode) {
        startPage();
        List<QrCode> list = qrCodeService.selectQrCodeList(qrCode);
        return getDataTable(list);
    }

    /**
     * 导出二维码列表
     */
    @PreAuthorize("@ss.hasPermi('ar:code:export')")
    @Log(title = "二维码", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, QrCode qrCode) {
        List<QrCode> list = qrCodeService.selectQrCodeList(qrCode);
        ExcelUtil<QrCode> util = new ExcelUtil<QrCode>(QrCode.class);
        util.exportExcel(response, list, "二维码数据");
    }

    /**
     * 获取二维码详细信息
     */
    @PreAuthorize("@ss.hasPermi('ar:code:query')")
    @GetMapping(value = "/{qrCodeId}")
    public AjaxResult getInfo(@PathVariable("qrCodeId") Long qrCodeId) {
        return success(qrCodeService.selectQrCodeByQrCodeId(qrCodeId));
    }

    /**
     * 新增二维码
     */
    @PreAuthorize("@ss.hasPermi('ar:code:add')")
    @Log(title = "二维码", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody QrCode qrCode) {
        return toAjax(qrCodeService.insertQrCode(qrCode));
    }

    /**
     * 修改二维码
     */
    @PreAuthorize("@ss.hasPermi('ar:code:edit')")
    @Log(title = "二维码", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody QrCode qrCode) {
        return toAjax(qrCodeService.updateQrCode(qrCode));
    }

    /**
     * 检查二维码是否在使用中
     *
     * @param qrCodeIds 二维码ID数组
     * @return 是否在使用中
     */
    private boolean isQrCodeInUse(Long[] qrCodeIds) {
        for (Long qrCodeId : qrCodeIds) {
            QrCode qrCode = qrCodeService.selectQrCodeByQrCodeId(qrCodeId);
            try {
                if (arAssociationService.hasArAssociation(qrCodeId)) { // 使用ArAssociationService检查关联
                    qrCode.setUsageStatus("1"); // 如果有关联，就设置为1，不给删
                    return true; // 如果有任何一个二维码关联了AR内容，返回true
                }
            } catch (Exception e) {
                qrCode.setUsageStatus("0"); // 设置状态为0，表示未关联
                // 记录日志或进行其他处理
                e.printStackTrace();
                return false;
            }
        }
        return false; // 如果所有二维码都没有关联，返回false。
    }



    /**
     * 删除二维码
     */
    @PreAuthorize("@ss.hasPermi('ar:code:remove')")
    @Log(title = "二维码", businessType = BusinessType.DELETE)
    @DeleteMapping("/{qrCodeIds}")
    public AjaxResult remove(@PathVariable Long[] qrCodeIds) {
        // 检查二维码是否在使用中
        if (isQrCodeInUse(qrCodeIds)) {
            return AjaxResult.error("存在正在使用的二维码，无法删除");
        }
        return toAjax(qrCodeService.deleteQrCodeByQrCodeIds(qrCodeIds));
    }

}
