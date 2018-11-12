package com.example.demo.util;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class Begin_end {
    Calendar c_begin=new GregorianCalendar();
    Calendar c_end=new GregorianCalendar();
    DateFormatSymbols dfs = new DateFormatSymbols();     //封装可本地化的日期-时间格式化数据
    String[] weeks = dfs.getWeekdays();     // 获得星期几字符串
    String week="";
    public  String  dateforweek(int year,int month,int day,int year1,int month1,int day1){
        c_begin.set(year,month,day);
        c_end.set(year1,month1,day1);
        c_end.add(Calendar.DAY_OF_YEAR, 1);          //结束日期下滚一天是为了包含最后一天
        while (c_begin.before(c_end)) {
            week+=weeks[c_begin.get(Calendar.DAY_OF_WEEK)]+",";
            c_begin.add(Calendar.DAY_OF_YEAR, 1);
        }
        return week;
    }
}
