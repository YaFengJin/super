package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.PlanDao;
import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PlanServiceImpl implements  PlanService {
    @Autowired
    private PlanDao dao;
    @Override
    public int savePlan(RecruitPlan recruitPlan) {
        return dao.savePlan(recruitPlan);
    }

    @Override
    public List<Map<String, Object>> queryDeptUser(List<Dept> list) {
        return dao.queryDpetUser(list);
    }

    @Override
    public List<Map<String, Object>> queryPlanUser() {
        return dao.queryPlanUser();
    }

    @Override
    public int updatePlan(RecruitPlan plan) {
        return dao.updatePlan(plan);
    }

    @Override
    public int deletePlan(int id) {
        return dao.deletePlan(id);
    }

    @Override
    public int ApplyPlan(int id) {
        return dao.ApplyPlan(id);
    }

    @Override
    public int ApplyNotPlan(int id) {
        return dao.ApplyNotPlan(id);
    }
}
