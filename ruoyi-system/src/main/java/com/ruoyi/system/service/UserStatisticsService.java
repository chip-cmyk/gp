package com.ruoyi.system.service;

import com.ruoyi.system.domain.dto.MonthlyRegistrationsDTO;
import com.ruoyi.system.mapper.UserStatisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserStatisticsService implements IUserStatisticsService {
    @Autowired
    private UserStatisticsMapper userStatisticsMapper;

    @Override
    public List<MonthlyRegistrationsDTO> getMonthlyRegistrations(LocalDate startDate, LocalDate endDate) {
        // 1. 查询数据库获取实际数据
        List<MonthlyRegistrationsDTO> dbData = userStatisticsMapper.selectMonthlyRegistrations(
                startDate.withDayOfMonth(1),  // 确保从当月第一天开始
                endDate.withDayOfMonth(endDate.lengthOfMonth())  // 确保到当月最后一天
        );

        // 2. 生成完整的时间范围月份列表
        List<String> allMonths = generateMonthRange(startDate, endDate);

        // 3. 合并数据，补全缺失月份
        return mergeData(allMonths, dbData);
    }

    // 生成月份范围列表（私有方法）
    private List<String> generateMonthRange(LocalDate startDate, LocalDate endDate) {
        List<String> months = new ArrayList<>();
        LocalDate current = startDate.withDayOfMonth(1);
        while (!current.isAfter(endDate)) {
            months.add(current.format(DateTimeFormatter.ofPattern("yyyy-MM")));
            current = current.plusMonths(1);
        }
        return months;
    }

    // 合并数据并补全缺失月份（私有方法）
    private List<MonthlyRegistrationsDTO> mergeData(List<String> allMonths, List<MonthlyRegistrationsDTO> dbData) {
        Map<String, Integer> dataMap = dbData.stream()
                .collect(Collectors.toMap(
                        MonthlyRegistrationsDTO::getYearMonth,
                        MonthlyRegistrationsDTO::getCount
                ));

        return allMonths.stream()
                .map(month -> new MonthlyRegistrationsDTO(month, dataMap.getOrDefault(month, 0)))
                .collect(Collectors.toList());
    }
}