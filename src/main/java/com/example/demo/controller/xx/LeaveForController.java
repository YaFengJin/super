package com.example.demo.controller.xx;

import com.example.demo.entity.Leavefor;
import com.example.demo.service.xx.LeaceForService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/xx")
public class LeaveForController {

    @Autowired
    private LeaceForService service;

    @RequestMapping(value = "/xxLeaveForSelect")
    public Map xxLeaveForSelect(@RequestParam(required=false,defaultValue="1") int page,
                                @RequestParam(required=false,defaultValue="10") int limit,
                                Leavefor leaveFor){
        Map<String,Object> map = new HashMap<String,Object>();
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map> list = service.xxLeaveForSelect(leaveFor);
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        return map;
    }
    //添加 更改 申请请假
    @RequestMapping(value = "/xxLeaveForInsert")
    public Map xxLeaveForInsert(Leavefor leaveFor,int id,int aid){
        Map<String,Object> map = new HashMap<String,Object>();
       if(id==1){
            leaveFor.setLeaveState("未批准");
           int a = service.xxLeaveForInsert(leaveFor);
           if (a>=1){
                map.put("message","添加成功");
            }else {
                map.put("message","添加失败");
            }
        }else if (id==2){
            leaveFor.setLeaveForId(aid);
            int a = service.xxLezveForUpdate1(leaveFor);
            if (a>=1){
                map.put("message","更改成功");
            }else {
                map.put("message","更改失败");
            }
        }
        return map;
    }
    //更改申请请假状态
    @RequestMapping(value = "/xxLezveForUpdate")
    public Map xxLezveForUpdate(Leavefor leaveFor,String name){
        Map<String,Object> map = new HashMap<String,Object>();
            int a = service.xxLezveForUpdate(leaveFor,name);
            if (a>=1){
                map.put("message","提交成功");
            }else {
                map.put("message","提交失败");
            }
        return map;
    }
    @RequestMapping(value = "/xxLezveForDelete")
    public Map xxLezveForDelete(Leavefor leaveFor){
        Map<String,Object> map = new HashMap<String,Object>();
        int a = service.xxLezveForDelete(leaveFor);
        if (a>=1){
            map.put("message","删除成功");
        }else {
            map.put("message","删除失败");
        }
        return map;
    }
}
