package com.example.demo.dao.jyf;

import com.example.demo.entity.RecruitScreen;
import org.apache.ibatis.annotations.*;
import java.util.List;
import java.util.Map;

public interface ScreenDao {
     //查询招聘者姓名和id
    @Select("select t.TalentsId as id,t.TalentsName as name  from talents as t,recruit_plan as r \n" +
            "where t.Recruit_PlanId=r.Recruit_PlanId")
    List<Map<String,Object>> queryTalentsName();
    //通过招聘者id查询其他信息
    @Select("select t.TalentsId as id,p.Recruit_PlanId as pid,p.PlanName as pname," +
            "t.TalentsPhone as phone,d1.DictionariesId as id1,d2.DictionariesId as id2," +
            "d1.DictionariesName as name1,d2.DictionariesName as name2 " +
            " from  talents as  t    " +
            "join dictionaries as d1 on d1.DictionariesId = t.DictionariesId    " +
            "join dictionaries as d2 on d2.DictionariesId=t.Dic_DictionariesId " +
            "join recruit_plan as p  on t.Recruit_PlanId=p.Recruit_PlanId and t.TalentsId=#{id}")
    List<Map<String,Object>>queryTalents(@Param("id") int id);
    //添加招聘筛选
    @Insert("insert into recruit_screen" +
            "(TalentsId,Recruit_PlanId,UserId,Recruit_ScreeName,ScreenTime,ScreenState)" +
            "values(#{talentsId},#{recruitPlanId},#{userId},#{recruitScreeName},#{screenTime},'待筛选')")
    int saveScreen(RecruitScreen screen);
    //查询招聘筛选
    @Select("select s.Recruit_ScreenId as id,s.Recruit_ScreeName as name,u.UserId as uid," +
            "u.UserName as uname,s.ScreenTime as time,s.ScreenState as state," +
            "t.TalentsId as tid,t.TalentsName as tname," +
            "p.Recruit_PlanId as pid,p.PlanName as pname,t.TalentsPhone as phone," +
            "d1.DictionariesName as name1,d2.DictionariesName as name2" +
            " from  recruit_screen s    " +
            "join talents as  t   on s.TalentsId=t.TalentsId " +
            "join dictionaries as d1 on d1.DictionariesId = t.DictionariesId    " +
            "join dictionaries as d2 on d2.DictionariesId=t.Dic_DictionariesId " +
            "join recruit_plan as p  on t.Recruit_PlanId=p.Recruit_PlanId " +
            "join usersurface as u on s.UserId=u.UserId")
    List<Map<String,Object>>queryScreen();
    //修改招聘筛选
    @Update("<script>" +
            "update recruit_screen " +
            "<set>" +
            "<if test='talentsId>0'>" +
            " TalentsId=#{talentsId}," +
            "</if>" +
            "<if test='recruitPlanId>0'>" +
            " Recruit_PlanId=#{recruitPlanId}," +
            "</if>" +
            "<if test='userId>0'>" +
            " UserId=#{userId}," +
            "</if>" +
            "<if test='recruitScreeName!=null and recruitScreeName!=\"\"'>" +
            " Recruit_ScreeName=#{recruitScreeName}," +
            "</if>" +
            "<if test='screenTime!=null and screenTime!=\"\"'>" +
            " ScreenTime=#{screenTime}," +
            "</if>" +
            "<if test='screenState!=null and screenState!=\"\"'>" +
            " ScreenState=#{screenState}" +
            "</if>" +
            "</set>" +
            " where Recruit_ScreenId=#{recruitScreenId}" +
            "</script>")
    int updateScreen(RecruitScreen screen);
    //删除招聘筛选
    @Delete("delete from recruit_screen where Recruit_ScreenId=#{id}")
    int deleteScreen(@Param("id") int id);
    //修改状态(通过)
    @Update("update recruit_screen set screenState='以通过'  where Recruit_ScreenId=#{id}")
    int updateScreenStateSuccess(@Param("id")int id);
    //修改状态(失败)
    @Update("update recruit_screen set screenState='未通过'  where Recruit_ScreenId=#{id}")
    int updateScreenStateFile(@Param("id")int id);
}
