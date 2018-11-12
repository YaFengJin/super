package com.example.demo.dao.mk;

import com.example.demo.entity.EmailRecord;
import com.example.demo.entity.Ordermeeting;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface ApplyMeet {
    /**
     * 查询出启用状态  和当前登陆人所在部门允许申请  会议室信息
     * FIND_IN_SET(str,strlist)  str 查找的字符串，strlist 查找的范围
     * @return
     */
    @Select("select " +
            " m.m_id,m.m_name,m.m_number,m.m_condition,m.m_adress,m.m_description,u.UserName,m.m_time from meet m,usersurface u " +
             "where m.UserId=u.UserId and m.m_state=1 and  FIND_IN_SET((select u.DeptId from usersurface u where u.UserId=#{UserId}),m.deptid)")
    List<Map<String,Object>> isQueryApplyMeet(@Param("UserId") String UserId);
    /**
     * 会议室申请
     * @return
     */
    @Insert("insert into ordermeeting(m_id,order_startdate,order_enddate,order_curdate,order_hours,order_mintes,order_time,order_theme,order_state,userid,order_name,order_userid,order_user)" +
            "values(#{meet.mId},#{orderStartdate},#{orderEnddate},#{orderCurdate},#{orderHours},#{orderMintes},#{orderTime},#{orderTheme},#{orderState},#{userid},#{orderName},#{orderUserid},#{orderUser})")
    int isInsertApplyMeet(Ordermeeting o);
    /**
     * 查询待批会议
     * @return
     */
    @Select("<script>" +
            "select o.order_id,o.order_name,u.UserName,o.order_startdate,o.order_enddate,m.m_name from ordermeeting o,usersurface u,meet m where  1=1 " +
            "<if test='meetRoom!=null and meetRoom!=\"\"'>" +
            " and o.order_name like concat('%',#{meetRoom},'%') " +
            "</if>" +
            " and o.m_id=m.m_id and u.UserId=o.order_user and o.order_state=0 " +
            "</script>")
    List<Map<String,Object>> isQueryWaitMeet(@Param("meetRoom") String meetRoom);
    /**
     * 取消申请会议
     * @param o
     * @return
     */
    @Delete("delete from ordermeeting where order_id=#{orderId}")
    int isDeleteWaitMeet(Ordermeeting o);
    /**
     * 查询已经批准的会议
     * @return
     */
    @Select("<script>" +
            "select o.order_id,o.order_name,u.UserName,o.order_startdate,o.order_enddate,m.m_name from ordermeeting o,usersurface u,meet m where  1=1 " +
            "<if test='ratifyMeet!=null and ratifyMeet!=\"\"'>" +
            " and o.order_name like concat('%',#{ratifyMeet},'%') " +
            "</if>" +
            " and o.m_id=m.m_id and u.UserId=o.order_user and o.order_state=1 and u.UserId=#{UserId}" +
            "</script>")
    List<Map<String,Object>> isQueryRatifyMeet(@Param("ratifyMeet") String ratifyMeet, @Param("UserId") String UserId);
    /**
     * 查询数据库中已申请日期  判断时间是否冲突
     * @param startdates 开始日期
     * @param enddates  结束日期
     * @param starttimes   开始时间
     * @param endtimes     结束时间
     * @param mId    id
     * @return
     */
    @Select("select COUNT(*) from ordermeeting  where\n" +
            "((date_format(order_startdate ,'%Y-%m-%d')>=#{startdates} AND date_format(order_startdate ,'%Y-%m-%d' ) <= #{enddates} AND date_format(order_startdate ,'%H:%i:%s' )>=#{starttimes} AND date_format(order_startdate ,'%H:%i:%s' )<=#{endtimes}) OR \n" +
            "(date_format(order_startdate ,'%Y-%m-%d')<=#{startdates} AND date_format(order_enddate ,'%Y-%m-%d' ) >= #{enddates} AND date_format(order_startdate ,'%H:%i:%s' )<=#{starttimes} AND date_format(order_enddate ,'%H:%i:%s' )>=#{endtimes}) OR\n" +
            "(date_format(order_enddate ,'%Y-%m-%d')>=#{startdates} AND date_format(order_enddate ,'%Y-%m-%d') <= #{enddates} AND date_format(order_enddate ,'%H:%i:%s' )>=#{starttimes} AND date_format(order_enddate ,'%H:%i:%s' )<=#{endtimes})) and m_id=#{mId} and  (order_state=0 or order_state=1)")
    int isQueryDate(@Param("startdates") String startdates, @Param("enddates") String enddates, @Param("starttimes") String starttimes, @Param("endtimes") String endtimes, @Param("mId") String mId);
    /**
     * 查询未通过的会议
     * @return
     */
    @Select("<script>" +
            "select o.order_id,o.order_name,u.UserName,o.order_startdate,o.order_enddate,m.m_name from ordermeeting o,usersurface u,meet m where  1=1 " +
            "<if test='ratifMeet!=null and ratifMeet!=\"\"'>" +
            " and o.order_name like concat('%',#{ratifMeet},'%') " +
            "</if>" +
            " and o.m_id=m.m_id and u.UserId=o.order_user and o.order_state=2 and u.UserId=#{UserId}" +
            "</script>")
    List<Map<String,Object>> isQueryRefuseMeet(@Param("ratifMeet") String ratifMeet, @Param("UserId") String UserId);
    /**
     * 查询出提前几个小时后的时间
     * @param Houses
     * @param orderStart
     * @return
     */
    @Select("select date_sub(#{orderStart},interval #{Houses} hour)")
    String isQueryDatetime(@Param("Houses") String Houses, @Param("orderStart") String orderStart);
    /**
     * 审批通过 发送邮件
     */
    @Insert("insert into email_body(b_person,b_recipients,b_theme,b_content,b_time,b_state,b_state1,b_status) " +
            "SELECT order_user,userid,\"会议申请\",concat(\"通知您于\",order_startdate,\"至\",order_enddate,\"到\",(select m_name FROM meet where meet.m_id=ordermeeting.m_id),\"参加会议\"),order_mintes,0,0,2 " +
            "FROM ordermeeting WHERE order_mintes!=\"\" and date_format(now() ,'%Y-%m-%d %H:%i')=date_format(order_mintes ,'%Y-%m-%d %H:%i') and order_state=1")
    int isInsertEmail();
    /**
     * 查询b_id
     * @return
     */
    @Select("select max(b_id) as b_id from email_body")
     int selectEmail();
    /**
     * 查寻出收件人
     * @return
     */
    @Select("SELECT e.b_recipients FROM email_body e WHERE e.b_id=(SELECT MAX(b_id) FROM email_body)")
    String isQueryEmailBody();
    /**
     *   添加记录表
     *  【添加邮件时记录表中同时加入数据】
     * @param list
     * @return
     */
    @Insert("<script>" +
            "insert into email_record(b_id,UserId) values" +
            " <foreach collection='list' item='item'  separator=','> " +
            "(#{item.bId},#{item.userId})" +
            "</foreach>" +
            "</script>")
     int saveEmailRecord(List<EmailRecord> list);
}
