package com.example.demo.dao.mk;

import com.example.demo.entity.Meet;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * 办公室设置
 */
@Mapper
public interface MeetRoom {
    /**
     * 增加会议室
     *
     * @return
     */
    @Insert("insert into meet(UserId,deptid,m_name,m_description,m_number,m_trueoffalse,m_time,m_condition,m_adress,m_state) values(#{usersurface.userid},#{deptid},#{mName},#{mDescription},#{mNumber},#{mTrueoffalse},#{mTime},#{mCondition},#{mAdress},#{mState})")
    int addMeetRoom(Meet m);
    /**
     * 查询会议室
     *
     * @return
     */
    @Select("select ta.m_name,ta.m_number,ta.m_condition,ta.m_adress,ta.m_description,u.UserName,ta.m_id,GROUP_CONCAT(ta.DeptName)as deptname,ta.m_state  from (select m.m_id,m.m_name,m.m_number,m.m_condition,m.m_adress,m.m_description,m.deptid,d.DeptName,m.UserId,FIND_IN_SET(d.DeptId,m.deptid)as tt,m.m_state from meet as m,dept as d)as ta,usersurface as u where ta.tt>0 and ta.UserId=u.UserId  GROUP BY ta.m_id")
    List<Map<String, Object>> isQueryMeetRoom();

    /**
     * 修改会议室状态  启用   状态为1
     * @param m
     * @return
     */
    @Update("update meet set m_state=1 where m_id=#{mId}")
    int isUpdateRoomStartFlag(Meet m);

    /**
     * 修改会议室状态  禁用   状态为0
     * @param m
     * @return
     */
    @Update("update meet set m_state=0 where m_id=#{mId}")
    int isUpdateRoomEndFlag(Meet m);
}
