package com.example.demo.service.mk;

import com.example.demo.dao.mk.CheckMeet;
import com.example.demo.entity.Ordermeeting;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CheckMeetServiceImp implements CheckMeetService {
    @Resource
    private CheckMeet dao;

    /**
     * 同意申请   状态改为1
     * @param o
     * @return
     */
    @Override
    public int isCheckMeet(Ordermeeting o) {
        return dao.isCheckMeet(o);
    }
    /**
     * 拒绝申请 ，添加理由
     * @param a
     * @param orderReason
     * @return
     */
    @Override
    @Transactional
    public int isNotCheckMeet(int a, String orderReason) {
         int result=0;
         int c = dao.isNotCheckMeet(a);
         if(c>0){
             int b = dao.isInsertReason(a,orderReason);
              if (b>0){
                  result=1;
              }
         }else {
             result=0;
         }
         return result;
    }
    /**
     * 每六秒执行一次
     */
    @Override
    @Scheduled(fixedRate = 60000)
    public void isUpdateMeetFlag() {
        dao.isUpdateMeetFlag();
    }

    /**
     * 查询会议申请详情
     * @param oderId
     * @return
     */
    @Override
    public List<Map<String, Object>> isQueryDetails(String oderId) {
        return dao.isQueryDetails(oderId);
    }

}
