package com.example.demo.service.mk;

import com.example.demo.entity.Meet;

import java.util.List;
import java.util.Map;

public interface MeetRoomService {
     /**
      * 增加会议室
      * @param m
      * @return
      */
     int addMeetRoom(Meet m);

     /**
      * 查询会议室
      * @return
      */
     List<Map<String,Object>> isQueryMeetRoom();

     /**
      * 修改会议室状态  启用   状态为1
      * @param m
      * @return
      */
     int isUpdateRoomStartFlag(Meet m);

     /**
      * 修改会议室状态  禁用   状态为0
      * @param m
      * @return
      */
     int isUpdateRoomEndFlag(Meet m);
}
