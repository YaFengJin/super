package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    @Override
    public List<Map<String, Object>> queryUser(int id) {
        List<Map<String, Object>> list = dao.queryUser(id);
        List<Map<String, Object>> listData=new ArrayList<Map<String, Object>>();
        for (Map<String, Object> map:list) {
            List<Map<String, Object>> listChildren = new ArrayList<Map<String, Object>>();
            if ((Integer) map.get("pid") == 0) {
                for (Map<String, Object> map1 : list) {
                    if ((Integer) map1.get("pid") == (Integer) map.get("id")) {
                        listChildren.add(map1);
                    }
                }
                map.put("children", listChildren);
                listData.add(map);
            }
        }
        return listData;
    }
}
