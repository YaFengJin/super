package com.example.demo.service.xx;

import com.example.demo.entity.Arrangemanage;
import com.example.demo.entity.Schedulingmanage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface XxService {
    /*班次分页模糊条件查询*/
    List<Map<String,Object>> select(int page, int limit, String schedulingName);
    /*班次添加*/
    int xxinsert(Schedulingmanage s);
    /*更改班次*/
    int xxupdate(Schedulingmanage s);
    /*删除班次*/
    int xxdelete(int schedulingManagId);
    /*查询排班*/
    List<Map<String,Object>> xxArrangemanageselect();
    /*查询排班*/
    List<Map<String,Object>> xxArrangemanageselect1(int id);
    /*更改排班状态*/
    int xxArrangemanageupdate(Arrangemanage a);
    /*根据班次类型id查班次类型数据*/
    List<Map<String,Object>> xxSchedulingmanageselect(@Param("sid") int sid);
    /*添加排班表数据*/
    int xxArrangemanageinsert(Arrangemanage a);
    /*删除排班*/
    int xxArrangemanagedelete(Arrangemanage a);
    /*编辑排班*/
    int xxArrangemanageupdate1(Arrangemanage a);

}
