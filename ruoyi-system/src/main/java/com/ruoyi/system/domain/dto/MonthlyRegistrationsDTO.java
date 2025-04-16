package com.ruoyi.system.domain.dto;

public class MonthlyRegistrationsDTO {
    private String yearMonth;  // 格式如 "2024-01"
    private Integer count;     // 该月注册人数

    public MonthlyRegistrationsDTO() {
    }

    public MonthlyRegistrationsDTO(String yearMonth, Integer count) {
        this.yearMonth = yearMonth;
        this.count = count;
    }

    public String getYearMonth() {
        return yearMonth;
    }

    public void setYearMonth(String yearMonth) {
        this.yearMonth = yearMonth;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}