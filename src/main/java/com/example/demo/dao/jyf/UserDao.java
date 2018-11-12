package com.example.demo.dao.jyf;


import com.example.demo.entity.Post;
import com.example.demo.entity.Post_Menu;
import com.example.demo.entity.Usersurface;
import org.apache.ibatis.annotations.*;
import java.util.List;
import java.util.Map;

@Mapper
public interface UserDao {
    //用户登录
    @Select("select u.UserName as name,u.UserId as id" +
            " from usersurface as u " +
            " where u.UserAccount=#{name} and u.UserPassword=#{password}")
    List<Map<String,Object>>userLogin(@Param("name") String name, @Param("password") String password);
    //查询
    @Select("select count(*) from usersurface as u where u.UserAccount=#{name}")
    int select(@Param("name") String name);
    //更新
    @Update("update usersurface set UserPassword=#{password} where UserAccount=#{name}")
    int update(@Param("name") String name, @Param("password") String password);

    //根据用户名字查询密码
    @Select("select u.UserId,u.UserAccount,u.UserPassword,u.UserName " +
            "from usersurface as u " +
            "where u.UserAccount=#{name}")
    Usersurface findByUser(@Param("name") String name);
    //查询菜单
    @Select("select m.menuid as id,m.menuname as name,m.menuurl as url,m.menufid as pid from " +
            "menu as m, post_menu as pm, usersurface as u, user_post as up " +
            "where u.UserId=up.UserId and up.PostId=pm.PostId and m.MenuId=pm.MenuId and   u.UserId=#{id}")
     List<Map<String,Object>> queryUser(@Param("id") int id);
    //查询角色
    @Select("<script>" +
            "select p.PostId as id,p.PostName as name,p.Duty as Duty,d.DeptName as deptName " +
            "from post as p,dept as d where 1=1 " +
            "<if test='postName!=null and postName!=\"\"'>" +
            " and postName like concat('%',#{postName},'%')" +
            "</if>" +
            "and p.DeptId=d.DeptId" +
            "</script>")
     List<Map<String,Object>>queryRole(@Param("postName") String postName);

    //查询部门
    @Select("select d.DeptId as id,d.DeptName as name from dept as d")
     List<Map<String,Object>>queryDept();

    //添加角色
    @Insert("insert into post(PostName,Duty,DeptId)values(#{postname},#{duty},#{dept.deptid})")
     int saveRole(Post post);

    //删除角色
    @Delete("delete from post where PostId=#{id}")
     int deleteRole(@Param("id") int id);

    //更新角色
    @Update("<script>" +
            "update post" +
            "<set>" +
            "<if test='postname!=null and postname!=\"\"'>PostName=#{postname},</if>" +
            "<if test='duty!=null and duty!=\"\"'>duty=#{duty},</if>" +
            "<if test='dept.deptid>0'>DeptId=#{dept.deptid}</if>" +
            "</set>" +
            "where PostId=#{postid}" +
            "</script>")
     int updateRole(Post p);

    //查询职位拥有的权限
    @Select("select m.MenuId as id,m.MenuFid as pid,m.MenuName as name," +
            " (case when rm.PostId is not null then true else false end) as checked " +
            " from menu m left join " +
            " (select * from post_menu rm where rm.PostId=#{id}) as rm " +
            " on m.MenuId=rm.MenuId")
     List<Map<String,Object>> queryPostMenu(@Param("id") int id);

    //删除角色拥有的权限
    @Delete("delete from post_menu  where PostId=#{id}")
    int deletePostMenu(@Param("id") int id);

    //先删除后添加
    @Insert("<script>" +
            "insert into post_menu(MenuId,PostId) values" +
            "<foreach collection='list' item='item'  separator=','>" +
            "(#{item.menu.menuid},#{item.post.postid})" +
            " </foreach>" +
            "</script>")
     int insertPostMenu(List<Post_Menu> list);


}
