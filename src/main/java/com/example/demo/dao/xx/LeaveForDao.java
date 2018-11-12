package com.example.demo.dao.xx;

import com.example.demo.entity.Leavefor;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface LeaveForDao {
    /*根据登陆人员查询出请假记录*/
    @Select("<script>SELECT l.*,u.UserName as useid,uu.UserName as RatyUse FROM leavefor as l " +
            "<if test = 'leaveForId == 1'> LEFT JOIN usersurface AS u on l.UserId = u.UserId LEFT JOIN usersurface AS uu on l.RatyfyUser = uu.UserId where 1 = 1</if>" +
            "<if test = 'leaveForId > 1'> LEFT JOIN usersurface AS u on l.UserId = u.UserId LEFT JOIN usersurface AS uu on l.RatyfyUser = uu.UserId  where l.UserId = #{leaveForId}</if>" +
            "</script>")
    List<Map> xxLeaveForSelect(Leavefor leaveFor);
    /*添加请假*/
    @Insert("insert into leavefor(LeaveNumber,UserId,RatyfyUser,BeginTime,OverTime,LeaveTime,ForCause,LeaveState,LeaveType) VALUES (" +
            "#{leaveNumber},#{userId},#{ratyfyUser},#{beginTime},#{overTime},#{leaveTime},#{forCause},#{leaveState},#{leaveType}" +
            ")")
    int xxLeaveForInsert(Leavefor leaveFor);
    /*更改状态*/
    @Update("<script> update leavefor set LeaveState = #{leaveState}" +
            "<if test='gender != null and gender != \"\" '>,Gender = #{gender}</if>" +
            "where Leave_ForId = #{leaveForId}" +
            "</script>")
    int xxLezveForUpdate(Leavefor leaveFor);
    /*更改请假*/
    @Update("<script>update leavefor set" +
            "<if test='userId != null and userId != \"\" '> UserId = #{userId},</if>" +
            "<if test='ratyfyUser != null and ratyfyUser != \"\" '> RatyfyUser=#{ratyfyUser},</if>" +
            "<if test='beginTime != null and beginTime != \"\" '> BeginTime=#{beginTime},</if>" +
            "<if test='overTime != null and overTime != \"\" '> OverTime=#{overTime},</if>" +
            "<if test='leaveTime != null and leaveTime != \"\" '> LeaveTime = #{leaveTime},</if>" +
            "<if test='forCause != null and forCause != \"\" '> ForCause=#{forCause},</if>" +
            "<if test='leaveType != null and leaveType != \"\" '> LeaveType=#{leaveType},</if>" +
            "<if test='leaveNumber != null and leaveNumber != \"\" '> LeaveNumber=#{leaveNumber}</if>" +
            "where Leave_ForId = #{leaveForId}</script>")
    int xxLezveForUpdate1(Leavefor leaveFor);
    /*删除请假*/
    @Delete("delete from leavefor where Leave_ForId = #{leaveForId}")
    int xxLezveForDelete(Leavefor leaveFor);



}
