package com.example.demo.service.xx;

import com.example.demo.dao.xx.CheckDao;
import com.example.demo.dao.xx.CheckStaticsDao;
import com.example.demo.entity.*;
import com.example.demo.util.DayForWeek;
import org.apache.poi.ss.formula.ptg.MemAreaPtg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class CheckServiceImp implements CheckService {
    @Autowired
    private CheckDao dao;

    @Autowired
    private CheckStaticsDao dao1;


    Calendar calendar = Calendar.getInstance();//计算开始时间

    /*查询考勤记录*/
    @Override
    @Transactional
    public List<Checksurface> xxChecksurfaceSelect(int sid,String month) throws Throwable {
        DayForWeek dayForWeek = new DayForWeek();
        Map<String, Object> map = new HashMap<String, Object>();
        int jid=0;
        List<Checksurface> list1 = dao.xxChecksurfaceSelect(sid,jid,month);//查询考勤数据
        List<Checksurface> list11 = dao.xxChecksurfaceSelect1(sid,jid,month);//查询考勤数据
        List<Arrangemanage> list2 = dao.xxArrangemanageselect1();//查询排班
        for (Checksurface a1 : list11) {//循环考勤
            //System.out.println("考勤用户id:"+a1.getDownTimeOne());//考勤用户id
            for (Arrangemanage a2 : list2) {//循环排班
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String createdate = sdf.format(a1.getCheckTime());//获取String类型的时间
                String zou = dayForWeek.dayForWeek(createdate);//将时间转换为周几
                String[] userId = a2.getUserId().split(",");//分割id串
                for (int j = 0; j < userId.length; j++) {
                    Date DateStart = begin0(a2.getDateStart());//提取排班开始时间
                    Date DateEnd = over0(a2.getDateEnd());//提取排班结束日期
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {//判断考勤时间是不是在排班时间内
                        if (!a2.getMonday().equals("") && zou.equals("1")) {//判断周一是否为空 并且  考勤时间是否未周一
                            String[] day1 = a2.getMonday().split(",");//分割周一
                            List<Schedulingmanage> list3 = dao.xxSchedulingmanageselect(Integer.parseInt(day1[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());//根据人员id查询请假表
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0){//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32){//循环离职表
                                    Map yLeaveTime1 = dayForWeek.StringDateTime(a32.getyLeaveTime(),null,null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date) yLeaveTime1.get("data"))){//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {//如果此人有请假记录 且 没有销假
                                            for (Leavefor a31 : list31) {//循环请假记录
                                                Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                                    qingjia(a1,list3);//更改请假
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班用户id
                                                    tongji(list3,a1);//更改正常 缺勤 迟到
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班用户id
                                                tongji(list3,a1);//更改正常 缺勤 迟到
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else {
                                        lizhi(a1);//离职
                                    }
                                }
                            }else {
                                //没有离职的人
                                if (list31.size() > 0) {//如果此人有请假记录 且 没有销假
                                    for (Leavefor a31 : list31) {//循环请假记录
                                        Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                            qingjia(a1,list3);//更改请假
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班用户id
                                            tongji(list3,a1);//更改正常 缺勤 迟到
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班用户id
                                        tongji(list3,a1);//更改正常 缺勤 迟到
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }
                        } else if (a2.getMonday().equals("") && zou.equals("1")) {
                            xiuban(a1);//更改成休班
                        }
                    }
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {
                        if (!a2.getTuesday().equals("") && zou.equals("2")) {
                            String[] day2 = a2.getTuesday().split(",");//分割周二
                            List<Schedulingmanage> list4 = dao.xxSchedulingmanageselect(Integer.parseInt(day2[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0) {//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32) {//循环离职表
                                    Map yLeaveTime2 = dayForWeek.StringDateTime(a32.getyLeaveTime(), null, null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date) yLeaveTime2.get("data"))) {//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {
                                            for (Leavefor a31 : list31) {//循环请假
                                                Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                                    qingjia(a1,list4);
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                    tongji(list4,a1);
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                tongji(list4,a1);
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else {
                                        lizhi(a1);//离职
                                    }
                                }
                            }else {
                                if (list31.size() > 0) {
                                    for (Leavefor a31 : list31) {//循环请假
                                        Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                            qingjia(a1,list4);
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                            tongji(list4,a1);
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                        tongji(list4,a1);
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }
                        } else if (a2.getTuesday().equals("") && zou.equals("2")) {
                            xiuban(a1);
                        }
                    }
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {
                        if (!a2.getWednesday().equals("") && zou.equals("3")) {
                            String[] day3 = a2.getWednesday().split(",");//分割周三
                            List<Schedulingmanage> list5 = dao.xxSchedulingmanageselect(Integer.parseInt(day3[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0){//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32){//循环离职表
                                    Map yLeaveTime3 = dayForWeek.StringDateTime(a32.getyLeaveTime(),null,null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date) yLeaveTime3.get("data"))){//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {
                                            for (Leavefor a31 : list31) {//循环请假
                                                Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                                    qingjia(a1,list5);
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                    tongji(list5,a1);
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                tongji(list5,a1);
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else{
                                        lizhi(a1);//离职
                                    }
                                }
                            }else{
                                if (list31.size() > 0) {
                                    for (Leavefor a31 : list31) {//循环请假
                                        Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                            qingjia(a1,list5);
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                            tongji(list5,a1);
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                        tongji(list5,a1);
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }

                        } else if (a2.getWednesday().equals("") && zou.equals("3")) {
                            xiuban(a1);
                        }
                    }
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {
                        if (!a2.getThursday().equals("") && zou.equals("4")) {
                            String[] day4 = a2.getThursday().split(",");//分割周四
                            List<Schedulingmanage> list6 = dao.xxSchedulingmanageselect(Integer.parseInt(day4[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0){//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32){//循环离职表
                                    Map yLeaveTime4 = dayForWeek.StringDateTime(a32.getyLeaveTime(),null,null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date)yLeaveTime4.get("data"))){//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {
                                            for (Leavefor a31 : list31) {//循环请假
                                                Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                                    qingjia(a1,list6);
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                    tongji(list6,a1);
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                tongji(list6,a1);
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else{
                                        lizhi(a1);//离职
                                    }
                                }
                            }else{
                                if (list31.size() > 0) {
                                    for (Leavefor a31 : list31) {//循环请假
                                        Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                            qingjia(a1,list6);
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                            tongji(list6,a1);
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                        tongji(list6,a1);
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }

                        } else if (a2.getThursday().equals("") && zou.equals("4")) {
                            xiuban(a1);
                        }
                    }
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {
                        if (!a2.getFriday().equals("") && zou.equals("5")) {
                            String[] day5 = a2.getFriday().split(",");//分割周五
                            List<Schedulingmanage> list7 = dao.xxSchedulingmanageselect(Integer.parseInt(day5[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0){//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32){//循环离职表
                                    Map yLeaveTime5 = dayForWeek.StringDateTime(a32.getyLeaveTime(),null,null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date) yLeaveTime5.get("data"))){//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {
                                            for (Leavefor a31 : list31) {//循环请假
                                                Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                                    qingjia(a1,list7);
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                    tongji(list7,a1);
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                tongji(list7,a1);
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else{
                                        lizhi(a1);//离职
                                    }
                                }
                            }else{
                                if (list31.size() > 0) {
                                    for (Leavefor a31 : list31) {//循环请假
                                        Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                            qingjia(a1,list7);
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                            tongji(list7,a1);
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                        tongji(list7,a1);
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }
                        } else if (a2.getFriday().equals("") && zou.equals("5")) {
                            xiuban(a1);
                        }
                    }
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {
                        if (!a2.getSaturday().equals("") && zou.equals("6")) {
                            String[] day6 = a2.getSaturday().split(",");//分割周六
                            List<Schedulingmanage> list8 = dao.xxSchedulingmanageselect(Integer.parseInt(day6[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0){//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32){//循环离职表
                                    Map yLeaveTime6 = dayForWeek.StringDateTime(a32.getyLeaveTime(),null,null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date) yLeaveTime6.get("data"))){//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {
                                            for (Leavefor a31 : list31) {//循环请假
                                                Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                                    qingjia(a1,list8);
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                    tongji(list8,a1);
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                tongji(list8,a1);
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else{
                                        lizhi(a1);//离职
                                    }
                                }
                            }else{
                                if (list31.size() > 0) {
                                    for (Leavefor a31 : list31) {//循环请假
                                        Date begin = begin0(a31.getBeginTime());//开始时间退后一天去和考勤日期比较
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {
                                            qingjia(a1,list8);
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                            tongji(list8,a1);
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                        tongji(list8,a1);
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }
                        } else if (a2.getSaturday().equals("") && zou.equals("6")) {
                            xiuban(a1);
                        }
                    }
                    if (a1.getCheckTime().after(DateStart) && a1.getCheckTime().before(DateEnd)) {
                        if (!a2.getSunday().equals("") && zou.equals("7")) {
                            String[] day7 = a2.getSunday().split(",");//分割周日
                            List<Schedulingmanage> list9 = dao.xxSchedulingmanageselect(Integer.parseInt(day7[2]));//根据id查询班次
                            List<Leavefor> list31 = dao.xxLeaveforSelect(a1.getUserId());//请假表
                            List<LeaveApply> list32 = dao.xxleaveapplySelect(a1.getUserId());//根据人员id查询离职表
                            if (list32.size() > 0){//离职日期的数据大于0 说明此人已离职
                                for (LeaveApply a32 : list32){//循环离职表
                                    Map yLeaveTime7 = dayForWeek.StringDateTime(a32.getyLeaveTime(),null,null);//将离职日期转换为日期类型
                                    Date date = new Date(sdf.parse(sdf.format(new Date())).getTime());//获取当前时间
                                    if (a1.getCheckTime().before((Date) yLeaveTime7.get("data"))){//如果当前时间小于离职最后日期 说明没有离职
                                        if (list31.size() > 0) {
                                            for (Leavefor a31 : list31) {
                                                Date begin = begin0(a31.getBeginTime());//排班开始时间退后一天
                                                if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {//考勤日期是否在开始日期和结束日期之间
                                                    qingjia(a1,list9);
                                                } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                    tongji(list9,a1);
                                                }
                                                dao.xxChecksurfaceUpdate(a1);//更改状态
                                            }
                                        } else {
                                            if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                                tongji(list9,a1);
                                            }
                                            dao.xxChecksurfaceUpdate(a1);//更改状态
                                        }
                                    }else{
                                        lizhi(a1);//离职
                                    }
                                }
                            }else{
                                if (list31.size() > 0) {
                                    for (Leavefor a31 : list31) {
                                        Date begin = begin0(a31.getBeginTime());//排班开始时间退后一天
                                        if (a1.getCheckTime().after(begin) && a1.getCheckTime().before(a31.getOverTime())) {//考勤日期是否在开始日期和结束日期之间
                                            qingjia(a1,list9);
                                        } else if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                            tongji(list9,a1);
                                        }
                                        dao.xxChecksurfaceUpdate(a1);//更改状态
                                    }
                                } else {
                                    if (a1.getUserId() == Integer.parseInt(userId[j].toString())) {//判断考勤用户id和排班id
                                        tongji(list9,a1);
                                    }
                                    dao.xxChecksurfaceUpdate(a1);//更改状态
                                }
                            }

                        } else if (a2.getSunday().equals("") && zou.equals("7")) {
                            xiuban(a1);
                        }
                    }
                }

            }
        }
        return list1;
    }
    //判断考勤用户id和排班id
    public void tongji(List<Schedulingmanage> list,Checksurface a1){
        for (Schedulingmanage a3 : list) {
            //System.out.println(a3.getTimeLate1());//获取第一次签到时间  after>   before<
            if (a1.getGoTimeOne() == null) {
                if (a1.getGoTimeOneText() != "请假" && a1.getGoTimeTwoText()==null){
                    a1.setGoTimeOneText("缺勤");
                }else if (!a1.getGoTimeOneText().equals("请假")){
                    a1.setGoTimeOneText("缺勤");
                }
            } else if (a1.getGoTimeOne().before(a3.getTimeLate1()) && a1.getGoTimeOne().after(a3.getDutyTime1())) {//A<j&&A>k判断考勤时间是在班次时间的开始时间和结束时间之间
                if (a1.getGoTimeOneText()!= "请假" && a1.getGoTimeTwoText()==null){
                    a1.setGoTimeOneText("正常");
                }else if (!a1.getGoTimeOneText().equals("请假")){
                    a1.setGoTimeOneText("正常");;
                }
            } else {
                if (a1.getGoTimeOneText()!= "请假"&&a1.getGoTimeTwoText()==null){
                    a1.setGoTimeOneText("缺勤");
                }else if (!a1.getGoTimeOneText().equals("请假")){
                    a1.setGoTimeOneText("缺勤");
                }
            }

            if (a1.getDownTimeOne() == null) {
                if (a1.getDownTimeOneText() != "请假" && a1.getDownTimeOneText()==null){
                    a1.setDownTimeOneText("缺勤");
                }else if (!a1.getDownTimeOneText().equals("请假")){
                    a1.setDownTimeOneText("缺勤");
                }
            } else if (a1.getDownTimeOne().after(a3.getTimeLate2()) && a1.getDownTimeOne().before(a3.getDutyTime2())) {
                if (a1.getDownTimeOneText()!= "请假"&&a1.getDownTimeOneText()==null){
                    a1.setDownTimeOneText("正常");
                }else if (!a1.getDownTimeOneText().equals("请假")){
                    a1.setDownTimeOneText("正常");
                }
            } else {
                if (a1.getDownTimeOneText()!= "请假"&&a1.getDownTimeOneText() == null){
                    a1.setDownTimeOneText("早退");
                }else if (!a1.getDownTimeOneText().equals("请假")){
                    a1.setDownTimeOneText("早退");
                }
            }
            if (a1.getGoTimeTwo() == null) {
                if (a1.getGoTimeTwoText()!="请假"&&a1.getGoTimeTwoText()==null) {
                    a1.setGoTimeTwoText("缺勤");
                }else if (!a1.getGoTimeTwoText().equals("请假")){
                    a1.setGoTimeTwoText("缺勤");
                }
            } else if (a1.getGoTimeTwo().before(a3.getTimeLate3()) && a1.getGoTimeTwo().after(a3.getDutyTime3())) {
                if (a1.getGoTimeTwoText()!= "请假"&&a1.getGoTimeTwoText() == null) {
                    a1.setGoTimeTwoText("正常");
                }else if (!a1.getGoTimeTwoText().equals("请假")){
                    a1.setGoTimeTwoText("正常");
                }
            } else {
                if (a1.getGoTimeTwoText()!= "请假"&&a1.getGoTimeTwoText() == null) {
                    a1.setGoTimeTwoText("缺勤");
                }else if (!a1.getGoTimeTwoText().equals("请假")){
                    a1.setGoTimeTwoText("缺勤");
                }
            }
            if (a1.getDownTimeTwo() == null) {
                if (a1.getDownTimeTwoText()!="请假"&&a1.getDownTimeTwoText()==null) {
                    a1.setDownTimeTwoText("缺勤");
                }else if(!a1.getDownTimeTwoText().equals("请假")){
                    a1.setDownTimeTwoText("缺勤");
                }
            } else if (a1.getDownTimeTwo().after(a3.getTimeLate4()) && a1.getDownTimeTwo().before(a3.getDutyTime4())) {
                if (a1.getDownTimeTwoText()!= "请假"&&a1.getDownTimeTwoText() == null) {
                    a1.setDownTimeTwoText("正常");
                }else if (!a1.getDownTimeTwoText().equals("请假")){
                    a1.setDownTimeTwoText("正常");
                }
            } else {
                if (a1.getDownTimeTwoText()!= "请假"&&a1.getDownTimeTwoText() == null) {
                    a1.setDownTimeTwoText("早退");
                }else if (!a1.getDownTimeTwoText().equals("请假")){
                    a1.setDownTimeTwoText("早退");
                }
            }
        }
    }

    //请假更改状态
    public void qingjia(Checksurface a1,List<Schedulingmanage> list) throws ParseException {
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");//设置日期格式
        Time time = new Time(df.parse(df.format(new Date())).getTime());
        if (time.after(list.get(0).getDutyTime1()) && time.before(list.get(0).getTimeLate1())){
            a1.setGoTimeOneText("请假");
        }else if (time.after(list.get(0).getTimeLate1())){
            a1.setGoTimeOneText("请假");
        }
        if (time.after(list.get(0).getTimeLate2()) && time.before(list.get(0).getDutyTime2())){
            a1.setDownTimeOneText("请假");
        }else if (time.after(list.get(0).getTimeLate2())){
            a1.setDownTimeOneText("请假");
        }
        if (time.after(list.get(0).getDutyTime3()) && time.before(list.get(0).getTimeLate3())){
            a1.setGoTimeTwoText("请假");
        }else if (time.after(list.get(0).getTimeLate3())){
            a1.setGoTimeTwoText("请假");
        }
        if (time.after(list.get(0).getTimeLate4()) && time.before(list.get(0).getDutyTime4())){
            a1.setDownTimeTwoText("请假");
        }else if (time.after(list.get(0).getTimeLate4())){
            a1.setDownTimeTwoText("请假");
        }
        dao.xxChecksurfaceUpdate(a1);//更改状态
    }
    //休班更改状态
    public void xiuban(Checksurface a1){
        a1.setGoTimeOneText("休班");
        a1.setDownTimeOneText("休班");
        a1.setGoTimeTwoText("休班");
        a1.setDownTimeTwoText("休班");
        dao.xxChecksurfaceUpdate(a1);//更改状态
    }
    //离职更改状态
    public void lizhi(Checksurface a1){
        a1.setGoTimeOneText("离职");
        a1.setDownTimeOneText("离职");
        a1.setGoTimeTwoText("离职");
        a1.setDownTimeTwoText("离职");
        dao.xxChecksurfaceUpdate(a1);//更改状态
    }


    /*统计考勤*/
    @Override
    @Transactional
    public Map gotime1(Integer userId,int sid,String begin,String end) {
        Map map = new HashMap();
        /*第一次签到；第一次签退*/
        int go11 = dao.CheckGoOne1(userId,begin,end,null);int dow11 = dao.CheckDownOne1(userId,begin,end,null);//正常
        int go12 = dao.CheckGoOne2(userId,begin,end,null);int dow12 = dao.CheckDownOne2(userId,begin,end,null);//缺勤
        int go13 = dao.CheckGoOne3(userId,begin,end,null);int dow13 = dao.CheckDownOne3(userId,begin,end,null);//早退
        int go14 = dao.CheckGoOne4(userId,begin,end,null);int dow14 = dao.CheckDownOne4(userId,begin,end,null);//早退
        /*第二次签到；第二次签退*/
        int go21 = dao.CheckGoTwo1(userId,begin,end,null);int dow21 = dao.CheckDownTwo1(userId,begin,end,null);
        int go22 = dao.CheckGoTwo2(userId,begin,end,null);int dow22 = dao.CheckDownTwo2(userId,begin,end,null) ;
        int go23 = dao.CheckGoTwo3(userId,begin,end,null);int dow23 = dao.CheckDownTwo3(userId,begin,end,null);
        int go24 = dao.CheckGoTwo4(userId,begin,end,null);int dow24 = dao.CheckDownTwo4(userId,begin,end,null);

        //Integer qingjia = dao.Leaveforqingjia(userId, begin, end,null);//请假次数

        int zhengchang = go11+dow11+go21+dow21;//计算出正常
        int queqin = go12+dow12+go22+dow22;//计算出缺勤
        int zaotui = go13+dow13+go23+dow23;//计算出早退
        int qingjia = go14+dow14+go24+dow24;//计算出早退
        int zong = go11+dow11+go12+dow12+go13+dow13+go21+dow21+go22+dow22+go23+dow23;//查询总打卡次数 不打卡无数据
        int jid = 1;//判断执行动态sql语句的条件
        List<Checksurface> list = dao.xxChecksurfaceSelect(sid,jid,null);//查询统计人员信息
        map.put("zhengchang",zhengchang);//计算出正常
        map.put("queqin",queqin);//计算出缺勤
        map.put("zaotui",zaotui);//计算出早退
        map.put("list",list);
        map.put("zong",zong);//查询总打卡次数 不打卡无数据
        map.put("qingjia",qingjia);//请假次数
        return map;
    }

    /*导入添加考勤*/
    @Override
    public int xxChecksurfaceInsert(Checksurface checksurface) {
        return dao.xxChecksurfaceInsert(checksurface);
    }

    /*考勤统计*/
    @Override
    public List<Map<String, Object>> xxkaoqintongji(int id,String name) {
        return dao1.xxkaoqintongji(id,name);
    }
    /*考勤明细*/
    @Override
    public List<Map<String, Object>> xxmingxi(Checksurface checksurface) {
        return dao1.xxmingxi(checksurface);
    }












    //时间往前退一天
    public Date begin0(Date b){
        calendar.setTime(b);
        calendar.add(calendar.DATE, -1);//日期向后+1天，整数往后推，负数向前推
        Date begin = calendar.getTime();//这个时间就是日期向前推一天的结果
        return  begin;
    }
    //时间往前后一天
    public Date over0(Date o){
        calendar.setTime(o);
        calendar.add(calendar.DATE, 1);//日期向后+1天，整数往后推，负数向前推
        Date over = calendar.getTime();//这个时间就是日期向前推一天的结果
        return over;
    }

}
