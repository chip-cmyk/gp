package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CooperationCaseMapper;
import com.ruoyi.system.domain.CooperationCase;
import com.ruoyi.system.service.ICooperationCaseService;

/**
 * 合作案例Service业务层处理
 * 
 * @author lazy
 * @date 2025-01-09
 */
@Service
public class CooperationCaseServiceImpl implements ICooperationCaseService 
{
    @Autowired
    private CooperationCaseMapper cooperationCaseMapper;

    /**
     * 查询合作案例
     * 
     * @param caseId 合作案例主键
     * @return 合作案例
     */
    @Override
    public CooperationCase selectCooperationCaseByCaseId(Long caseId)
    {
        return cooperationCaseMapper.selectCooperationCaseByCaseId(caseId);
    }

    /**
     * 查询合作案例列表
     * 
     * @param cooperationCase 合作案例
     * @return 合作案例
     */
    @Override
    public List<CooperationCase> selectCooperationCaseList(CooperationCase cooperationCase)
    {
        return cooperationCaseMapper.selectCooperationCaseList(cooperationCase);
    }

    /**
     * 新增合作案例
     * 
     * @param cooperationCase 合作案例
     * @return 结果
     */
    @Override
    public int insertCooperationCase(CooperationCase cooperationCase)
    {
        return cooperationCaseMapper.insertCooperationCase(cooperationCase);
    }

    /**
     * 修改合作案例
     * 
     * @param cooperationCase 合作案例
     * @return 结果
     */
    @Override
    public int updateCooperationCase(CooperationCase cooperationCase)
    {
        return cooperationCaseMapper.updateCooperationCase(cooperationCase);
    }

    /**
     * 批量删除合作案例
     * 
     * @param caseIds 需要删除的合作案例主键
     * @return 结果
     */
    @Override
    public int deleteCooperationCaseByCaseIds(Long[] caseIds)
    {
        return cooperationCaseMapper.deleteCooperationCaseByCaseIds(caseIds);
    }

    /**
     * 删除合作案例信息
     * 
     * @param caseId 合作案例主键
     * @return 结果
     */
    @Override
    public int deleteCooperationCaseByCaseId(Long caseId)
    {
        return cooperationCaseMapper.deleteCooperationCaseByCaseId(caseId);
    }
}
