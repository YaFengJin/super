package com.example.demo.service.jyf;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {
    public List<Map<String,Object>> queryUser(@Param("id") int id);
}
