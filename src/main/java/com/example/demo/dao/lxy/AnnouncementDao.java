package com.example.demo.dao.lxy;

import com.example.demo.entity.Announcement;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface AnnouncementDao {
    /*
    * 公告内容查询
    * */
    @Select("select\n" +
            "\t\tm.AM_Id,m.AM_Person,t.at_name,m.DeptId,m.AM_Theme,m.AM_Datetime,m.AM_Tovs,m.AM_Tove,m.AM_State from\n" +
            "\t\tannouncement m left join announcementtype t on\n" +
            "\t\tm.at_id=t.at_id")
    public List<Map<String,Object>> findAnnouncement();

  /*
  * 公告通知【分页条件模糊查询】
  * */
    @Select("<script>"+
            "select m.at_id,m.AM_Id,m.AM_Person,t.at_name,m.DeptId,m.AM_Theme,m.AM_Datetime,m.AM_Tovs,m.AM_Tove,m.AM_State,m.AM_Content from announcement m,announcementtype t where 1=1 " +
            "<if test='name!=null and name!=\"\"'> and AM_Theme like concat('%',#{name},'%')</if>" +
            " and m.at_id=t.at_id" +
            " order by m.AM_Id desc"+
            "</script>")
    public List<Map<String,Object>> pageAnnouncement(@Param("name") String name);

    /*
    * 公告管理删除
    * */
    @Delete("delete from announcement where AM_Id=#{amId}")
    public int deleteAnnouncement(Announcement an);
    /*
    * 公告通知编辑
    * 查询类型
    * */
    @Update("update announcement set " +
            "AM_Theme=#{amTheme},DeptId=#{deptId},at_id=#{announcementtype.atId},AM_Datetime=#{amDatetime},AM_Tovs=#{amTovs},AM_Tove=#{amTove},AM_Content=#{amContent} where AM_Id=#{amId}")
    public int updateAnnouncement(Announcement an);
    @Select("select at.at_id,at.at_name from announcementtype at")
    public  List<Map<String,Object>> findAnnouncementtype();

    /*
    * 新建公告
    * */
    @Insert("insert into announcement" +
            "(AM_State,at_id,AM_Person,AM_Theme,DeptId,AM_Datetime,AM_Tovs,AM_Tove,AM_Content)" +
            "values(#{amState},#{announcementtype.atId},#{amPerson},#{amTheme},#{deptId},#{amDatetime},#{amTovs},#{amTove},#{amContent})")
    public int saveAnnouncement(Announcement an);

    /*
    * 更新状态【1生效，2终止】
    * */
    @Update("update announcement set AM_State='1',AM_Tovs=utc_date() where AM_Id=#{amId}")
    public int updateState(Announcement an);
    @Update("update announcement set AM_State='2',AM_Tove=utc_date() where AM_Id=#{amId}")
    public int update(Announcement an);
}
