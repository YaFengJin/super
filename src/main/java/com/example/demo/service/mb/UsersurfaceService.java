package com.example.demo.service.mb;

import com.example.demo.entity.EmpType;
import com.example.demo.entity.Usersurface;
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
    //查询员工
    public List<Map<String,Object>> select1();
   //增加员工
   public int savetype(EmpType type);
}
