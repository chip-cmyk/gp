package com.ruoyi.system.service;

import com.ruoyi.system.domain.dto.MonthlyRegistrationsDTO;

import java.time.LocalDate;
import java.util.List;

/**
 * 用户统计服务接口
 */
public interface IUserStatisticsService {
    /**
     * 获取指定时间范围内的月度注册数据（自动补全缺失月份）
     *
     * @param startDate 开始日期（包含）
     * @param endDate   结束日期（包含）
     * @return 按月统计的注册数据列表
     */
    List<MonthlyRegistrationsDTO> getMonthlyRegistrations(LocalDate startDate, LocalDate endDate);
}