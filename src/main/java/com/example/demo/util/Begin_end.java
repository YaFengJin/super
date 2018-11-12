package com.example.demo.util;

import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class Begin_end {
    Calendar c_begin=new GregorianCalendar();
    Calendar c_end=new GregorianCalendar();
    DateFormatSymbols dfs = new DateFormatSymbols();
    String[] weeks = dfs.getWeekdays();
    String week="";
    public  String  dateforweek(int year,int month,int day,int year1,int month1,int day1){
        c_begin.set(year,month,day);
        c_end.set(year1,month1,day1);
        c_end.add(Calendar.DAY_OF_YEAR, 1);
        while (c_begin.before(c_end)) {
            week+=weeks[c_begin.get(Calendar.DAY_OF_WEEK)]+",";
            c_begin.add(Calendar.DAY_OF_YEAR, 1);
        }
        return week;
    }
}
