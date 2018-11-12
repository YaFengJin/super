package com.example.demo.controller.jyf;

import com.example.demo.entity.Talents;
import com.example.demo.service.jyf.TalentsService;
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
public class TalentsController {
    @Autowired
    private TalentsService ser;
    @RequestMapping(value = "/queryDictionariesName",method = RequestMethod.POST)
    public Map<String,Object>queryDictionariesName(){
        Map<String, Object> map = ser.queryDictionariesName();
        return map;
    }
    @RequestMapping(value = "/queryPlanName",method = RequestMethod.POST)
    public List<Map<String,Object>> queryPlanName(){
        List<Map<String, Object>> maps = ser.queryPlanName();
        return maps;
    }
    @RequestMapping(value = "/saveTalents",method = RequestMethod.POST)
    public  Map<String,Object>saveTalents(Talents talents){
        int i = ser.saveTalents(talents);
        Map<String,Object>map=new HashMap<String, Object>();
        if (i>0){
            map.put("message","1");
        }else {
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping("/queryTalents")
    public Map<String,Object>queryTalents(int limit,int page){
        Page<Map<String, Object>> objects = PageHelper.startPage(page, limit);
        List<Map<String, Object>> maps = ser.queryTalents();
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",objects.getResult());
        map.put("count",objects.getTotal());
        return map;
    }
    @RequestMapping(value = "/updateTalents",method = RequestMethod.POST)
    public Map<String,Object>updateTalents(Talents talents){
        Map<String,Object>map=new HashMap<String, Object>();
        int i = ser.updateTalents(talents);
        if(i>0){
             map.put("message","1");
        }else{
             map.put("message","0");
        }
        return map;
    }
    @RequestMapping(value = "/deleteTalents",method = RequestMethod.POST)
    public Map<String,Object>deleteTalents(int id){
        int i = ser.deleteTalents(id);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
}
