package com.example.demo.service.xmt;

import java.util.List;
import java.util.Map;

public interface filingService {
    //查询文件柜
    List<Map<String,Object>> queryfiling();
    //查看子目录
    List<Map<String,Object>>queryChildFiling(int id);
}
