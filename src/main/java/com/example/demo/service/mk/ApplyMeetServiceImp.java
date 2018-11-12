package com.example.demo.service.mk;

import com.example.demo.dao.mk.ApplyMeet;
import com.example.demo.entity.EmailBody;
import com.example.demo.entity.EmailRecord;
import com.example.demo.entity.Ordermeeting;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Service
public class ApplyMeetServiceImp implements ApplyMeetService {
    @Resource
    private ApplyMeet  applyMeet;

    /**
     * 查询出启用状态  和当前登陆人所在部门允许申请  会议室信息
     * @param UserId
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryApplyMeet(String UserId) {
        return applyMeet.isQueryApplyMeet(UserId);
    }

    /**
     * 会议室申请
     * @param o
     * @return
     */
    @Override
    public int isInsertApplyMeet(Ordermeeting o) {
        return applyMeet.isInsertApplyMeet(o);
    }

    /**
     * 查询待批会议
     * @param meetRoom
     * @param UserId
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryWaitMeet(String meetRoom,String UserId) {
        return applyMeet.isQueryWaitMeet(meetRoom,UserId);
    }

    /**
     * 取消申请会议
     * @param o
     * @return
     */
    @Override
    public int isDeleteWaitMeet(Ordermeeting o) {
        return applyMeet.isDeleteWaitMeet(o);
    }

    /**
     * 查询已经批准的会议
     * @param ratifyMeet
     * @param UserId
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryRatifyMeet(String ratifyMeet,String UserId) {
        return applyMeet.isQueryRatifyMeet(ratifyMeet,UserId);
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
    @Override
    public int isQueryDate(String startdates, String enddates, String starttimes, String endtimes, String mId) {
        return applyMeet.isQueryDate(startdates,enddates,starttimes,endtimes,mId);
    }

    /**
     * 查询未通过的会议
     * @param ratifMeet
     * @param UserId
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryRefuseMeet(String ratifMeet,String UserId) {
        return applyMeet.isQueryRefuseMeet(ratifMeet,UserId);
    }

    /**
     * 查询出提前几个小时后的时间
     * @param Houses
     * @param orderStart
     * @return
     */
    @Override
    public String isQueryDatetime(String Houses, String orderStart) {
        return applyMeet.isQueryDatetime(Houses,orderStart);
    }

    /**
     * 定时任务    发送邮件
     */
   @Override
   @Transactional
   @Scheduled(fixedRate = 1000)
    public void isInsertEmail(){
        int a=applyMeet.isInsertEmail();
       if(a>0){
           int maxId = applyMeet.selectEmail();
           String bRecipients=applyMeet.isQueryEmailBody();
           if(maxId>0&&bRecipients!=null){
               String[] userIds=bRecipients.split(",");//分割字符串
               List<EmailRecord> list=new ArrayList<EmailRecord>();
               for (int i = 0; i < userIds.length; i++) {
                   EmailRecord er=new EmailRecord();
                   er.setUserId(Integer.parseInt(userIds[i]));
                   er.setbId(maxId);
                   list.add(er);
               }
               applyMeet.saveEmailRecord(list);
           }
       }
    }
}