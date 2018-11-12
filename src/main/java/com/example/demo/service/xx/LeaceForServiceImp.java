package com.example.demo.service.xx;

import com.example.demo.dao.xx.LeaveForDao;
import com.example.demo.entity.Leavefor;
import com.example.demo.util.DayForWeek;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Service
public class LeaceForServiceImp implements LeaceForService {

    @Autowired
    private LeaveForDao dao;
    /*根据登陆人员查询出请假记录*/
    @Override
    public List<Map> xxLeaveForSelect(Leavefor leaveFor) {
        return dao.xxLeaveForSelect(leaveFor);
    }
    /*添加请假*/
    @Override
    @Transactional
    public int xxLeaveForInsert(Leavefor leaveFor){
        /*DayForWeek day = new DayForWeek();
        String begin = String.valueOf(leaveFor.getBeginTime());
        String end = String.valueOf(leaveFor.getOverTime());
        String s = String.valueOf(day.DayForSecond(begin,end));//计算出两个时间中的秒差
        System.out.println(leaveFor.getBeginTime()+","+leaveFor.getOverTime());
        leaveFor.setLeaveNumber(s);*/
        return dao.xxLeaveForInsert(leaveFor);
    }

    @Override
    public int xxLezveForUpdate(Leavefor leaveFor,String name) {
        if(name.equals("批准")) {
            leaveFor.setLeaveState("已审核");
        }else if(name.equals("销假")){
            leaveFor.setLeaveState("请求销假");
        }else if(name.equals("代销假")){
            leaveFor.setLeaveState("已销假");
        }else if(name.equals("不批准")){
            leaveFor.setLeaveState("不批准");
        }
        return dao.xxLezveForUpdate(leaveFor);

    }
    /*更改请假*/
    @Override
    public int xxLezveForUpdate1(Leavefor leaveFor) {
        return dao.xxLezveForUpdate1(leaveFor);
    }
    /*删除请假*/
    @Override
    public int xxLezveForDelete(Leavefor leaveFor) {
        return dao.xxLezveForDelete(leaveFor);
    }
}
