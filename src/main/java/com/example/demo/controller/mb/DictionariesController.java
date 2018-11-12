package com.example.demo.controller.mb;

import com.example.demo.entity.Dictionaries;
import com.example.demo.entity.Usersurface;
import com.example.demo.service.mb.DictionariesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
@RestController
@RequestMapping("/mb")

public class DictionariesController {
    @Autowired
    private DictionariesService service;
    @RequestMapping(value = "/savedicti",method = RequestMethod.POST)
    public Map<String,Object>savedicti(Dictionaries dicti){
        int i = service.savedicti(dicti);
        Map<String,Object> map=new HashMap<String, Object>();
        if (i>0){
            map.put("message","添加成功");
        }else{
            map.put("message","添加失败");
        }
        return map;
    }
}
