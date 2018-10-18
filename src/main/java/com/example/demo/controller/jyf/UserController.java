package com.example.demo.controller.jyf;

import com.example.demo.service.jyf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@EnableAutoConfiguration
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService ser;
    @RequestMapping(value = "/queryUser",method = RequestMethod.POST)
    public List<Map<String,Object>> queryUser(int id){
        System.out.println("进入controller");
        List<Map<String, Object>> queryuser = ser.queryUser(id);
        System.out.println(queryuser);
        return queryuser;
    }
}
