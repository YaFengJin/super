package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.HireDao;
import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitHire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class HireServiceImpl implements HireService {
    @Autowired
    private HireDao dao;

    @Override
    public List<Map<String, Object>> queryDeptOne(String deptids) {
        String[] dept = deptids.split(",");
        List<Dept> list = new ArrayList<Dept>();
        for (int i = 0; i < dept.length; i++) {
            Dept d = new Dept();
            d.setDeptid(Integer.parseInt(dept[i]));
            list.add(d);
        }
        List<Map<String, Object>> maps = dao.queryDeptOne(list);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryEmpType() {
        return dao.queryEmpType();
    }

    @Override
    public int saveRecruitHire(RecruitHire hire) {
        return dao.saveRecruitHire(hire);
    }

    @Override
    public List<Map<String, Object>> queryRecruitHire() {
        return dao.queryRecruitHire();
    }

    @Override
    public int updateRecruitHire(RecruitHire recruitHire) {
        return dao.updateRecruitHire(recruitHire);
    }
}
