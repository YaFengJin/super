package com.example.demo.dao.lxy;

import com.example.demo.entity.EmailBody;
import com.example.demo.entity.EmailRecord;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface EmailDao {
    /*
    * 编写邮件[发件人，收件人，主题，级别，发送时间，内容,附件，状态]
    * */
    @Insert("insert into email_body(b_person,b_recipients,b_theme,b_rank,b_time,b_content,b_url,b_state,b_state1,b_status)" +
            "values(#{bPerson},#{bRecipients},#{bTheme},#{bRank},#{bTime},#{bContent},#{bUrl},#{bState},#{bState1},#{bStatus})")
    public int saveEmailBody(EmailBody er);
    /*
    * 查询添加成功后的最大b_id
    * */
    @Select("select max(b_id) as b_id from email_body")
    public int selectEmail();
    /*
    * 添加记录表
    * 【添加邮件时记录表中同时加入数据】
    * */
    @Insert("<script>" +
            "insert into email_record(b_id,UserId) values" +
            " <foreach collection='list' item='item'  separator=','> " +
            "(#{item.bId},#{item.userId})" +
            "</foreach>" +
            "</script>")
    public int saveEmailRecord(List<EmailRecord> list);

    /*
     * 更新草稿箱及添加
     * 根据邮件ID更新
     * */
    @Update("update email_body set " +
            "b_recipients=#{bRecipients},b_theme=#{bTheme},b_rank=#{bRank},b_time=#{bTime}," +
            "b_content=#{bContent},b_url=#{bUrl},b_state=#{bState} where b_id=#{bId}")
    public int updateEmailBody(EmailBody er);



    /*
     * 添加草稿箱
     * */
    @Insert("insert into email_body(b_person,b_recipients,b_theme,b_rank,b_time,b_content,b_url,b_state,b_state1,b_status)" +
            "values(#{bPerson},#{bRecipients},#{bTheme},#{bRank},#{bTime},#{bContent},#{bUrl},#{bState},#{bState1},#{bStatus})")
    public int addDrafts(EmailBody er);

    /*
    * 查询草稿箱
    * 根据发布人和状态查询
    * 0发送，1保存草稿箱
    * */
    @Select("select eb.b_person,eb.b_id,eb.b_recipients,eb.b_theme,eb.b_rank,date_format(eb.b_time,'%Y-%m-%d %H:%i:%s')as b_time,eb.b_content,eb.b_url,eb.b_state from email_body eb " +
            "where b_state='1' and b_person=#{bPerson}")
    public List<Map<String,Object>> findEmailBody(String bPerson);
    /*
    * 删除草稿箱
    * 根据邮件ID和发布人
    * */
    @Delete("delete from email_body where b_id=#{bId} and b_state='1'")
    public  int deleteEmailBody(EmailBody er);




    /*
    * 已发送查询
    * 根据发布人和状态查询
    * 0发送，1保存草稿箱
    * */
    @Select("select e.b_person,e.b_content,e.b_url,e.b_rank,e.b_id,e.b_theme,e.b_recipients," +
            "date_format(e.b_time,'%Y-%m-%d %H:%i:%s')as b_time from email_body e where b_state='0' and b_status='2' and b_person=#{bPerson}")
    public List<Map<String,Object>> findSend(String bPerson);
    /*
    * 删除已发送
    * 根据邮件ID和发布人和状态
    * */
    /*@Delete("delete from email_body where b_id=#{bId} and b_state='0'")*/
    @Update("update email_body set b_status='0' where b_id=#{bId} and b_state='0'")
    public int updateSend(EmailBody er);
    /*
    * 查看详情【已发送】
    * 根据邮件ID和发布人
    * */
    @Select("select b.b_id,b.b_theme,b.b_rank,b.b_recipients,date_format(b.b_time,'%Y-%m-%d %H:%i:%s')as b_time,b.b_content,b.b_url from email_body b where b_id=#{bId} and b_state='0'")
    public List<Map<String,Object>> findParticulars(int bId);


    /*
    * 【收件箱】
    * */
    /*
    * 查询收件箱
    * 根据状态和发布人
    * */
    @Select("select b.b_id,b.b_theme,b.b_person,date_format(b.b_time,'%Y-%m-%d %H:%i:%s')as b_time,b.b_state1 " +
            "from email_body b left join email_record r on b_status='2' and b.b_id=r.b_id where r.UserId=#{bPerson}")
    public List<Map<String,Object>> findInbox(String bPerson);
    /*
    * 查看详情【收件箱】
    * 根据状态，发布人，邮件ID
    * */
    @Select("select y.b_id,y.b_theme,y.b_rank,y.b_person,date_format(y.b_time,'%Y-%m-%d %H:%i:%s')as b_time," +
            "y.b_content,y.b_url from email_body y where b_id=#{bId}")
    public List<Map<String,Object>> findInbox1(int bId);
    /*
    * 删除【收件箱】
    * 更改状态
    * 根据状态，邮件ID，发布人
    * */
    @Update("update email_body set b_status='0' where b_id=#{bId} and b_status='2'")
    public int updateInbox(EmailBody er);
    /*
    * 是否读取【收件箱】
    * 根据状态，邮件ID，发布人
    * */
    @Update("update email_body set b_state1='1' where b_id=#{bId} and b_status='2'")
    public int updateInbox1(EmailBody er);


    /*
    *废纸篓
    * 根据状态和发布人
    * */
    @Select("select ey.b_id,ey.b_person,ey.b_theme,date_format(ey.b_time,'%Y-%m-%d %H:%i:%s')as b_time " +
            "from email_body ey left join email_record r on b_status='0' and ey.b_id=r.b_id where r.UserId=#{bPerson}")
    public List<Map<String,Object>> findWastebasket(String bPerson);
    /*
    *销毁
    *根据状态和发布人
    * */
    @Update("update email_body set b_status='1' where b_id=#{bId} and b_status='0'")
    public int deleteWastebasket(EmailBody er);
    /*
    * 恢复到收件箱
    * 根据状态和发布人
    * */
    @Update("update email_body set b_status='2' where b_id=#{bId}")
    public int updateWastebasket(EmailBody er);





}














