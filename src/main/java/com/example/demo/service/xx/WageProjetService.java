package com.example.demo.service.xx;

import com.example.demo.entity.Compantpersonage;
import com.example.demo.entity.Wagelevel;
import com.example.demo.entity.Wageproject;

import java.util.List;
import java.util.Map;

public interface WageProjetService {
    /*查询薪酬项目*/
    List<Map> xxWageprojectSelect();
    /*查询薪酬项目类型*/
    List<Map> xxProjecttypeSelect();
    /*添加薪酬项目*/
    int xxWageprojectInsert(Wageproject wageproject, int wid, Integer id);
    /*删除薪酬项目*/
    int xxWageprojectDelete(Wageproject wageproject);
    /*保险系数查询*/
    List<Map> xxCompantpersonageSelect();
    /*更改保险基数*/
    int xxCompantpersonageUpdate(Compantpersonage compantpersonage);
    /*查询工资基础*/
    List<Map> xxWagelevelSelect(Integer userid, String name);
    /*添加工资基础*/
    int xxWagelevelInsert(Wagelevel wagelevel, Integer userIds, int money);
    /*查询薪资计算结果明细*/
    Map xxWageLeavelS(Integer userId, String time);
}
