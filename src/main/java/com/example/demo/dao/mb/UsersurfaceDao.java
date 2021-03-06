package com.example.demo.dao.mb;

import com.example.demo.entity.EmpType;
import com.example.demo.entity.Usersurface;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UsersurfaceDao {
    //查询用户
    @Select("select " +
            "u.UserAccount as account,u.UserName as name,u.UserId as id,u.UserPassword as password,d.DeptName as deptname " +
            "from usersurface as u,dept as d " +
            "where u.DeptId=d.DeptId")
    List<Map<String, Object>> select();

    //更新用户
    @Update("<script>" +
            "update usersurface as u " +
            "<set>" +
            "<if test='useraccount!=null and useraccount!=\"\"'>u.useraccount=#{useraccount},</if>" +
            "<if test='userpassword!=null and userpassword!=\"\"'>u.userpassword=#{userpassword},</if>" +
            "<if test='dept.deptid>0'>u.deptId=#{dept.deptid}</if>" +
            "</set>" +
            " where u.userId=#{userid}" +
            "</script>")
    int updateUser(Usersurface user);

    //查询部门
    @Select("select d.deptid as id,d.deptname as name from dept as d")
    List<Map<String, Object>> queryDept();

    //添加用户
    @Insert("insert into usersurface(UserAccount,UserPassword,UserName,DeptId)" +
            "values(#{useraccount},#{userpassword},#{username},#{dept.deptid}) ")
    int saveUser(Usersurface user);

    //删除用户
    @Delete("delete from usersurface where UserId=#{id}")
    int deleteUser(@Param("id") int id);

    //查询员工类型
    @Select("select emp_typeId,emp_typename from emp_type")
    List<Map<String, Object>> select1();

    //添加员工
    @Insert("insert into emp_type(emp_typename)" +
            "values(#{emp_name})")
    int savetype(EmpType type);
}
