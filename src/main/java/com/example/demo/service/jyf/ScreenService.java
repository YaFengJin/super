package com.example.demo.service.jyf;

import com.example.demo.entity.RecruitScreen;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ScreenService {
    //查询招聘者姓名和id
    List<Map<String,Object>> queryTalentsName();
    //通过招聘者id查询其他信息
    List<Map<String,Object>>queryTalents(int id);
    //添加招聘筛选
    int saveScreen(RecruitScreen screen);
    //查询招聘筛选
    List<Map<String,Object>>queryScreen();
    //修改招聘筛选
    int updateScreen(RecruitScreen screen);
    //删除招聘筛选
    int deleteScreen(int id);
    //修改状态(通过)
    int updateScreenStateSuccess(int id);
    //修改状态(失败)
    int updateScreenStateFile(int id);
}
