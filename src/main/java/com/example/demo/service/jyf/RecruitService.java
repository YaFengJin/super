package com.example.demo.service.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitNeed;
import java.util.List;
import java.util.Map;

public interface RecruitService {
    //新建招聘需求
     int saveRecruit_Need(RecruitNeed r);
    //查询部门
     List<Map<String,Object>> queryDept();
    //添加部门时查询部门名称
     String[] queryDeptName(List<Dept>list);
    //查询招聘需求
     List<Map<String,Object>>queryRecruit_Need( String begintime, String endtime);
     //修改招聘需求
     int updateRecruit_Need(RecruitNeed r);
    //编辑时查询部门
    List<Map<String,Object>> queryDept1(int id);
    //删除招聘需求
    int deleteRecruit_Need(int id);
    //查看部门里的所有人员
    Map<String,Object>queryDeptNameIds(String deptid);
}
