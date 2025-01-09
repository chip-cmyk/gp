package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.CooperationCase;

/**
 * 合作案例Mapper接口
 * 
 * @author lazy
 * @date 2025-01-09
 */
public interface CooperationCaseMapper 
{
    /**
     * 查询合作案例
     * 
     * @param caseId 合作案例主键
     * @return 合作案例
     */
    public CooperationCase selectCooperationCaseByCaseId(Long caseId);

    /**
     * 查询合作案例列表
     * 
     * @param cooperationCase 合作案例
     * @return 合作案例集合
     */
    public List<CooperationCase> selectCooperationCaseList(CooperationCase cooperationCase);

    /**
     * 新增合作案例
     * 
     * @param cooperationCase 合作案例
     * @return 结果
     */
    public int insertCooperationCase(CooperationCase cooperationCase);

    /**
     * 修改合作案例
     * 
     * @param cooperationCase 合作案例
     * @return 结果
     */
    public int updateCooperationCase(CooperationCase cooperationCase);

    /**
     * 删除合作案例
     * 
     * @param caseId 合作案例主键
     * @return 结果
     */
    public int deleteCooperationCaseByCaseId(Long caseId);

    /**
     * 批量删除合作案例
     * 
     * @param caseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCooperationCaseByCaseIds(Long[] caseIds);
}
