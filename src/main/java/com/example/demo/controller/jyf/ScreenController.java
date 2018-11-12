package com.example.demo.controller.jyf;

import com.example.demo.entity.RecruitScreen;
import com.example.demo.service.jyf.ScreenService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/recruit")
public class ScreenController {
    @Autowired
    private ScreenService ser;
    @RequestMapping(value = "/queryTalentsName",method = RequestMethod.POST)
    public List<Map<String,Object>> queryTalentsName(){
        List<Map<String, Object>> maps = ser.queryTalentsName();
        return maps;
    }
    @RequestMapping(value = "/queryTalents",method = RequestMethod.POST)
    public List<Map<String,Object>> queryTalents(int id){
        List<Map<String, Object>> maps = ser.queryTalents(id);
        return maps;
    }
    @RequestMapping(value = "/saveScreen",method = RequestMethod.POST)
    public Map<String,Object>saveScreen(RecruitScreen screen){
        int i = ser.saveScreen(screen);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping(value = "/queryScreen")
    public Map<String,Object>queryScreen(int limit,int page){
        Page<Map<String, Object>> objects = PageHelper.startPage(page, limit);
        List<Map<String, Object>> maps = ser.queryScreen();
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",objects.getResult());
        map.put("count",objects.getTotal());
        return map;
    }
    @RequestMapping(value = "/updateScreen",method = RequestMethod.POST)
    public  Map<String,Object>updateScreen(RecruitScreen screen){
        int i = ser.updateScreen(screen);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping(value = "/deleteScreen",method = RequestMethod.POST)
    public Map<String,Object> deleteScreen(int id) {
        int i = ser.deleteScreen(id);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping(value = "/updateScreenStateSuccess",method = RequestMethod.POST)
    public Map<String,Object> updateScreenStateSuccess(int id) {
        int i = ser.updateScreenStateSuccess(id);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping(value = "/updateScreenStateFile",method = RequestMethod.POST)
    public Map<String,Object> updateScreenStateFile(int id) {
        int i = ser.updateScreenStateFile(id);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
}
