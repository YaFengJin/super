package com.example.demo.controller.lxy;

import com.example.demo.entity.EmailBody;
import com.example.demo.entity.EmailRecord;
import com.example.demo.service.lxy.EmailService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/email")
public class EmailController {
    @Resource
    private EmailService service;




    /*
    * 邮件增加
    * 及记录表增加
    * */
    @RequestMapping("/saveEmailBody")
    public Map<String,Object> saveEmailBody(EmailBody e, String bRecipients){
        int map=service.saveEmail(e,bRecipients);
        Map<String,Object>map1=new HashMap<String, Object>();
        if (map==1){
           map1.put("message","执行成功");
        }else{
            map1.put("message","执行失败");
        }
        return map1;
    }
    /*
    * 查询草稿箱
    * */
    @RequestMapping("/findEmailBody")
    public Map<String,Object> findEmailBody(String bPerson){
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",service.findEmailBody(bPerson));
        return map;
    }
    /*
    * 更新草稿箱
    * */
    @RequestMapping("/updateEmailBody")
    public Map<String,Object> updateEmailBody(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.updateEmailBody(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    /*
    * 删除草稿箱
    * */
    @RequestMapping("/deleteEmailBody")
    public Map<String,Object> deleteEmailBody(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.deleteEmailBody(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    /*
    * 查询已发送
    * */
    @RequestMapping("/findSend")
    public Map<String,Object> findSend(String bPerson){
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",service.findSend(bPerson));
        return map;
    }
    /*
     * 删除已发送
     * */
    @RequestMapping("/updateSend")
    public Map<String,Object> deleteSend(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.updateSend(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    /*
    * 查看已发送
    * */
    @RequestMapping("/findParticulars")
    public List<Map<String,Object>> findParticulars(int bId){
        return service.findParticulars(bId);
    }


    /*
    * 查询收件箱
    * */
    @RequestMapping("/findInbox")
    public Map<String,Object> findInbox(String bPerson){
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",service.findInbox(bPerson));
        return map;
    }
    /*
    * 收件箱【查看详情】
    * */
    @RequestMapping("/findInbox1")
    public List<Map<String,Object>> findInbox1(int bId){
        return service.findInbox1(bId);
    }
    /*
     * 删除【收件箱】
     * 更改状态
     * 根据状态，邮件ID，发布人
     * */
    @RequestMapping("/updateInbox")
    public Map<String,Object> updateInbox(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.updateInbox(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    /*
     * 是否读取【收件箱】
     * 根据状态，邮件ID，发布人
     * */
    @RequestMapping("/updateInbox1")
    public Map<String,Object> updateInbox1(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.updateInbox1(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }



    /*
     *废纸篓
     * 根据状态和发布人
     * */
    @RequestMapping("/findWastebasket")
    public Map<String,Object> findWastebasket(String bPerson){
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",service.findWastebasket(bPerson));
        return map;
    }
    /*
    * 销毁
    * */
    @RequestMapping("/deleteWastebasket")
    public Map<String,Object> deleteWastebasket(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.deleteWastebasket(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    /*
     * 恢复到收件箱
     * 根据状态和发布人
     * */
    @RequestMapping("/updateWastebasket")
    public Map<String,Object> updateWastebasket(EmailBody er){
        Map<String,Object>map=new HashMap<String, Object>();
        int a=service.updateWastebasket(er);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }

}
