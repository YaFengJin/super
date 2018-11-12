package com.example.demo.controller.mk;

import com.example.demo.entity.Meet;
import com.example.demo.service.mk.MeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@RestController
@RequestMapping("/meetRoomController")
public class MeetRoomController{
    @Autowired
    private MeetRoomService service;

    /**
     * 增加会议室
     * @param m
     * @return
     */
    @RequestMapping("/AddMeetRoom")
    public Map AddMeetRoom(Meet m) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.addMeetRoom(m);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    /**
     * 查询会议室
     * @return
     */
    @RequestMapping("/QueryMeetRoom")
    public List<Map<String, Object>> QueryMeetRoom() {
        return service.isQueryMeetRoom();
    }

    /**
     * 修改会议室状态  启用   状态为1
     * @param m
     * @return
     */
    @RequestMapping("/UpdateRoomStartFlag")
    public Map UpdateRoomStartFlag(Meet m) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isUpdateRoomStartFlag(m);
        if (a > 0) {
            map.put("message", "启用成功");
        } else {
            map.put("message", "启用失败");
        }
        return map;
    }

    /**
     * 修改会议室状态  禁用   状态为0
     * @param m
     * @return
     */
    @RequestMapping("/UpdateRoomEndFlag")
    public Map UpdateRoomEndFlag(Meet m) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isUpdateRoomEndFlag(m);
        if (a > 0) {
            map.put("message", "禁用成功");
        } else {
            map.put("message", "禁用失败");
        }
        return map;
    }
}
