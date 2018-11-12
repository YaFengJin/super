package com.example.demo.service.xmt;

import com.example.demo.dao.xmt.filingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class filingServiceImpl implements filingService{
    @Autowired
    private filingDao dao;

    @Override
    public List<Map<String, Object>> queryfiling() {
        List<Map<String, Object>> queryfiling = dao.queryfiling();
        return queryfiling;
    }

    @Override
    public List<Map<String, Object>> queryChildFiling(int id) {
        List<Map<String, Object>> maps = dao.queryChildFiling(id);
        if(maps!=null&&maps.size()>0){
          return maps;
        }else{
          return dao.queryDocument(id);
        }
    }
}
