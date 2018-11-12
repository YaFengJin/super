package com.example.demo.service.xx;

import com.example.demo.entity.Leavefor;

import java.text.ParseException;
import java.util.List;
import java.util.Map;


public interface LeaceForService {
    List<Map> xxLeaveForSelect(Leavefor leaveFor);
    int xxLeaveForInsert(Leavefor leaveFor);
    /*更改状态*/
    int xxLezveForUpdate(Leavefor leaveFor, String name);
    /*更改请假*/
    int xxLezveForUpdate1(Leavefor leaveFor);
    /*删除请假*/
    int xxLezveForDelete(Leavefor leaveFor);
}
