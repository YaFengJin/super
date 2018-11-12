package com.example.demo.controller.mk;
import com.example.demo.entity.EmailBody;
import com.example.demo.entity.Ordermeeting;
import com.example.demo.service.mk.ApplyMeetService;
import com.example.demo.util.Begin_end;
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
@RequestMapping("/ApplyMeetController")
public class ApplyMeetController {
    @Autowired
    private ApplyMeetService  service;

    /**
     * 查询出启用状态  和当前登陆人所在部门允许申请  会议室信息
     * @return
     */
    @RequestMapping("/QueryApplyMeet")
    public List<Map<String,Object>> QueryApplyMeet(String UserId){
        return service.isQueryApplyMeet(UserId);
    }


    /**
     * 查询选择的日期为周几
     * @param year
     * @param month
     * @param day
     * @param year1
     * @param month1
     * @param day1
     * @return
     */
    @RequestMapping("/QueryWeek")
    public String QueryWeek(int year,int month,int day,int year1,int month1,int day1){
        Begin_end b = new Begin_end();
        String a=b.dateforweek(year,month,day,year1,month1,day1);
        return a;
    }

    /**
     * 会议室申请
     * @param o
     * @return
     */
    @RequestMapping("/AddMeetRoom")
    public Map InsertApplyMeet(Ordermeeting o) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isInsertApplyMeet(o);
        if (a > 0) {
            map.put("message", "添加成功");
        } else{
            map.put("message", "添加失败");
        }
        return map;
    }

    /**
     * 查询待批会议
     * @param limit
     * @param page
     * @param meetRoom
     * @param UserId
     * @return
     */
    @RequestMapping("/QueryWaitMeet")
    public  Map<String,Object> QueryWaitMeet(@RequestParam(required=false,defaultValue="1")int limit, @RequestParam(required=false,defaultValue="1")int page,String meetRoom,String UserId){
        Page<Map<String,Object>> pages= PageHelper.startPage(page,limit);
        List<Map<String, Object>> list = service.isQueryWaitMeet(meetRoom,UserId);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        return map;
    }

    /**
     * 取消申请会议
     * @param o
     * @return
     */
    @RequestMapping("/DeleteWaitMeet")
    public Map DeleteWaitMeet(Ordermeeting o) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isDeleteWaitMeet(o);
        if (a > 0) {
            map.put("message", "撤销成功");
        } else{
            map.put("message", "撤销失败");
        }
        return map;
    }

    /**
     * 查询已经批准的会议
     * @param limit
     * @param page
     * @param ratifyMeet
     * @param UserId
     * @return
     */
    @RequestMapping("/QueryRatifyMeet")
    public  Map<String,Object> QueryRatifyMeet(@RequestParam(required=false,defaultValue="1")int limit, @RequestParam(required=false,defaultValue="1")int page,String ratifyMeet,String UserId){
        Page<Map<String,Object>> pages= PageHelper.startPage(page,limit);
        List<Map<String, Object>> list = service.isQueryRatifyMeet(ratifyMeet,UserId);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        return map;
    }
    /**
     * 查询数据库中已申请日期  判断时间是否冲突
     * @param startdates 开始日期
     * @param enddates  结束日期
     * @param starttimes   开始时间
     * @param endtimes     结束时间
     * @param mId    id
     * @return
     */
    @RequestMapping("/QueryDate")
    public  int QueryDate(String startdates,String enddates,String starttimes,String endtimes,String mId){
        return service.isQueryDate(startdates,enddates,starttimes,endtimes,mId);
    }

    /**
     * 查询未通过的会议
     * @param limit
     * @param page
     * @param ratifMeet
     * @param UserId
     * @return
     */
    @RequestMapping("/QueryRefuseMeet")
    public  Map<String,Object> QueryRefuseMeet(@RequestParam(required=false,defaultValue="1")int limit, @RequestParam(required=false,defaultValue="1")int page,String ratifMeet,String UserId){
        Page<Map<String,Object>> pages= PageHelper.startPage(page,limit);
        List<Map<String, Object>> list = service.isQueryRefuseMeet(ratifMeet,UserId);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        return map;
    }

    /**
     * 查询出提前几个小时后的时间
     * @param Houses
     * @param orderStart
     * @return
     */
    @RequestMapping("/QueryDatetime")
    public String QueryDatetime(String Houses,String orderStart){
        return service.isQueryDatetime(Houses,orderStart);
    }
}