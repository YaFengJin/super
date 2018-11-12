package com.example.demo.controller.xx;

import com.example.demo.entity.Usersurface;
import com.example.demo.service.xx.DeptUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/xx")
public class DeptUserController {

    @Autowired
    private DeptUserService service;


    /*查询部门*/
    @RequestMapping(value = "/userdeptselect")
    public Map<String,Object> userdeptselect(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = service.userdeptselect();
        map.put("list",list);
        return map;
    }
    @RequestMapping(value = "/Usersurfaceid")
    public Map<String,Object> Usersurfaceid(Usersurface u){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> list = service.Usersurfaceid(u);
        map.put("list",list);
        return map;
    }


}
