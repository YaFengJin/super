package com.example.demo.controller.xx;

import com.example.demo.entity.Arrangemanage;
import com.example.demo.entity.Schedulingmanage;
import com.example.demo.service.xx.XxService;
import com.example.demo.util.Begin_end;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/xx")
public class XxController {

    @Autowired
    private XxService service;


    /*分页模糊条件查询*/
    @RequestMapping(value = "/select")
    public Map<String,Object> select(@RequestParam(required=false,defaultValue="1") int page,
                                     @RequestParam(required=false,defaultValue="10") int limit,
                                     String schedulingName){
        Map<String,Object> map = new HashMap<String, Object>();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map<String,Object>> datas = service.select(page,limit,schedulingName);
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",datas);
        return map;
    }
    /*班次添加*/
    @RequestMapping(value = "/xxinsert")
    public Map<String, Object> xxinsert(Schedulingmanage s, int id){
        Map<String,Object> map = new HashMap<String, Object>();
        if(id==1){
            int a = service.xxinsert(s);
            if (a>=1){
                map.put("message","添加成功");
            }else {
                map.put("message","添加失败");
            }
        }else if (id==2){
            int a = service.xxupdate(s);
            if (a>=1){
                map.put("message","更改成功");
            }else {
                map.put("message","更改失败");
            }
        }
        return map;
    }
    /*删除班次*/
    @RequestMapping("/xxdelete")
    public Map<String,Object> xxdelete(int schedulingManagId){
        Map<String,Object> map = new HashMap<String, Object>();
        int a = service.xxdelete(schedulingManagId);
        if (a>=1){
            map.put("message","删除成功");
        }else{
            map.put("message","删除失败");
        }
        return map;
    }
    /**
     * 查询排班
     */
        @RequestMapping(value = "/xxArrangemanageselect")
    public Map<String,Object> xxArrangemanageselect(@RequestParam(required=false,defaultValue="1") int page,
                                                    @RequestParam(required=false,defaultValue="10") int limit,
                                                    String schedulingName){
        Map<String,Object> map = new HashMap<String, Object>();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map<String,Object>> datas = service.xxArrangemanageselect();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",datas);
        return map;
    }
    /**
     * 根据id查询排班
     */
    @RequestMapping(value = "/xxArrangemanageselect1")
    public Map<String,Object> xxArrangemanageselect1(int id){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Map<String,Object>> datas = service.xxArrangemanageselect1(id);
        for (Map<String,Object> d:datas ){
            String[] day1 = String.valueOf(d.get("monday")).split(",");
            String[] day2 = String.valueOf(d.get("tuesday")).split(",");
            String[] day3 = String.valueOf(d.get("wednesday")).split(",");
            String[] day4 = String.valueOf(d.get("thursday")).split(",");
            String[] day5 = String.valueOf(d.get("friday")).split(",");
            String[] day6 = String.valueOf(d.get("saturday")).split(",");
            String[] day7 = String.valueOf(d.get("sunday")).split(",");
            for (int j=0;j<day1.length;j++){
                map.put("day"+j+"1",day1[j]);
                String[] o =day1[j].split("-");
                for (int k=0;k<o.length;k++)
                   map.put("oo"+k+"1",o[k]);
            }
            for (int j=0;j<day2.length;j++){
                map.put("day"+j+"2",day2[j]);
            }
            for (int j=0;j<day3.length;j++){
                map.put("day"+j+"3",day3[j]);
            }
            for (int j=0;j<day4.length;j++){
                map.put("day"+j+"4",day4[j]);
            }
            for (int j=0;j<day5.length;j++){
                map.put("day"+j+"5",day5[j]);
            }
            for (int j=0;j<day6.length;j++){
                map.put("day"+j+"6",day6[j]);
            }
            for (int j=0;j<day7.length;j++){
                map.put("day"+j+"7",day7[j]);
            }
        }
        /*String a[]= new String [6];
        for(int i=0;i<6;i++){
             a[i] = "a1"+i;
            System.out.println(a[i]);
        }*/
        return map;
    }
    /*更改排班状态*/
    @RequestMapping(value = "/xxArrangemanageUpdate")
    public Map<String,Object> xxArrangemanageUpdate(Arrangemanage a){
        Map<String,Object> map = new HashMap<String, Object>();
        int num = service.xxArrangemanageupdate(a);
        if (num>=1){
            map.put("message","更改成功");
        }else {
            map.put("message","更改失败");
        }
        return map;
    }
    /*根据班次类型id查班次类型数据*/
    @RequestMapping(value = "/xxSchedulingmanageselect")
    public Map<String,Object> xxSchedulingmanageselect(int sid){
        Map<String,Object> map = new HashMap<String, Object>();
       List<Map<String,Object>> list = service.xxSchedulingmanageselect(sid);
        map.put("list",list);
        return map;
    }
    /*添加,编辑排班数据*/
    @RequestMapping(value = "/xxArrangemanageinsert")
    public Map<String,Object> xxArrangemanageinsert(Arrangemanage a,int id,int aid){
        Map<String,Object> map = new HashMap<String, Object>();
        if(id==1){
            a.setStatusn("1");
            int b = service.xxArrangemanageinsert(a);//添加排班
            if (b>=1){
                map.put("message","添加成功");
            }else{
                map.put("message","添加失败");
            }
        }else if (id==2){
            a.setArrangeManagId(aid);
            int c = service.xxArrangemanageupdate1(a);//编辑排班
            if (c>=1){
                map.put("message","更改成功");
            }else{
                map.put("message","更改失败");
            }
        }
         return map;
    }
    /*删除排班*/
    @RequestMapping(value = "/xxArrangemanagedelete")
    public Map<String,Object> xxArrangemanagedelete(Arrangemanage a) {
        Map<String,Object> map = new HashMap<String,Object>();
        int b = service.xxArrangemanagedelete(a);
        if(b>=0){
            map.put("message","删除成功");
        }else{
            map.put("message","删除失败");
        }
        return map;
    }
    //查询选择的日期为周几
    @RequestMapping(value = "/QueryWeek")
    public String QueryWeek(int year,int month,int day,int year1,int month1,int day1){
        Begin_end b = new Begin_end();
        String a=b.dateforweek(year,month,day,year1,month1,day1);
        return a;
    }
}
