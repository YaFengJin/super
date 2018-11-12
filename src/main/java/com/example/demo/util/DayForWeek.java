package com.example.demo.util;

import javax.xml.crypto.Data;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DayForWeek {

    //计算日期对应的周几
    public String dayForWeek(String pTime) throws Throwable {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date tmpDate = format.parse(pTime);
        Calendar cal = Calendar.getInstance();
        String[] weekDays = { "7", "1", "2", "3", "4", "5", "6" };
        try {
            cal.setTime(tmpDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0){w = 0;}
        return weekDays[w];
    }
    public Long DayForSecond(String beginsource,String endsource) throws ParseException {
        SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date begin=dfs.parse(beginsource);
        Date end = dfs.parse(endsource);
        long between=(end.getTime()-begin.getTime())/1000;
        //除以1000是为了转换成秒
        long day1=between/(24*3600);//天
        long hour1=between%(24*3600)/3600;//小时
        long minute1=between%3600/60;//分
        long second1=between%60/60;//秒
        return between;
    }


    //字符串转日期类型
    public Map StringDateTime(String date,String time,String datetime) throws ParseException {
        Map map = new HashMap();
        Date date1 = null;
        Time time1 = null;
        Date datetime1 = null;
        if (date != null) {
            SimpleDateFormat dfd = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            date1 = new Date(dfd.parse(date).getTime());
        }
        if (time != null) {
            SimpleDateFormat dft = new SimpleDateFormat("HH:mm:ss");//设置时间格式
            time1 = new Time(dft.parse(time).getTime());
        }
        if (datetime != null) {
            SimpleDateFormat dfdt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期时间格式
            datetime1 = new Date(dfdt.parse(datetime).getTime());
        }
        map.put("data",date1);
        map.put("time",time1);
        map.put("datetime",datetime1);
        return map;
    }
    //时间往前退一天
    public Date begin0(Date b){
        Calendar calendar = Calendar.getInstance();//计算开始时间
        calendar.setTime(b);
        calendar.add(calendar.DATE, -1);//日期向后+1天，整数往后推，负数向前推
        Date begin = calendar.getTime();//这个时间就是日期向前推一天的结果
        return  begin;
    }
    //时间往前后一天
    public Date over0(Date o){
        Calendar calendar = Calendar.getInstance();//计算开始时间
        calendar.setTime(o);
        calendar.add(calendar.DATE, 1);//日期向后+1天，整数往后推，负数向前推
        Date over = calendar.getTime();//这个时间就是日期向前推一天的结果
        return over;
    }

}
