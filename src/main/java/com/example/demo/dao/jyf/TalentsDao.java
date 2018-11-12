package com.example.demo.dao.jyf;

import com.example.demo.entity.Talents;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface TalentsDao {
      //查询基础数据字典表(学历)
    @Select("select d.DictionariesId as id,d.DictionariesName as name,d.DictionariesTypeName as tname " +
            " from dictionaries as d where d.DictionariesTypeName='学历'")
    List<Map<String,Object>> queryDictionariesName1();
    //查询基础数据字典表(所学专业)
    @Select("select d.DictionariesId as id,d.DictionariesName as name,d.DictionariesTypeName as tname " +
            " from dictionaries as d where d.DictionariesTypeName='所学专业'")
    List<Map<String,Object>> queryDictionariesName2();
    //查询基础数据字典表(期望岗位)
    @Select("select d.DictionariesId as id,d.DictionariesName as name,d.DictionariesTypeName as tname " +
            " from dictionaries as d where d.DictionariesTypeName='期望岗位'")
    List<Map<String,Object>> queryDictionariesName3();
    //查询招聘计划
    @Select("select r.Recruit_PlanId as id,r.PlanName as name from recruit_plan as r")
    List<Map<String,Object>> queryPlanName();
    //人才库录入
    @Insert("insert into talents(Recruit_PlanId,DictionariesId,Dic_DictionariesId,Dic_DictionariesId2,TalentsName," +
            "TalentsGender,TalentsBrithday,TalentsPhone," +
            "TalentsEmali,ExpectWork,ExpectWage,WorkExper,TalentsResume)" +
            "VALUES(#{recruitPlanId},#{dictionariesId},#{dicDictionariesId}," +
            "#{dicDictionariesId2},#{talentsName},#{talentsGender},#{talentsBrithday}," +
            "#{talentsPhone},#{talentsEmali},#{expectWork},#{expectWage}," +
            "#{workExper},#{talentsResume}" +
            ")")
    int saveTalents(Talents talents);
    //查询人才库
    @Select("select t.TalentsId as id,p.Recruit_PlanId as pid,p.PlanName as pname," +
            "t.TalentsName as name,t.TalentsGender as gender,t.TalentsBrithday as birthday," +
            "t.TalentsPhone as phone,t.TalentsEmali as email," +
            "t.ExpectWage as wage,t.ExpectWork as work," +
            "t.WorkExper as exper,t.TalentsResume as resume," +
            "d1.DictionariesId  as id1,d1.DictionariesName as name1," +
            "d2.DictionariesId  as id2,d2.DictionariesName as name2," +
            "d3.DictionariesId  as id3,d3.DictionariesName as name3 " +
            "from  talents as  t   " +
            "join dictionaries as d1 on d1.DictionariesId = t.DictionariesId    " +
            "join dictionaries as d2 on d2.DictionariesId=t.Dic_DictionariesId " +
            "join dictionaries as d3 on d3.DictionariesId=t.Dic_DictionariesId2 " +
            "join recruit_plan as p  on t.Recruit_PlanId=p.Recruit_PlanId ")
    List<Map<String,Object>>queryTalents();
    //修改人才库
    @Update("<script>" +
            "update talents  " +
            "<set>" +
            "<if test='recruitPlanId>0'>" +
            "  Recruit_PlanId=#{recruitPlanId}," +
            "</if>" +
            "<if test='dictionariesId>0'>" +
            "  DictionariesId=#{dictionariesId}," +
            "</if>" +
            "<if test='dicDictionariesId>0'>" +
            "  Dic_DictionariesId=#{dicDictionariesId}," +
            "</if>" +
            "<if test='dicDictionariesId2>0'>" +
            "  Dic_DictionariesId2=#{dicDictionariesId2}," +
            "</if>" +
            "<if test='talentsName!=null and talentsName!=\"\"'>" +
            "  TalentsName=#{talentsName}," +
            "</if>" +
            "<if test='talentsGender!=null and talentsName!=\"\"'>" +
            "  TalentsGender=#{talentsGender}," +
            "</if>" +
            "<if test='talentsBrithday!=null and talentsName!=\"\"'>" +
            "  TalentsBrithday=#{talentsBrithday}," +
            "</if>" +
            "<if test='talentsPhone!=null and talentsName!=\"\"'>" +
            "  TalentsPhone=#{talentsPhone}," +
            "</if>" +
            "<if test='talentsEmali!=null and talentsName!=\"\"'>" +
            "  TalentsEmali=#{talentsEmali}," +
            "</if>" +
            "<if test='expectWork!=null and talentsName!=\"\"'>" +
            "  ExpectWork=#{expectWork}," +
            "</if>" +
            "<if test='expectWage>0'>" +
            "  ExpectWage=#{expectWage}," +
            "</if>" +
            "<if test='workExper!=null and talentsName!=\"\"'>" +
            "  WorkExper=#{workExper}," +
            "</if>" +
            "<if test='talentsResume!=null and talentsResume!=\"\"'>" +
            "  TalentsResume=#{talentsResume} " +
            "</if>" +
            "</set>" +
            "where TalentsId=#{talentsId}" +
            "</script>")
    int updateTalents(Talents talents);
    //删除人才库
    @Delete("delete from talents where TalentsId=#{id}")
    int deleteTalents(@Param("id") int id);
}
