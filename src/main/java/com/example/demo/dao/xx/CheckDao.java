package com.example.demo.dao.xx;

import com.example.demo.entity.*;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface CheckDao {
    /*查询考勤记录&gt;大于号  &lt;小于号*/
    @Select("<script>SELECT c.* FROM checksurface as c , usersurface as u where c.UserId = u.UserId " +
            "<if test = 'sid > 0 and jid == 1'>" +
            " AND c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d') " +
            " AND c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d')" +
            " and c.UserId = #{sid} GROUP BY c.UserId </if>" +
            "<if test = 'sid == 1 and jid == 0'> and 1=1 " +
            " AND c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d') " +
            " AND c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d')" +
            "</if>" +
            "<if test = 'sid == 1 and jid == 0 and month != null and month != \"\" '> and 1=1 " +
            " AND DATE_FORMAT(c.CheckTime,'%Y-%m') = #{month} " +
            "</if>" +
            "<if test = 'sid > 1 and jid == 0'> and c.UserId = #{sid} " +
            " AND c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d') " +
            " AND c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d')" +
            "</if>" +
            "</script>")
    List<Checksurface> xxChecksurfaceSelect(@Param("sid") int sid, @Param("jid") int jid, @Param("month") String month);
    /*查询考勤记录*/
    @Select("<script>SELECT c.* FROM checksurface as c , usersurface as u where c.UserId = u.UserId" +
            "<if test = 'sid > 0 and jid == 1'>" +
            " AND c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d') " +
            " AND c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d')" +
            " and c.UserId = #{sid} GROUP BY c.UserId </if>" +
            "<if test = 'sid == 1 and jid == 0'> and 1=1 " +
            " AND c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d') " +
            " AND c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d')" +
            "</if>" +
            "<if test = 'sid == 1 and jid == 0 and month != null and month != \"\" '> and 1=1 " +
            " AND DATE_FORMAT(c.CheckTime,'%Y-%m') = #{month} " +
            "</if>" +
            "<if test = 'sid > 1 and jid == 0'> and c.UserId = #{sid} " +
            " AND c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d') " +
            " AND c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d')" +
            "</if>" +
            "</script>")
    List<Checksurface> xxChecksurfaceSelect1(@Param("sid") int sid, @Param("jid") int jid, @Param("month") String month);
    /*查询排班*/
    @Select("select * from arrangemanage where Statusn = 0")
    List<Arrangemanage> xxArrangemanageselect1();
    /*根据班次id查询班次*/
    @Select("select * from Schedulingmanage where SchedulingManagId = #{id}")
    List<Schedulingmanage> xxSchedulingmanageselect(@Param("id") int id);
    /*更改考勤状态*/
    @Update("update Checksurface set GoTimeOneText = #{goTimeOneText},DownTimeOneText = #{downTimeOneText}," +
            "GoTimeTwoText=#{goTimeTwoText},DownTimeTwoText=#{downTimeTwoText}" +
            " where CheckId = #{checkId}")
    int xxChecksurfaceUpdate(Checksurface checksurface);
    /*根据用户id查询请假表数据*/
    @Select("SELECT DATE_FORMAT(l.BeginTime,'%Y-%m-%d') as BeginTime,DATE_FORMAT(l.OverTime,'%Y-%m-%d') as OverTime from leavefor as l where l.UserId = #{id}" +
            " and (l.LeaveState = \"已审核\" || l.LeaveState = \"请求销假\")  ")
    List<Leavefor> xxLeaveforSelect(@Param("id") int id);
    /*根据用户id查询离职表数据*/
    @Select("SELECT l.YLeaveTime from leave_apply as l where l.UserId = #{id} and l.LeaveGo = '审核已通过' ")
    List<LeaveApply> xxleaveapplySelect(@Param("id") int id);

    /*导入添加考勤*/
    @Insert("INSERT INTO Checksurface(UserId,CheckName,CheckTime,CheckRemark,CheckNumber," +
            "GoTimeOne,DownTimeOne,GoTimeTwo,DownTimeTwo,GoTimeOneText,DownTimeOneText,GoTimeTwoText,DownTimeTwoText) " +
            "VALUES(#{userId},#{checkName},#{checkTime},#{checkRemark},#{checkNumber},#{goTimeOne},#{downTimeOne},#{goTimeTwo},#{downTimeTwo}," +
            "#{goTimeOneText},#{downTimeOneText},#{goTimeTwoText},#{downTimeTwoText})")
    int xxChecksurfaceInsert(Checksurface checksurface);


    /*根据人员统计考勤次数*/
    /*第一次签到统计*/
    @Select("<script>SELECT COUNT(GoTimeOneText) as CheckOne from checksurface where GoTimeOneText = '正常' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\") " +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoOne1(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(GoTimeOneText) as CheckOne from checksurface where GoTimeOneText = '缺勤' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoOne2(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(GoTimeOneText) as CheckOne from checksurface where GoTimeOneText = '早退' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoOne3(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(GoTimeOneText) as CheckOne from checksurface where GoTimeOneText = '请假' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoOne4(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    /*第一次签退统计*/
    @Select("<script>SELECT COUNT(DownTimeOneText) as CheckOne from checksurface where DownTimeOneText = '正常' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownOne1(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(DownTimeOneText) as CheckOne from checksurface where DownTimeOneText = '缺勤' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownOne2(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(DownTimeOneText) as CheckOne from checksurface where DownTimeOneText = '早退' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownOne3(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(DownTimeOneText) as CheckOne from checksurface where DownTimeOneText = '请假' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownOne4(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    /*第二次签到时间*/
    @Select("<script>SELECT COUNT(GoTimeTwoText) as CheckOne from checksurface where GoTimeTwoText = '正常' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoTwo1(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(GoTimeTwoText) as CheckOne from checksurface where GoTimeTwoText = '缺勤' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoTwo2(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(GoTimeTwoText) as CheckOne from checksurface where GoTimeTwoText = '早退' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoTwo3(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(GoTimeTwoText) as CheckOne from checksurface where GoTimeTwoText = '请假' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckGoTwo4(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    /*第二次签退时间*/
    @Select("<script>SELECT COUNT(DownTimeTwoText) as CheckOne from checksurface where DownTimeTwoText = '正常' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownTwo1(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(DownTimeTwoText) as CheckOne from checksurface where DownTimeTwoText = '缺勤' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownTwo2(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(DownTimeTwoText) as CheckOne from checksurface where DownTimeTwoText = '早退' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownTwo3(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    @Select("<script>SELECT COUNT(DownTimeTwoText) as CheckOne from checksurface where DownTimeTwoText = '请假' " +
            "<if test='userId > 0'> and UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE('9999-12-31',\"%Y-%m-%d\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and CheckTime BETWEEN STR_TO_DATE('1000-01-01',\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and CheckTime BETWEEN STR_TO_DATE(#{begintime},\"%Y-%m-%d\") and STR_TO_DATE(#{endtime},\"%Y-%m-%d\")" +
            "</if>" +
            "<if test='time!= null and time != \"\" '> AND DATE_FORMAT(CheckTime,'%Y-%m') = #{time} </if>" +
            "</script>")
    int CheckDownTwo4(@Param("userId") Integer userId, @Param("begintime") String begin, @Param("endtime") String end, @Param("time") String time);
    /*统计请假次数  &gt;大于号  &lt;小于号*/
   /* @Select("<script>SELECT sum(l.LeaveNumber) as qingjia from leavefor as l where 1=1 " +
            "<if test='userId > 0'> and l.UserId = #{userId} </if>" +
            "<if test ='begintime!=null and begintime!=\"\"'>" +
            " and l.BeginTime &gt;= DATE_FORMAT(#{begintime},\"%Y-%m-%d %H:%i:%s\") and l.OverTime &lt;= DATE_FORMAT('9999-12-31 00:00:00',\"%Y-%m-%d %H:%i:%s\")</if>" +
            "<if test ='endtime!=null and endtime!=\"\"'>" +
            " and l.BeginTime &gt;= DATE_FORMAT('1000-01-01 00:00:00',\"%Y-%m-%d %H:%i:%s\") and l.OverTime &lt;= DATE_FORMAT(#{endtime},\"%Y-%m-%d %H:%i:%s\")</if>" +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\" '>" +
            " and l.BeginTime &gt;= DATE_FORMAT(#{begintime},\"%Y-%m-%d %H:%i:%s\") and l.OverTime &lt;= DATE_FORMAT(#{endtime},\"%Y-%m-%d %H:%i:%s\")" +
            "</if>" +
            "</script>")
    Integer Leaveforqingjia(@Param("userId") Integer userId,@Param("begintime") String begin,@Param("endtime") String end,@Param("time") String time);*/

}
