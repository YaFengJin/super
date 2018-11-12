package com.example.demo.service.jyf;

import com.example.demo.entity.Talents;

import java.util.List;
import java.util.Map;

public interface TalentsService {
    //查询数据字典
    Map<String,Object>queryDictionariesName();
    //查询招聘计划
    List<Map<String,Object>> queryPlanName();
    //添加人才库
    int saveTalents(Talents talents);
    //查询人才库
    List<Map<String,Object>>queryTalents();
    //修改人才库
    int updateTalents(Talents talents);
    //删除人才库信息
    int deleteTalents( int id);
}
