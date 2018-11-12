package com.example.demo.service.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitHire;

import java.util.List;
import java.util.Map;

public interface HireService {
    //查询部门
    List<Map<String,Object>> queryDeptOne(String deptids);
    //查询员工类型
    List<Map<String,Object>>queryEmpType();
    //新增招聘录用
    int saveRecruitHire(RecruitHire hire);
    //查询招聘录用
    List<Map<String,Object>>queryRecruitHire();
    //修改招聘录用
    int updateRecruitHire(RecruitHire recruitHire);
}
