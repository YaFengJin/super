package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.RecruitDao;
import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitNeed;
import com.example.demo.util.deptTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecruitServiceImpl implements  RecruitService {
    @Autowired
    private RecruitDao dao;
    @Override
    public int saveRecruit_Need(RecruitNeed r) {
        return dao.saveRecruit_Need(r);
    }

    @Override
    public List<Map<String, Object>> queryDept() {
        deptTree d=new deptTree();
        List<Map<String, Object>> maps = dao.queryDept();
        List<Map<String,Object>>list=d.deptList(maps);
        return list;
    }

    @Override
    public String[] queryDeptName(List<Dept> list) {
        return dao.queryDeptName(list);
    }

    @Override
    public List<Map<String, Object>> queryRecruit_Need(String begintime, String endtime) {
        return dao.queryRecruit_Need(begintime,endtime);
    }

    @Override
    public int updateRecruit_Need(RecruitNeed r) {
        return dao.updateRecruit_Need(r);
    }

    @Override
    public List<Map<String, Object>> queryDept1(int id) {
        deptTree d=new deptTree();
        List<Map<String, Object>> maps = dao.queryDept1(id);
        List<Map<String,Object>>list=d.deptList(maps);
        return list;
    }

    @Override
    public int deleteRecruit_Need(int id) {
        return dao.deleteRecruit_Need(id);
    }

    @Override
    public Map<String, Object> queryDeptNameIds(String deptid) {
        Map<String,Object>map=new HashMap<String, Object>();
        List<Dept> list = new ArrayList<Dept>();
        String[] deptids = deptid.split(",");
        for (int i = 0; i < deptids.length; i++) {
            Dept d = new Dept();
            d.setDeptid(Integer.parseInt(deptids[i]));
            list.add(d);
        }
        int[]id=dao.queryDeptUserIds(list);
        String[]name=dao.queryDeptUserNames(list);
        map.put("ids",id);
        map.put("names",name);
        return map;
    }


}
