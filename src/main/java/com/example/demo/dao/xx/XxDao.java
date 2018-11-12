package com.example.demo.dao.xx;

import com.example.demo.entity.Arrangemanage;
import com.example.demo.entity.Schedulingmanage;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface XxDao {

    /*班次分页模糊条件查询*/
    /*@Select("<script>"
            + "select * from Schedulingmanage where 1=1"
            + "<if test='schedulingName!=null and schedulingName!=\"\"'> and schedulingName like concat(\"%\",#{schedulingName},\"%\")</if>"
            + " limit #{page},#{limit}"
            + "</script>")*/
    @Select("<script>"
            + "select * from Schedulingmanage where 1=1"
            + "<if test='schedulingName!=null and schedulingName!=\"\"'> and schedulingName like concat(\"%\",#{schedulingName},\"%\")</if>"
            + "</script>")
    List<Map<String, Object>> select(@Param("page") int page, @Param("limit") int limit, @Param("schedulingName") String schedulingName);

    /*班次添加数据*/
    @Insert("insert into Schedulingmanage(SchedulingName,DUTYTIME1,DUTYTIME2,TIMELATE1,TIMELATE2,DUTYTIME3," +
            "DUTYTIME4,TIMELATE3,TIMELATE4)" +
            " values" +
            "(#{schedulingName},#{dutyTime1},#{dutyTime2}," +
            "#{timeLate1},#{timeLate2},#{dutyTime3},#{dutyTime4},#{timeLate3},#{timeLate4})")
    int xxinsert(Schedulingmanage s);

    /*更改班次*/
    @Update("update Schedulingmanage set " +
            "SchedulingName=#{schedulingName},DUTYTIME1=#{dutyTime1},DUTYTIME2=#{dutyTime2},TIMELATE1=#{timeLate1}," +
            "TIMELATE2=#{timeLate2},DUTYTIME3=#{dutyTime3},DUTYTIME4=#{dutyTime4}," +
            "TIMELATE3=#{timeLate3},TIMELATE4=#{timeLate4}  " +
            "where SchedulingManagId=#{schedulingManagId}")
    int xxupdate(Schedulingmanage s);

    /*删除班次*/
    @Delete("delete from Schedulingmanage where SchedulingManagId=#{schedulingManagId}")
    int xxdelete(@Param("schedulingManagId") int schedulingManagId);

    /**
     * 查询排班
     */
    @Select("select ta.ArrangeManagId,ta.datestart,ta.dateend,ta.monday,ta.thursday,ta.wednesday,ta.tuesday,ta.friday,ta.saturday,ta.sunday,ta.ArrangeName,ta.Statusn,ta.UserId,GROUP_CONCAT(ta.UserName) as UserIds " +
            "from(select a.ArrangeManagId,a.datestart,a.dateend,a.monday,a.thursday,a.wednesday,a.tuesday,a.friday,a.saturday,a.sunday,a.ArrangeName,a.Statusn,a.UserId,u.UserName,FIND_IN_SET(u.UserId,a.UserId) as tt " +
            "from arrangemanage as a,usersurface as u) as ta " +
            "where ta.tt>0 GROUP BY ta.ArrangeManagId")
    List<Map<String, Object>> xxArrangemanageselect();
    /**
     * 根据id查询排班
     */
    @Select("select monday,thursday,wednesday,tuesday,friday,saturday,sunday from arrangemanage where arrangeManagId = #{id}")
    List<Map<String, Object>> xxArrangemanageselect1(@Param("id") int id);
    /**
     * 更改排班状态
     *
     * @param a
     * @return
     */
    @Update("update Arrangemanage set " +
            "Statusn=#{statusn} where ArrangeManagId=#{arrangeManagId}")
    int xxArrangemanageupdate(Arrangemanage a);

    /*根据班次类型id查班次类型数据*/
    @Select("select * from Schedulingmanage where SchedulingManagId = #{sid}")
    List<Map<String, Object>> xxSchedulingmanageselect(@Param("sid") int sid);

    /*添加排班表数据*/
    @Insert("insert into Arrangemanage (ArrangeName,UserId,datestart,dateend,Statusn,monday,tuesday,wednesday,thursday,friday,saturday,sunday)" +
            "values (#{arrangeName},#{userId},#{dateStart},#{dateEnd},#{statusn},#{monday},#{tuesday},#{wednesday},#{thursday},#{friday},#{saturday},#{sunday})")
    int xxArrangemanageinsert(Arrangemanage a);
    /*删除排班*/
    @Delete("DELETE FROM Arrangemanage WHERE ArrangeManagId = #{arrangeManagId}")
    int xxArrangemanagedelete(Arrangemanage a);
    /*编辑排班*/
    @Update("update Arrangemanage set ArrangeName=#{arrangeName},UserId=#{userId},datestart=#{dateStart},dateend=#{dateEnd}," +
            "monday=#{monday},tuesday=#{tuesday},wednesday=#{wednesday},thursday=#{thursday},friday=#{friday},saturday=#{saturday},sunday=#{sunday}" +
            " where ArrangeManagId=#{arrangeManagId}")
    int xxArrangemanageupdate1(Arrangemanage a);


}