package com.ruoyi.quartz.task;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Mytask {
    /**
     * 执行一个定时任务的方法
     *
     * 该方法输出当前日期和时间，表明定时任务开始执行
     * 主要用途是进行一些需要周期性执行的操作
     */
    public void showTime()
    {
        // 输出当前日期和时间，表明定时任务开始执行
        System.out.println("定时任务开始执行：" + new Date());
    }
}
