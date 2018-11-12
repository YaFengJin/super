package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.TalentsDao;
import com.example.demo.entity.Talents;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class TalentsServiceImpl implements  TalentsService {
    @Autowired
    private TalentsDao dao;

    @Override
    public Map<String, Object> queryDictionariesName() {
        List<Map<String, Object>> maps = dao.queryDictionariesName1();
        List<Map<String, Object>> maps1 = dao.queryDictionariesName2();
        List<Map<String, Object>> maps2 = dao.queryDictionariesName3();
        Map<String,Object>map=new HashMap<>();
        map.put("Name1",maps);
        map.put("Name2",maps1);
        map.put("Name3",maps2);
        return map;
    }

    @Override
    public List<Map<String, Object>> queryPlanName() {
        List<Map<String, Object>> maps3 = dao.queryPlanName();
        return maps3;
    }

    @Override
    public int saveTalents(Talents talents) {
        return dao.saveTalents(talents);
    }

    @Override
    public List<Map<String, Object>> queryTalents() {
        return dao.queryTalents();
    }

    @Override
    public int updateTalents(Talents talents) {
        return dao.updateTalents(talents);
    }

    @Override
    public int deleteTalents(int id) {
        return dao.deleteTalents(id);
    }
}
