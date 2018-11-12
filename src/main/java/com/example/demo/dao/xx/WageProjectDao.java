package com.example.demo.dao.xx;

import com.example.demo.entity.Compantpersonage;
import com.example.demo.entity.Wagelevel;
import com.example.demo.entity.Wageproject;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface WageProjectDao {

    /*查询薪酬项目*/
    @Select("select * from wageproject as w,projecttype as p where p.ProjectTypeId=w.ProjectTypeId")
    List<Map> xxWageprojectSelect();
    /*查询薪酬项目类型*/
    @Select("select * from Projecttype")
    List<Map> xxProjecttypeSelect();
    /*添加薪酬项目*/
    @Insert("insert into Wageproject(ProjectTypeId,ProjectName,ProjectId,ISCOMPUTER,FORMULA,ISPRINT,ISREPORT) " +
            "values (#{projectTypeId},#{projectName},#{projectId},#{iscomputer},#{formula},#{isprint},#{isreport})")
    int xxWageprojectInsert(Wageproject wageproject);
    /*编辑薪酬项目*/
    @Update("update Wageproject set ProjectName = #{projectName},ProjectTypeId = #{projectTypeId}" +
            " where WageProjectId = #{wageProjectId}")
    int xxWageprojectUpdate(Wageproject wageproject);
    /*删除薪酬项目*/
    @Update("delete from Wageproject where WageProjectId = #{wageProjectId}")
    int xxWageprojectDelete(Wageproject wageproject);
    /*保险系数查询*/
    @Select("SELECT c.CompantPersonagId,c.yanglaogr as a0,c.yanglaodw as a1,c.yiliaogr as a2," +
            "c.yiliaodw as a3,c.shiyege as a4,c.shiyedw as a5,c.zhufangge as a6,c.zhufangdw as a7," +
            "c.gongshangdw as a8,c.shengyudw as a9 from compantpersonage as c")
    List<Map> xxCompantpersonageSelect();
    /*更改保险基数*/
    @Update("update Compantpersonage set yanglaogr = #{yanglaogr},yanglaodw = #{yanglaodw},yiliaogr=#{yiliaogr}," +
            "yiliaodw=#{yiliaodw},shiyege=#{shiyege},shiyedw=#{shiyedw},zhufangge=#{zhufangge},zhufangdw=#{zhufangdw}," +
            "gongshangdw=#{gongshangdw},shengyudw=#{shengyudw} " +
            "where CompantPersonagId = #{compantPersonagId} ")
    int xxCompantpersonageUpdate(Compantpersonage compantpersonage);
    /*查询工资基础*/
    @Select("<script>select w.*,u.* from Wagelevel as w, usersurface as u where w.UserId = u.UserId " +
            "<if test = 'userid > 0'> and w.UserId = #{userid} </if>" +
            "<if test = 'name != null and name != \"\" '> and w.time = #{name} </if>" +
            " </script>")
    List<Map> xxWagelevelSelect(@Param("userid") Integer userid, @Param("name") String name);
    /*添加工资基础*/
    @Insert("<script>insert into Wagelevel(UserId,BasePay,Subsidy,Bonus,RoomSupplement,CarSupplement,EndowmentIns,Time" +
            "<if test='medicalIns != null'>,MedicalIns,</if>" +
            "<if test='housingFund != null'>HousingFund,</if>" +
            "<if test='unemploymentIns != null'>UnemploymentIns,</if>" +
            "<if test='employmentIns != null'>EmploymentIns,</if>" +
            "<if test='maternityIns != null'>MaternityIns,</if>" +
            "<if test='wone != null'>Wone,</if>" +
            "<if test='wtwo != null'>Wtwo,</if>" +
            "<if test='wthree != null'>Wthree,</if>" +
            "<if test='wfour != null'>Wfour,</if>" +
            "<if test='wfive != null'>Wfive </if>" +
            ") values (#{userId},#{basePay},#{subsidy},#{bonus},#{roomSupplement},#{carSupplement},#{endowmentIns},#{time}" +
            "<if test='medicalIns != null'>,#{medicalIns},</if>" +
            "<if test='housingFund != null'>#{housingFund},</if>" +
            "<if test='unemploymentIns != null'>#{unemploymentIns},</if>" +
            "<if test='employmentIns != null'>#{employmentIns},</if>" +
            "<if test='maternityIns != null'>#{maternityIns},</if>" +
            "<if test='wone != null'>#{wone},</if>" +
            "<if test='wtwo != null'>#{wtwo},</if>" +
            "<if test='wthree != null'>#{wthree},</if>" +
            "<if test='wfour != null'>#{wfour},</if>" +
            "<if test='wfive != null'>#{wfive}</if>" +
            ")</script>")
    int xxWagelevelInsert(Wagelevel wagelevel);


    //int a(Wagelevel wagelevel);
}
