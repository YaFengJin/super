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
            "u.UserAccount as account,u.UserName as name,u.UserId as id,u.UserPassword as password,d.DeptName as deptname," +
            "up.postId as postid " +
            "from usersurface as u,dept as d,user_post as up  " +
            "where u.DeptId=d.DeptId and u.userId=up.userId")
     List<Map<String,Object>> select();
    //更新用户
    @Update("<script>" +
            "update usersurface as u " +
            "<set>" +
            "<if test='useraccount!=null and useraccount!=\"\"'>u.userAccount=#{useraccount},</if>" +
            "<if test='userpassword!=null and userpassword!=\"\"'>u.userPassword=#{userpassword},</if>" +
            "<if test='dept.deptid>0'>u.deptId=#{dept.deptid}</if>" +
            "</set>" +
            " where u.userId=#{userid}" +
            "</script>")
     int updateUser(Usersurface user);
    //查询部门
    @Select("select d.deptid as id,d.deptname as name from dept as d")
     List<Map<String,Object>>queryDept();
    //添加用户
    @Insert("insert into usersurface(UserAccount,UserPassword,UserName,DeptId)" +
            "values(#{useraccount},#{userpassword},#{username},#{dept.deptid}) ")
     int saveUser(Usersurface user);
    //删除用户
    @Delete("delete from usersurface where UserId=#{id}")
     int deleteUser(@Param("id") int id);
   //查询员工类型
    @Select("select emp_typeId,emp_typename from emp_type")
     List<Map<String,Object>>select1();
    //添加员工类型
    @Insert("insert into emp_type(emp_typename)"+
    "values(#{empTypeName})")
     int savetype(EmpType type);
    //删除员工类型
    @Delete("delete from emp_type where emp_TypeId=#{id}")
    int deletetype(@Param("id") int id);
    //判断用户是否存在
    @Select("select count(*) from usersurface as u where u.UserAccount=#{name}")
    int select2(@Param("name") String name);
    //用户分配角色
    @Insert("insert into  user_post(postId,userId)values(#{postId},#{userId})")
    int saveUserPost(@Param("userId") int userId, @Param("postId") int postId);
    //查询角色
    @Select("select PostId as id,postName as name from Post")
    List<Map<String,Object>>queryPost();
    //查询用户是否拥有角色
    @Select("select count(*) from user_post where UserId=#{userId}")
    int queryisHave(@Param("userId") int userId);
    //更新用户角色
    @Insert("update user_post set PostId=#{postId} where UserId=#{userId}")
    int updateUserPost(@Param("userId") int userId, @Param("postId") int postId);

}
