package com.example.demo.service.jyf;


import com.example.demo.entity.Post;
import com.example.demo.entity.Usersurface;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<Map<String,Object>>userLogin(String name,String password);
    //根据登录名查询密码
    Usersurface findByUser(String name);
    //查询菜单
     List<Map<String,Object>> queryUser(int id);
    //查询角色
     List<Map<String,Object>>queryRole(String postName);
    //查询部门
     List<Map<String,Object>>queryDept();
    //添加角色
     int saveRole(Post post);
    //删除角色
     int deleteRole(int id);
    //修改角色
     int updateRole(Post p);
    //查询职位拥有的权限
     List<Map<String, Object>> queryPostMenu(int id);
    //分配权限
     int grantMenuforpost(int id,String menuid);
}
