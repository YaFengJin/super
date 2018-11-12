package com.example.demo.service.lxy;

import com.example.demo.dao.lxy.AnnouncementDao;
import com.example.demo.entity.Announcement;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class AnnouncementServiceImp implements AnnouncementService{
    @Resource
    private AnnouncementDao dao;


    //公告通知查询
    public List<Map<String,Object>> findAnnouncement(){
        return dao.findAnnouncement();
    }

      /*分页模糊条件查询
      分页总条数*/
     public List<Map<String,Object>> pageAnnouncement(String name){
         return dao.pageAnnouncement(name);
     }

     //删除
    @Override
    public int deleteAnnouncement(Announcement an) {
        return dao.deleteAnnouncement(an);
    }

    //更新
    @Override
    public int updateAnnouncement(Announcement an) {
         return dao.updateAnnouncement(an);
    }
    @Override
    public List<Map<String,Object>> findAnnouncementtype() {
        return dao.findAnnouncementtype();
    }

    //新建公告
    @Override
    public int saveAnnouncement(Announcement an) {
        return dao.saveAnnouncement(an);
    }

    /*
    * 更新状态【1生效，2终止】
    * */
    @Override
    public int updateState(Announcement an) {
        return dao.updateState(an);
    }

    @Override
    public int update(Announcement an) {
        return dao.update(an);
    }

}
