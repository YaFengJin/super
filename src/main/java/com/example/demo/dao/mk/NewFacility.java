package com.example.demo.dao.mk;


import com.example.demo.entity.Facility;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

/**
 * 会议室设备管理
 */
@Mapper
public interface NewFacility {
     /**
      * 新建设备
      * @param f
      * @return
      */
     @Insert("insert into facility(f_number,f_state,f_name,f_describe,m_id) values(#{fNumber},#{fState},#{fName},#{fDescribe},#{meet.mId})")
     int isNewFacility(Facility f);
     /**
      * 查询会议室类型
      * @return
      */
     @Select("select m.m_id,m.m_name from meet m")
     List<Map<String,Object>> isQueryMeetType();

     /**
      * 设备管理
      * @param fName
      * @return
      */
     @Select("<script>" +
             "select f.f_id,f.f_number,f.f_name,m.m_id,m.m_name,f.f_state,f.f_describe from facility f,meet m where 1=1" +
             " <if test='fName!=null and fName!=\"\"'>" +
             " and f.f_name like concat('%',#{fName},'%')" +
             "</if>" +
             " and f.m_id=m.m_id"
             +"</script>")
     List<Map<String,Object>> isQueryFacility(@Param("fName") String fName);

     /**
      * 删除会议设备
      * @param f
      * @return
      */
     @Delete("delete from facility where f_id=#{fId}")
     int isDeleteFacility(Facility f);

     /**
      * 更新会议设备
      * @param f
      * @return
      */
     @Update("update facility" +
             " set m_id=#{meet.mId},f_number=#{fNumber},f_state=#{fState},f_name=#{fName},f_describe=#{fDescribe}" +
             "where f_id=#{fId}")
     int isUpdateFacility(Facility f);
}
