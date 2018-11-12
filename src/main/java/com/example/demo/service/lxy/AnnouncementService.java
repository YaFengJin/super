package com.example.demo.service.lxy;

import com.example.demo.entity.Announcement;

import java.util.List;
import java.util.Map;

public interface AnnouncementService {
    /*
     * 公告内容查询
     * */
    public List<Map<String,Object>> findAnnouncement();
    /*
     * 公告通知【分页条件模糊查询】
     * */
    public List<Map<String,Object>> pageAnnouncement(String name);
    /*
     * 公告管理删除
     * */
    public int deleteAnnouncement(Announcement an);
    /*
     * 公告通知编辑
     * 查询类型
     * */
    public int updateAnnouncement(Announcement an);
    public List<Map<String,Object>> findAnnouncementtype();
    /*
    * 新建公告
    * */
    public int saveAnnouncement(Announcement an);

    /*
    * 更新状态【1生效，2终止】
    * */
    public int updateState(Announcement an);
    public int update(Announcement an);
}
