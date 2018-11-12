package com.example.demo.dao.xmt;

import com.example.demo.entity.Document;
import com.example.demo.entity.Filing_Cabinet;
import com.example.demo.entity.Journalism;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface JournalismDao {
    //查询新闻表
    @Select("select jm.JL_Id,jm.JL_Theme,jm.JL_Datetime,jm.JL_State,je.jt_name from Journalism jm left join Journalismtype je on je.jt_id = jm.jt_id ")

    public List<Map<String,Object>> query();

    //分页条件查询新闻表
    @Select("<script>"+ "select jm.JL_Id,jm.JL_Theme,jm.person,jm.JL_Datetime,jm.JL_State,je.jt_name,jm.deptId,jm.JL_Content,jm.JL_Tov,jm.jt_id,jm.rt_id,rt.rt_name from Journalism jm,Journalismtype je,Reprtitiontype rt where 1=1 " +
            "<if test='name!=null and name!=\"\"'> and jt_name like concat('%',#{name},'%')</if>" +
            " and JL_State='1'and person = #{person} and je.jt_id = jm.jt_id and rt.rt_id = jm.rt_id " +
            " order by jm.JL_Id asc"+"</script>")

   public List<Map<String,Object>> pagefind(@Param("name") String name, @Param("person") String person);
    //删除新闻表数据
    @Delete(" delete from Journalism where JL_Id=#{JL_Id} ")
    public int delete(int JL_Id);
    //编辑新闻表数据
    @Update("update Journalism set JL_Theme=#{jlTheme},jt_id=#{journalismtype.jtId},rt_id=#{reprtitiontype.rtId},JL_Datetime=#{jlDatetime},JL_Content=#{jlContent},JL_Tov=#{jlTov},deptId=#{deptId} where JL_Id=#{jlId}")
    public int update(Journalism j);
    //查询新闻类型
    @Select("select je.jt_id,je.jt_name from Journalismtype je")
    public List<Map<String,Object>> findtype();
    //添加新闻表数据
    @Insert("insert into journalism"+
            "(JL_State,JL_Theme,jt_id,rt_id,JL_Datetime,JL_Tov,JL_Content,deptId)"+
            "values(#{jlState},#{jlTheme},#{journalismtype.jtId},#{reprtitiontype.rtId},#{jlDatetime},#{jlTov},#{jlContent},#{deptId})")
     public int save(Journalism j);
    //查询评论类型
    @Select("select re.rt_id,re.rt_name from Reprtitiontype re")
    public List<Map<String,Object>> findtype1();
    //新闻表状态（1==生效，2==终止）
    @Update("update Journalism set JL_State='1' where JL_Id=#{jlId}")
    public  int State(Journalism j);
    @Update("update Journalism set JL_State='2',JL_Tov=SYSDATE() where JL_Id=#{jlId}")
    public int State1(Journalism j);
   //查询评论表
    @Select("select jm.JL_Id,jm.JL_Content,jm.JL_Theme,c.cm_name,c.userId from Commentsurface c left join Journalism jm on jm.JL_Id = c.JL_Id ")
    public List<Map<String,Object>> Comquery();
    //知识管理
   //查询文件柜
    @Select("<script>"+ "select d.documentId,d.documentName,date_format(d.d_time,'%Y-%m-%d %H:%i:%s')as d_time,d.documentCon,f.Filing_cabinetName from Document d,Filing_Cabinet f where 1=1 " +
            "<if test='dname!=null and dname!=\"\"'> and documentName like concat('%',#{dname},'%')</if>" +
            "  and f.Filing_cabinetId = d.Filing_cabinetId " +
           "</script>")
    public List<Map<String,Object>> pagefind1(@Param("dname") String dname);
    //文件柜删除
    @Delete(" delete from Document where documentId=#{documentId} ")
    public int ddelete(int documentId);
    //文件编辑
    @Update("update Document set documentName=#{documentName},documentCon=#{documentCon} where documentId=#{documentId}")
    public int dupdate(Document d);
    //通过文件柜id查询内容
    @Select("select d.documentCon from Document d where documentId=#{documentId}")
    public List<Map<String,Object>> dquery(int documentId);
  /*  //文件柜添加
  //*/
  //文件柜设置分页查询
    @Select("<script>"+"select f.Filing_cabinetId,f.Filing_cabinetName from Filing_Cabinet f where Filing_cabinetFId=0"+"</script>")
    public List<Map<String,Object>> fquery();
    //文件柜设置添加
    @Insert("insert into Filing_Cabinet(Filing_cabinetName,Filing_cabinetFId) values(#{filingCabinetName},#{filingCabinetFId})")
    public int fsave(Filing_Cabinet f);
    //文件柜设置删除
    @Delete(" delete from Filing_Cabinet where Filing_cabinetId=#{Filing_cabinetId}")
    public int fdelete(int Filing_cabinetId);
    //文件柜设置编辑
    @Update("update Filing_Cabinet set Filing_cabinetName=#{filingCabinetName} where Filing_cabinetId=#{filingCabinetId}")
    public int fupdate(Filing_Cabinet f);
    //文件柜设置查询所有
    @Select("select f.Filing_cabinetId as id,f.Filing_cabinetName as name,f.Filing_cabinetFId as pid from Filing_Cabinet f where Filing_cabinetId=Filing_cabinetFId")
    public List<Map<String,Object>> ffquery();
    /*
     * 查询文件柜设置
     * */
    @Select("select  " +
            "f.Filing_cabinetId as id,f.Filing_cabinetFId as parentid," +
            "f.Filing_cabinetName as name " +
            "from filing_cabinet as f")
   public List<Map<String,Object>>queryfiling();
    //查看子目录
    @Select("select " +
            "f.Filing_cabinetId as id,f.Filing_cabinetName as name " +
            "from filing_cabinet as f where f.Filing_cabinetFId=#{id}")
    List<Map<String,Object>>queryChildFiling(@Param("id") int id);

    @Select("select d.documentId as id,d.Filing_cabinetId as fid,d.documentName as name,\n" +
            "            d.documentCon as con,d.documentAccess as access  \n" +
            "            from filing_cabinet as f,document as d \n" +
            "            where f.Filing_cabinetId=d.Filing_cabinetId and f.Filing_cabinetId=#{id}")
    List<Map<String,Object>>queryDocument(@Param("id") int id);

}
