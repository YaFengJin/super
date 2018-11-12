package com.example.demo.service.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitPlan;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface PlanService {
    //添加招聘计划
    int savePlan(RecruitPlan recruitPlan);
    //查询部门中的用户
    List<Map<String,Object>> queryDeptUser(List<Dept>list);
    //查询招聘计划
    List<Map<String,Object>>queryPlanUser();
    //修改招聘计划
    int updatePlan(RecruitPlan plan);
    //删除招聘计划
    int deletePlan(int id);
    //招聘计划审批(批准)
    int ApplyPlan(int id);
    //招聘计划审批(不批准)
    int ApplyNotPlan(int id);
}
