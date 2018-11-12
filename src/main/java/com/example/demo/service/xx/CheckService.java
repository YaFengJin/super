package com.example.demo.service.xx;

import com.example.demo.entity.Checksurface;

import java.util.List;
import java.util.Map;

public interface CheckService {
    /*查询考勤记录*/
    List<Checksurface> xxChecksurfaceSelect() throws Throwable;
    /*统计考勤记录*/
    Map gotime1(Integer userId, int sid, String begin, String end);
    /*导入添加考勤*/
    int xxChecksurfaceInsert(Checksurface checksurface);
    /*考勤统计*/
    List<Map<String, Object>> xxkaoqintongji(int id, String name);
    /*考勤明细*/
    List<Map<String,Object>> xxmingxi(Checksurface checksurface);


}
