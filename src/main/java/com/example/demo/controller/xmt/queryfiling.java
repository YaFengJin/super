package com.example.demo.controller.xmt;

import com.example.demo.service.xmt.filingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class queryfiling {
    @Autowired
    private filingService ser;

    @RequestMapping(value = "/query",method = RequestMethod.POST)
    public List<Map<String,Object>>query(){
        List<Map<String, Object>> queryfiling = ser.queryfiling();
        return queryfiling;
    }
    @RequestMapping(value = "/queryChildFiling",method = RequestMethod.POST)
    public List<Map<String,Object>>queryChildFiling(int id){
        List<Map<String, Object>> maps = ser.queryChildFiling(id);
        return maps;
    }
}
