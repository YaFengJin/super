package com.example.demo.controller.xx;

import com.example.demo.entity.Compantpersonage;
import com.example.demo.entity.Wagelevel;
import com.example.demo.entity.Wageproject;
import com.example.demo.service.xx.WageProjetService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/xx")
public class WageProjetController {
    @Autowired
    private WageProjetService service;
    /*分页模糊条件查询*/
    @RequestMapping(value = "/xxWageprojectSelect")
    public Map xxWageprojectSelect(@RequestParam(required=false,defaultValue="1") int page,
                                                  @RequestParam(required=false,defaultValue="10") int limit){
        Map<String,Object> map = new HashMap<String, Object>();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map> datas = service.xxWageprojectSelect();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",datas);
        return map;
    }
    /*查询薪酬项目类型*/
    @RequestMapping(value = "/xxProjecttypeSelect")
    public Map xxProjecttypeSelect(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> datas = service.xxProjecttypeSelect();
        map.put("list",datas);
        return map;
    }
    /*添加薪酬项目*/
    @RequestMapping(value = "/xxWageprojectInsert")
    public Map xxWageprojectInsert(Wageproject wageproject,int wid,Integer id){
        System.out.println(wid+":wid");
        System.out.println(id+":id");
        Map<String,Object> map = new HashMap<String, Object>();
        int datas = service.xxWageprojectInsert(wageproject,wid,id);
        if (datas>0){
            map.put("message","成功");
        }else {
            map.put("message","失败");
        }
        return map;
    }
    /*删除薪酬项目*/
    @RequestMapping(value = "/xxWageprojectDelete")
    public Map xxWageprojectDelete(Wageproject wageproject){
        Map<String,Object> map = new HashMap<String, Object>();
        int datas = service.xxWageprojectDelete(wageproject);
        if (datas>0){
            map.put("message","删除成功");
        }else {
            map.put("message","删除失败");
        }
        return map;
    }
    /*保险系数查询*/
    @RequestMapping(value = "/xxCompantpersonageSelect")
    public Map xxCompantpersonageSelect(){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map> datas = service.xxCompantpersonageSelect();
        map.put("list",datas);
        return map;
    }
    /*更改保险基数*/
    @RequestMapping(value = "/xxCompantpersonageUpdate")
    public Map xxCompantpersonageUpdate(Compantpersonage compantpersonage){
        Map<String,Object> map = new HashMap<String, Object>();
        int datas = service.xxCompantpersonageUpdate(compantpersonage);
        if (datas>0){
            map.put("message","编辑成功");
        }else {
            map.put("message","编辑失败");
        }
        return map;
    }
    @RequestMapping(value = "/xxWagelevelSelect")
    public Map xxWagelevelSelect(@RequestParam(required=false,defaultValue="1") int page,
                                 @RequestParam(required=false,defaultValue="10") int limit,
                                 Integer userid,String name){
        Map<String,Object> map = new HashMap<String, Object>();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        //查询薪酬
        List<Map> datas = service.xxWagelevelSelect(userid, name);
        //查询薪酬项目
        List<Map> list = service.xxWageprojectSelect();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",datas);
        map.put("list",list);
        return map;
    }
    /*添加工资基础*/
    @RequestMapping(value = "/xxWagelevelInsert")
    public Map xxWagelevelInsert(Wagelevel wagelevel,String userIds,int money){
        Map<String,Object> map = new HashMap<String, Object>();
        int a = 0;
        String[] id = userIds.split(",");//1，2，3 1 2 3
        for (int j=0;j<id.length;j++) {
            wagelevel.setUserId(Integer.parseInt(id[j]));
            Integer user = Integer.parseInt(id[j]);
            a = service.xxWagelevelInsert(wagelevel,user,money);
        }
        if (a>0){
            map.put("message","添加成功");
        }else {
            map.put("message","添加失败");
        }
        return map;
    }
    /*查询薪资计算结果明细*/
    @RequestMapping(value = "/xxWageLeavelS")
    public Map xxWageLeavelS(int userId,String time){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list",service.xxWageLeavelS(userId,time));
        return map;
    }
}
