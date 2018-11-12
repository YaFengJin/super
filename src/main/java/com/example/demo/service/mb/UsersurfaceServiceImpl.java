package com.example.demo.service.mb;

import com.example.demo.dao.mb.UsersurfaceDao;
import com.example.demo.entity.EmpType;
import com.example.demo.entity.Usersurface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UsersurfaceServiceImpl implements UsersurfaceService {
    @Autowired
    private UsersurfaceDao dao;

    @Override
    public List<Map<String, Object>> select() {
        return dao.select();
    }

    @Override
    public int updateUser(Usersurface user) {
        return dao.updateUser(user);
    }

    @Override
    public List<Map<String, Object>> queryDept() {
        return dao.queryDept();
    }

    @Override
    public int saveUser(Usersurface user) {
        return dao.saveUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return dao.deleteUser(id);
    }

    @Override
    public List<Map<String, Object>> select1() {
        return dao.select1();
    }

    @Override
    public int savetype(EmpType type) {return dao.savetype(type); }
}
