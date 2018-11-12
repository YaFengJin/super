package com.example.demo.dao.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitPlan;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface PlanDao {
    //添加招聘计划
    @Insert(
            "insert into recruit_Plan" +
            "(PlanName,RecruitTrench,EstimatedCost,BeginTime," +
            "EndTime,RecruitNumber,RecruitState,RecruitRemak," +
            "RecruitAccess,UserId,PlanState,applyUserId)" +
            "values(#{planName},#{recruitTrench},#{estimatedCost},#{beginTime},#{endTime}," +
            "#{recruitNumber},#{recruitState},#{recruitRemak},#{recruitAccess},#{userId},'未审核',#{applyUserId})"
            )
    int savePlan(RecruitPlan recruitPlan);
    //查询部门里的用户
    @Select("<script>" +
            "select " +
            "u.UserId as id,u.UserName as name" +
            " from dept d ,usersurface u " +
            "where d.DeptId=u.DeptId and d.DeptId in" +
            "(" +
            "<foreach collection='list' item='item'  separator=','>" +
            " #{item.deptid}" +
            "</foreach>" +
            ")" +
            "</script>")
    List<Map<String,Object>>queryDpetUser(List<Dept>list);
    //查询招聘计划
    @Select("SELECT" +
            "    r.recruit_planid as id,r.PlanName as name,r.PlanState as state," +
            "r.RecruitTrench as trench,r.EstimatedCost as cost,r.BeginTime as begintime," +
            "r.EndTime as endtime,r.RecruitNumber as number,r.RecruitState as rstate," +
            "r.RecruitRemak as remak,r.RecruitAccess as access," +
            "r.UserId as uid,u.UserName as uname," +
            "r.ApplyUserId as applyUid,t.UserName as applyUname " +
            "FROM" +
            " (SELECT * FROM usersurface) AS u" +
            " right join recruit_plan r ON u.UserId = r.UserId " +
            " left join usersurface t ON t.UserId = r.ApplyUserId")
    List<Map<String,Object>>queryPlanUser();

    //修改招聘计划
    @Update("<script>" +
            "update recruit_plan  " +
            "<set>" +
            "<if test='planName!=null and planName!=\"\"'>" +
            "   PlanName=#{planName}," +
            "</if>" +
            " <if test='recruitNumber>0'>" +
            "   RecruitNumber=#{recruitNumber}," +
            "</if>" +
            " <if test='estimatedCost>0'>" +
            "   EstimatedCost=#{estimatedCost}," +
            "</if>" +
            " <if test='beginTime!=null and beginTime!=\"\"'>" +
            "   BeginTime=#{beginTime}," +
            "</if>" +
            " <if test='endTime!=null and endTime!=\"\"'>" +
            "   EndTime=#{endTime}," +
            "</if>" +
            " <if test='recruitState!=null and recruitState!=\"\"'>" +
            "   RecruitState=#{recruitState}," +
            "</if>" +
            " <if test='recruitRemak!=null and recruitRemak!=\"\"'>" +
            "   RecruitRemak=#{recruitRemak}," +
            "</if>" +
            " <if test='userId>0'>" +
            "   UserId=#{userId}" +
            "</if>" +
            "</set>" +
            " where Recruit_PlanId=#{recruitPlanId}" +
            "</script>")
    int updatePlan(RecruitPlan plan);

    //删除招聘计划
    @Delete("delete from recruit_plan where Recruit_PlanId=#{id}")
    int deletePlan(@Param("id") int id);

    //招聘计划审批(批准)
    @Update("update recruit_plan set PlanState='以批准' where Recruit_PlanId=#{id}")
    int ApplyPlan(@Param("id") int id);
    //招聘计划审批(不批准)
    @Update("update recruit_plan set PlanState='未批准' where Recruit_PlanId=#{id}")
    int ApplyNotPlan(@Param("id") int id);
}
