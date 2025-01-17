package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Work;

/**
 * 作品Mapper接口
 * 
 * @author lazy
 * @date 2025-01-17
 */
public interface WorkMapper 
{
    /**
     * 查询作品
     * 
     * @param workId 作品主键
     * @return 作品
     */
    public Work selectWorkByWorkId(Long workId);

    /**
     * 查询作品列表
     * 
     * @param work 作品
     * @return 作品集合
     */
    public List<Work> selectWorkList(Work work);

    /**
     * 新增作品
     * 
     * @param work 作品
     * @return 结果
     */
    public int insertWork(Work work);

    /**
     * 修改作品
     * 
     * @param work 作品
     * @return 结果
     */
    public int updateWork(Work work);

    /**
     * 删除作品
     * 
     * @param workId 作品主键
     * @return 结果
     */
    public int deleteWorkByWorkId(Long workId);

    /**
     * 批量删除作品
     * 
     * @param workIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWorkByWorkIds(Long[] workIds);
}
