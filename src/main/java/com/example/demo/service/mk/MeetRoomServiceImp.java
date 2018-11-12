package com.example.demo.service.mk;

import com.example.demo.entity.Meet;
import com.example.demo.dao.mk.MeetRoom;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class MeetRoomServiceImp implements MeetRoomService {
    @Resource
    private MeetRoom meetRoom;

    /**
     * 增加会议室
     * @param m
     * @return
     */
    @Override
    public int addMeetRoom(Meet m) {
        return meetRoom.addMeetRoom(m);
    }

    /**
     * 查询会议室
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryMeetRoom() {
        return meetRoom.isQueryMeetRoom();
    }

    /**
     * 修改会议室状态  启用   状态为1
     * @param m
     * @return
     */
    @Override
    public int isUpdateRoomStartFlag(Meet m) {
        return meetRoom.isUpdateRoomStartFlag(m);
    }

    /**
     * 修改会议室状态  禁用   状态为0
     * @param m
     * @return
     */
    @Override
    public int isUpdateRoomEndFlag(Meet m) {
        return meetRoom.isUpdateRoomEndFlag(m);
    }
}
