package com.example.demo.service.xx;

import com.example.demo.dao.xx.DeptUserDao;
import com.example.demo.entity.Usersurface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DeptUserServiceImp implements DeptUserService {

    @Autowired
    private DeptUserDao dao;
    /*查询部门*/
    @Override
    public List<Map> userdeptselect() {
        return dao.userdeptselect();
    }

    @Override
    public List<Map> Usersurfaceid(Usersurface u) {
        return dao.Usersurfaceid(u);
    }
}
