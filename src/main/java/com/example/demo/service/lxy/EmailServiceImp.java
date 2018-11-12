package com.example.demo.service.lxy;

import com.example.demo.dao.lxy.EmailDao;
import com.example.demo.entity.EmailBody;
import com.example.demo.entity.EmailRecord;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmailServiceImp implements EmailService{
    @Resource
    private EmailDao dao;

    /*
     * 添加邮件表并且实现记录表增加
     * */
    @Override
    @Transactional
    public int saveEmail(EmailBody e, String bRecipients) {
        int result=0;
        int a=dao.saveEmailBody(e);
        if(a>0){
            int maxId = dao.selectEmail();
            if(maxId>0&&bRecipients!=null){
                String[] userIds=bRecipients.split(",");//分割字符串
                List<EmailRecord> list=new ArrayList<EmailRecord>();
                for (int i = 0; i < userIds.length; i++) {
                    EmailRecord er=new EmailRecord();
                    er.setUserId(Integer.parseInt(userIds[i]));
                    er.setbId(maxId);
                    System.out.println(er);
                    list.add(er);
                }
                Map<String,Object> map=new HashMap<String,Object>();
                int record=dao.saveEmailRecord(list);
                if(record>0){
                    result=1;
                }
            }
        }else{
            result=0;
        }
        return result;
    }
    /*
    * 更新草稿箱及添加
    * */
    @Override
    @Transactional
    public int updateEmailBody(EmailBody er, String bRecipients) {
        int result1=0;
        int a=dao.updateEmailBody(er);
        if(a>0){
            int currentId=er.getbId();
            if(currentId>0&&bRecipients!=null){
                String[] userIds=bRecipients.split(",");//分割字符串
                List<EmailRecord> list=new ArrayList<EmailRecord>();
                for(int i = 0; i < userIds.length; i++){
                    EmailRecord e=new EmailRecord();
                    e.setUserId(Integer.parseInt(userIds[i]));
                    e.setbId(currentId);
                    list.add(e);
                }
                Map<String,Object> map=new HashMap<String,Object>();
                int record=dao.saveEmailRecord(list);
                if(record>0){
                    result1=1;
                }
            }
        }else {
            result1=0;
        }
        return result1;
    }
    /*
    * 添加草稿箱
    * */
    @Override
    public int addDrafts(EmailBody er) {
        return dao.addDrafts(er);
    }


    @Override
    public List<Map<String, Object>> findEmailBody(String bPerson) {
        return dao.findEmailBody(bPerson);
    }

    @Override
    public int deleteEmailBody(EmailBody er) {
        return dao.deleteEmailBody(er);
    }

    @Override
    public List<Map<String, Object>> findSend(String bPerson) {
        return dao.findSend(bPerson);
    }

    @Override
    public int updateSend(EmailBody er) {
        return dao.updateSend(er);
    }


    @Override
    public List<Map<String, Object>> findParticulars(int bId) {
        return dao.findParticulars(bId);
    }

    @Override
    public List<Map<String, Object>> findInbox(String bPerson) {
        return dao.findInbox(bPerson);
    }

    @Override
    public List<Map<String, Object>> findInbox1(int bId) {
        return dao.findInbox1(bId);
    }

    @Override
    public int updateInbox(EmailBody er) {
        return dao.updateInbox(er);
    }

    @Override
    public int updateInbox1(EmailBody er) {
        return dao.updateInbox1(er);
    }

    @Override
    public List<Map<String, Object>> findWastebasket(String bPerson) {
        return dao.findWastebasket(bPerson);
    }

    @Override
    public int deleteWastebasket(EmailBody er) {
        return dao.deleteWastebasket(er);
    }

    @Override
    public int updateWastebasket(EmailBody er) {
        return dao.updateWastebasket(er);
    }
}
