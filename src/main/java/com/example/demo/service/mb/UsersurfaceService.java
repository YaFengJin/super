package com.example.demo.service.mb;

import com.example.demo.entity.EmpType;
import com.example.demo.entity.Usersurface;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface UsersurfaceService {
    //查询用户
    public List<Map<String,Object>> select();
    //修改用户
    public  int updateUser(Usersurface user);
    //查询部门
    public List<Map<String,Object>>queryDept();
    //添加用户
    public int saveUser(Usersurface user);
    //删除用户
    public int deleteUser(int id);
    //查询员工类型
    public List<Map<String,Object>> select1();
   //增加员工类型
   public int savetype(EmpType type);
   //删除员工类型
   public int deletetype(int id);
    //判断用户是否存在
    int select2(String name);
    //用户分配角色
    int saveUserPost(int userId, int postId);
    //查询角色
    List<Map<String,Object>>queryPost();
    //查询用户是否拥有角色
    int queryisHave(int userId);
    //更新用户角色
    int updateUserPost(int userId,int postId);

}
