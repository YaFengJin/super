package com.example.demo.service.mk;

import com.example.demo.entity.Ordermeeting;
import java.util.List;
import java.util.Map;

public interface ApplyMeetService {
    /**
     * 查询出启用状态  和当前登陆人所在部门允许申请  会议室信息
     * @param UserId
     * @return
     */
    List<Map<String,Object>> isQueryApplyMeet(String UserId);

    /**
     * 会议室申请
     * @param o
     * @return
     */
    int isInsertApplyMeet(Ordermeeting o);

    /**
     * 查询待批会议
     * @param meetRoom
     * @param UserId
     * @return
     */
    List<Map<String,Object>> isQueryWaitMeet(String meetRoom);

    /**
     * 取消申请会议
     * @param o
     * @return
     */
    int isDeleteWaitMeet(Ordermeeting o);

    /**
     * 查询已经批准的会议
     * @param ratifyMeet
     * @param UserId
     * @return
     */
    List<Map<String,Object>> isQueryRatifyMeet(String ratifyMeet, String UserId);
    /**
     * 查询数据库中已申请日期  判断时间是否冲突
     * @param startdates 开始日期
     * @param enddates  结束日期
     * @param starttimes   开始时间
     * @param endtimes     结束时间
     * @param mId    id
     * @return
     */
    int isQueryDate(String startdates, String enddates, String starttimes, String endtimes, String mId);

    /**
     * 查询未通过的会议
     * @param ratifMeet
     * @param UserId
     * @return
     */
    List<Map<String,Object>> isQueryRefuseMeet(String ratifMeet, String UserId);

    /**
     * 查询出提前几个小时后的时间
     * @param Houses
     * @param orderStart
     * @return
     */
    String isQueryDatetime(String Houses, String orderStart);

    /**
     * 定时任务    发送邮件
     */
    void isInsertEmail();
}