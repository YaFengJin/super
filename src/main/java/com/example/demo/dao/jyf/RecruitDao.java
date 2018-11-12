package com.example.demo.dao.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitNeed;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface RecruitDao {
    //新建招聘需求
    @Insert("insert into recruit_need" +
            "(NeedPost,LaborTime,NeedNumber,NeedDept,Recruit_NRemak,Recruit_NAccess,PostAsk)" +
            "values(#{needPost},#{laborTime},#{needNumber},#{needDept},#{recruitNRemak},#{recruitNAccess},#{postAsk})")
     int saveRecruit_Need(RecruitNeed r);

    //查询部门
    @Select("select d.DeptId as id,d.DeptName as name,d.DeptFid as pid from dept as d")
     List<Map<String,Object>> queryDept();

    //添加部门时查询部门名称
    @Select("<script>" +
            "select d.DeptName as name from dept as d where d.DeptId in (" +
            " <foreach collection='list' item='item'  separator=','>" +
            "  #{item.deptid}" +
            "</foreach>)" +
            "</script>")
     String[] queryDeptName(List<Dept>list);

    //查询招聘需求
    @Select("<script>" +
            "select" +
            " ta.Recruit_NeedId as id,ta.NeedPost as post," +
            "ta.LaborTime as time,ta.NeedNumber as number,ta.NeedDept as deptids," +
            "ta.Recruit_NRemak as nremark,ta.Recruit_NAccess as naccess,ta.PostAsk as postask," +
            "GROUP_CONCAT(ta.deptName)as dept from" +
            " (" +
            " select " +
            "  r.Recruit_NeedId,r.NeedPost,d.DeptName,r.LaborTime,r.NeedNumber,r.NeedDept," +
            " r.Recruit_NRemak,r.Recruit_NAccess,r.PostAsk,FIND_IN_SET(d.DeptId,r.NeedDept)as tt " +
            " from recruit_need as r,dept as d" +
            " )as ta " +
            " where 1=1 and  ta.tt>0  " +
            "<if test='begintime!=null and begintime!=\"\" and endtime!=null and endtime!=\"\"'>" +
            " and str_to_date(ta.LaborTime,'%Y-%m-%d') BETWEEN str_to_date(#{begintime},'%Y-%m-%d')" +
            " and str_to_date(#{endtime},'%Y-%m-%d')" +
            "</if>" +
            " GROUP BY ta.Recruit_NeedId" +
            "</script>")
     List<Map<String,Object>>queryRecruit_Need(@Param("begintime") String begintime,@Param("endtime") String endtime);

     //修改招聘需求
    @Update("<script>" +
            "update recruit_need as r " +
            "<set>" +
            " <if test='needPost!=null and needPost!=\"\"'>" +
            "  r.needPost=#{needPost}," +
            "</if>" +
            "<if test='laborTime!=null and laborTime!=\"\"'>" +
            " r.laborTime=#{laborTime}," +
            "</if>" +
            "<if test='needNumber>0'>" +
            " r.needNumber=#{needNumber}," +
            "</if>" +
            "<if test='needDept!=null and needDept!=\"\"'>" +
            " r.needDept=#{needDept}," +
            "</if>" +
            "<if test='recruitNRemak!=null and recruitNRemak!=\"\"'>" +
            " r.recruit_NRemak=#{recruitNRemak}," +
            "</if>" +
            "<if test='recruitNAccess!=null and recruitNAccess!=\"\"'>" +
            " r.recruit_NAccess=#{recruitNAccess}," +
            "</if>" +
            "<if test='postAsk!=null and postAsk!=\"\"'>" +
            " r.postAsk=#{postAsk}" +
            "</if>" +
            "</set>" +
            " where r.Recruit_NeedId=#{recruitNeedId}" +
            "</script>")
     int updateRecruit_Need(RecruitNeed r);

    //编辑时查询部门
    @Select("select DISTINCT d.deptid as id,d.deptName as name,d.deptfid as pid," +
            "(" +
            " case when dr.needDept is not null then true else false end" +
            ")as checked  from dept as d " +
            "    left join " +
            "(select d.DeptId,d.DeptName,r.needDept,FIND_IN_SET(d.DeptId,r.needdept) as tt from dept as d  left join recruit_need as r on  r.Recruit_NeedId=#{id})as dr" +
            " on FIND_IN_SET(d.DeptId,dr.needdept) and dr.tt>0")
    List<Map<String,Object>> queryDept1(@Param("id") int id);

    //删除招聘需求
    @Delete("delete from recruit_need where Recruit_NeedId=#{id}")
    int deleteRecruit_Need(@Param("id") int id);
    //查看部门里的所有人员
    @Select("<script>" +
            "select " +
            "u.UserId as id" +
            " from emp_record as e,dept d ,usersurface u " +
            "where d.DeptId=u.DeptId and u.UserId=e.UserId and  e.Emp_StateId=1 and d.DeptId in" +
            "(" +
            "<foreach collection='list' item='item'  separator=','>" +
            " #{item.deptid}" +
            "</foreach>" +
            ")" +
            "</script>")
    int[] queryDeptUserIds(List<Dept>list);
    //查看部门里的所有人员
    @Select("<script>" +
            "select " +
            "u.UserName as name" +
            " from  emp_record as e,dept d ,usersurface u " +
            "where d.DeptId=u.DeptId and u.UserId=e.UserId and  e.Emp_StateId=1 and d.DeptId in" +
            "(" +
            "<foreach collection='list' item='item'  separator=','>" +
            " #{item.deptid}" +
            "</foreach>" +
            ")" +
            "</script>")
    String[] queryDeptUserNames(List<Dept>list);
}
