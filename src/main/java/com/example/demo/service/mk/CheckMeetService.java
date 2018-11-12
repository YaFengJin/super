package com.example.demo.service.mk;

import com.example.demo.entity.Ordermeeting;

import java.util.List;
import java.util.Map;

public interface CheckMeetService {
    /**
     * 同意申请   状态改为1
     * @param o
     * @return
     */
    int isCheckMeet(Ordermeeting o);
    /**
     * 拒绝申请 ，添加理由
     * @param a
     * @param orderReason
     * @return
     */
    int isNotCheckMeet(int a, String orderReason);
    void isUpdateMeetFlag();
    /**
     * 查询会议申请详情
     * @param oderId
     * @return
     */
    List<Map<String,Object>> isQueryDetails(String oderId);
}
