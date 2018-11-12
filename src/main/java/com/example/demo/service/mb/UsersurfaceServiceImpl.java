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

    @Override
    public int deletetype(int id) { return dao.deletetype(id); }

    @Override
    public int select2(String name) {
        return dao.select2(name);
    }

    @Override
    public int saveUserPost(int userId,int postId) {
        return dao.saveUserPost(userId,postId);
    }

    @Override
    public List<Map<String, Object>> queryPost() {
        return dao.queryPost();
    }

    @Override
    public int queryisHave(int userId) {
        return dao.queryisHave(userId);
    }

    @Override
    public int updateUserPost(int userId, int postId) {
        return dao.updateUserPost(userId,postId);
    }


}
