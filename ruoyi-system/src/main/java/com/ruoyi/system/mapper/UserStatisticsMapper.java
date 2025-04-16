package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.dto.MonthlyRegistrationsDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface UserStatisticsMapper {
    List<MonthlyRegistrationsDTO> selectMonthlyRegistrations(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate);
}