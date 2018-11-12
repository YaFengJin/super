package com.example.demo.dao.mk;

import com.example.demo.entity.Ordermeeting;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface CheckMeet {
    /**
     * 同意申请   状态改为1
     * @param o
     * @return
     */
    @Update("update ordermeeting set order_state=1 where order_id=#{orderId}")
    int isCheckMeet(Ordermeeting o);

    /**
     * 拒绝申请  状态改为2
     * @param oderId
     * @return
     */
    @Update("update ordermeeting set order_state=2 where order_id=#{a}")
    int isNotCheckMeet(@Param("a") int oderId);

    /**
     * 会议结束  状态改为3
     *
     */
    @Update("UPDATE ordermeeting SET order_state=3 WHERE NOW()>order_enddate")
    void isUpdateMeetFlag();

    /**
     * 查询会议申请详情
     * @return
     */
    @Select("SELECT ta.order_id,ta.m_name,ta.UserName,ta.order_startdate,ta.order_enddate,ta.order_time,ta.order_theme,ta.order_name,ta.order_reason,GROUP_CONCAT(ta.UserName)as idst from \n" +
            "(\n" +
            "select o.order_id,m.m_name,u.UserName,o.order_startdate,o.order_enddate,o.order_time,o.order_theme,o.order_name,o.order_reason,FIND_IN_SET(u.UserId,o.userid)as tt\n" +
            " FROM ordermeeting o,meet m,usersurface u WHERE o.m_id=m.m_id ) as ta where ta.tt>0  and order_id=#{oderId} GROUP BY ta.order_id" )
    List<Map<String,Object>> isQueryDetails(@Param("oderId") String oderId);
    /**
     * 填写拒绝理由
     * @param oderId
     * @return
     */
    @Update("update ordermeeting set order_reason=#{orderReason} where order_id=#{a}")
    int isInsertReason(@Param("a") int oderId, @Param("orderReason") String orderReason);
}
