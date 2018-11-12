package com.example.demo.service.lxy;


import com.example.demo.entity.EmailBody;
import com.example.demo.entity.EmailRecord;

import java.util.List;
import java.util.Map;

public interface EmailService {
    /*
    * 添加邮件表并且实现记录表增加
    * */
    public int saveEmail(EmailBody e, String userId);
    /*
     * 更新草稿箱及添加
     * */
    public int updateEmailBody(EmailBody er, String userId);
    /*
    * 添加草稿箱
    * */
    public int addDrafts(EmailBody er);

    /*
    * 查询草稿箱
    * */
    public List<Map<String,Object>> findEmailBody(String bPerson);
    /*
    * 删除草稿箱
    * */
    public  int deleteEmailBody(EmailBody er);


    /*
    * 查询已发送
    * */
    public List<Map<String,Object>> findSend(String bPerson);
    /*
    * 删除已发送
    * */
    public int updateSend(EmailBody er);
    /*
    * 查看详情
    * */
    public List<Map<String,Object>> findParticulars(int bId);



    /*
    * 查询收件箱
    * */
    public List<Map<String,Object>> findInbox(String bPerson);
    /*
    * 查看详情【收件箱】
    * */
    public List<Map<String,Object>> findInbox1(int bId);
    /*
    * 删除收件箱【即为更新】
    * */
    public int updateInbox(EmailBody er);
    /*
     * 是否读取【收件箱】
     * */
    public int updateInbox1(EmailBody er);


    /*
    * 废纸篓
    * */
    public List<Map<String,Object>> findWastebasket(String bPerson);
    /*
    * 销毁
    * */
    public int deleteWastebasket(EmailBody er);
    /*
    * 恢复至收件箱
    * */
    public int updateWastebasket(EmailBody er);
}
