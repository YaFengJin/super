package com.example.demo.dao.xx;

import com.example.demo.entity.Checksurface;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface CheckStaticsDao {

    /*考勤统计*/
    @Select("<script> SELECT DATE_FORMAT(curdate(),'%Y-%m') AS date,c.CheckName as CheckName,c.UserId as UserId,d.DeptName as DeptName, " +
            "(SUM(c.GoTimeOneText='正常')+SUM(c.DownTimeOneText='正常')+SUM(c.GoTimeTwoText='正常')+SUM(c.DownTimeTwoText='正常')) as zhengchang," +
            "(SUM(c.GoTimeOneText='缺勤')+SUM(c.DownTimeOneText='缺勤')+SUM(c.GoTimeTwoText='缺勤')+SUM(c.DownTimeTwoText='缺勤')) as queqin, " +
            "(SUM(c.GoTimeOneText='早退')+SUM(c.DownTimeOneText='早退')+SUM(c.GoTimeTwoText='早退')+SUM(c.DownTimeTwoText='早退')) as zaotui, " +
            "(SUM(c.GoTimeOneText='请假')+SUM(c.DownTimeOneText='请假')+SUM(c.GoTimeTwoText='请假')+SUM(c.DownTimeTwoText='请假')) as qingjia " +
            " FROM checksurface as c,usersurface as u LEFT JOIN dept as d on u.DeptId = d.DeptId where c.UserId = u.UserId " +
            " and c.CheckTime &gt;= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d') " +
            " and c.CheckTime &lt;= DATE_FORMAT(curdate(),'%Y-%m-%d')" +
            "<if test='id > 0'> and c.UserId = #{id} </if>" +
            "<if test = 'name != null and name != \"\" '> and d.DeptName = #{name} </if>" +
            " GROUP BY c.UserId" +
            "</script>")
    List<Map<String,Object>> xxkaoqintongji(@Param("id") int id, @Param("name") String name);
    /*考勤明细*/
    @Select("SELECT * FROM Checksurface " +
            " WHERE UserId = #{userId}" +
            " and CheckTime >= DATE_FORMAT(DATE_ADD(curdate(),interval -day(curdate())+1 day),'%Y-%m-%d') " +
            " and CheckTime <= DATE_FORMAT(curdate(),'%Y-%m-%d')")
    List<Map<String,Object>> xxmingxi(Checksurface checksurface);
}
