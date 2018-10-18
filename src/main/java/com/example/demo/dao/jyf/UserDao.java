package com.example.demo.dao.jyf;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;
import java.util.Map;

@Mapper
public interface UserDao {
    @Select("select m.menuname as menuname,m.menuurl as menuurl,m.menufid as menufid from " +
            "menu as m, post_menu as pm, usersurface as u, user_post as up " +
            "where u.UserId=up.UserId and up.PostId=pm.PostId and m.MenuId=pm.MenuId and   u.UserId=#{id}")
    public List<Map<String, Object>> queryUser(@Param("id") int id);
}
