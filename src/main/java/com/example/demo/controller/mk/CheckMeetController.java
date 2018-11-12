package com.example.demo.controller.mk;

import com.example.demo.entity.Ordermeeting;
import com.example.demo.service.mk.CheckMeetService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/CheckMeetController")
public class CheckMeetController {
    @Autowired
     private CheckMeetService service;

    /**
     * 同意申请   状态改为1
     * @param o
     * @return
     */
    @RequestMapping("/CheckMeet")
    public Map CheckMeet(Ordermeeting o) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isCheckMeet(o);
        if (a > 0) {
            map.put("message", "操作成功");
        } else{
            map.put("message", "操作失败");
        }
        return map;
    }
    /**
     * 拒绝申请 ，添加理由
     * @param oderId
     * @param orderReason
     * @return
     */
    @RequestMapping("/NotCheckMeet")
    public Map NotCheckMeet(int oderId,String orderReason) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isNotCheckMeet(oderId,orderReason);
        if (a > 0) {
            map.put("message", "操作成功");
        } else{
            map.put("message", "操作失败");
        }
        return map;
    }

    /**
     * 查询会议申请详情
     * @param oderId
     * @return
     */
    @RequestMapping("/QueryDetails")
    public List<Map<String, Object>> QueryDetails(String oderId){
        return service.isQueryDetails(oderId);
    }
}