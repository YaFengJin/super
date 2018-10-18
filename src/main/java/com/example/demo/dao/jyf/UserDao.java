package com.example.demo.dao.jyf;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
@Mapper
public interface UserDao {
    public List<Map<String,Object>>queryUser(@Param("id") int id);
}
