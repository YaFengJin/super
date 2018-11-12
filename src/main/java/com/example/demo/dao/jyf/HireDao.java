package com.example.demo.dao.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitHire;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface HireDao {
    //查询部门
    @Select("<script>" +
            "select " +
            "d.deptid as id,d.deptName as name" +
            " from dept d  " +
            "where d.DeptId in" +
            "(" +
            "<foreach collection='list' item='item'  separator=','>" +
            " #{item.deptid}" +
            "</foreach>" +
            ")" +
            "</script>")
    List<Map<String, Object>> queryDeptOne(List<Dept> list);

    //查询员工类型
    @Select("select e.Emp_TypeId as id,e.Emp_TypeName as name from emp_type as e")
    List<Map<String, Object>> queryEmpType();

    //新增招聘录用
    @Insert("insert into recruit_hire" +
            "(" +
            "DictionariesId,TalentsId,Recruit_PlanId,DeptId,UserId,OaName,HireTime,Emp_TypeName," +
            "AdminClass,Duty,OfficialEntryTime,OfficialWorkTime,Recruit_HireRemark" +
            ")" +
            "values" +
            "(" +
            "#{dictionariesId},#{talentsId},#{recruitPlanId},#{deptId},#{userId},#{oaName}," +
            "#{hireTime},#{empTypeName},#{adminClass},#{duty},#{officialEntryTime}," +
            "#{officialWorkTime},#{recruitHireRemark}" +
            ")")
    int saveRecruitHire(RecruitHire hire);

    //查询招聘录用信息
    @Select("select " +
            "r.Recruit_HireId as id,t.TalentsId as tid,t.TalentsName as tname," +
            "p.Recruit_PlanId as pid,p.PlanName as pname,d.DictionariesId as did," +
            "d.DictionariesName as dname,dt.DeptId as deptid,dt.DeptName as deptname," +
            "u.UserId as uid,u.UserName as uname,r.OaName as oaname,r.HireTime as hireTime," +
            "et.Emp_TypeId as typeid,et.Emp_TypeName as typename,r.AdminClass as adminClass," +
            "r.Duty as duty,r.OfficialEntryTime as begintime,r.OfficialWorkTime as endtime," +
            "r.Recruit_HireRemark as remark " +
            "from recruit_hire as r  " +
            "JOIN dictionaries as d on r.DictionariesId=d.dictionariesId " +
            "JOIN talents as t on t.TalentsId=r.TalentsId " +
            "JOIN recruit_plan as p on p.Recruit_PlanId=r.Recruit_PlanId " +
            "JOIN dept as dt on dt.DeptId=r.DeptId " +
            "JOIN usersurface as u on u.UserId=r.UserId " +
            "JOIN emp_type as et on et.emp_typeid=r.emp_typename")
    List<Map<String, Object>> queryRecruitHire();

    //修改招聘录用信息
    @Update("<script>" +
            "update recruit_hire " +
            "<set>" +
            "   <if test='dictionariesId>0'>" +
            "       dictionariesId=#{dictionariesId}," +
            "   </if>" +
            "   <if test='talentsId>0'>" +
            "       talentsId=#{talentsId}," +
            "   </if>" +
            "   <if test='recruitPlanId>0'>" +
            "       recruit_PlanId=#{recruitPlanId}," +
            "   </if>" +
            "   <if test='deptId>0'>" +
            "       deptId=#{deptId}," +
            "   </if>" +
            "   <if test='userId>0'>" +
            "       userId=#{userId}," +
            "   </if>" +
            "   <if test='oaName!=null and oaName!=\"\"'>" +
            "       oaName=#{oaName}," +
            "   </if>" +
            "   <if test='hireTime!=null and hireTime!=\"\"'>" +
            "       hireTime=#{hireTime}," +
            "   </if>" +
            "   <if test='empTypeName>0'>" +
            "       Emp_TypeName=#{empTypeName}," +
            "   </if>" +
            "   <if test='adminClass!=null and adminClass!=\"\"'>" +
            "       adminClass=#{adminClass}," +
            "   </if>" +
            "   <if test='duty!=null and duty!=\"\"'>" +
            "       duty=#{duty}," +
            "   </if>" +
            "   <if test='officialEntryTime!=null and officialEntryTime!=\"\"'>" +
            "       officialEntryTime=#{officialEntryTime}," +
            "   </if>" +
            "   <if test='officialWorkTime!=null and officialWorkTime!=\"\"'>" +
            "       officialWorkTime=#{officialWorkTime}," +
            "   </if>" +
            "   <if test='recruitHireRemark!=null and recruitHireRemark!=\"\"'>" +
            "       Recruit_HireRemark=#{recruitHireRemark}" +
            "   </if>" +
            "</set>" +
            "  where Recruit_HireId=#{recruitHireId}" +
            "</script>")
    int updateRecruitHire(RecruitHire recruitHire);
}
