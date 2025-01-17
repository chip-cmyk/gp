package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WorkMapper;
import com.ruoyi.system.domain.Work;
import com.ruoyi.system.service.IWorkService;

/**
 * 作品Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-17
 */
@Service
public class WorkServiceImpl implements IWorkService 
{
    @Autowired
    private WorkMapper workMapper;

    /**
     * 查询作品
     * 
     * @param workId 作品主键
     * @return 作品
     */
    @Override
    public Work selectWorkByWorkId(Long workId)
    {
        return workMapper.selectWorkByWorkId(workId);
    }

    /**
     * 查询作品列表
     * 
     * @param work 作品
     * @return 作品
     */
    @Override
    public List<Work> selectWorkList(Work work)
    {
        return workMapper.selectWorkList(work);
    }

    /**
     * 新增作品
     * 
     * @param work 作品
     * @return 结果
     */
    @Override
    public int insertWork(Work work)
    {
        return workMapper.insertWork(work);
    }

    /**
     * 修改作品
     * 
     * @param work 作品
     * @return 结果
     */
    @Override
    public int updateWork(Work work)
    {
        return workMapper.updateWork(work);
    }

    /**
     * 批量删除作品
     * 
     * @param workIds 需要删除的作品主键
     * @return 结果
     */
    @Override
    public int deleteWorkByWorkIds(Long[] workIds)
    {
        return workMapper.deleteWorkByWorkIds(workIds);
    }

    /**
     * 删除作品信息
     * 
     * @param workId 作品主键
     * @return 结果
     */
    @Override
    public int deleteWorkByWorkId(Long workId)
    {
        return workMapper.deleteWorkByWorkId(workId);
    }
}
