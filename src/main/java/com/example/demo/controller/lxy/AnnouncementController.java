package com.example.demo.controller.lxy;

import com.example.demo.entity.Announcement;
import com.example.demo.service.lxy.AnnouncementService;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/announcement")
public class AnnouncementController {
    @Resource
    private AnnouncementService service;

    Map<String, Object> map = new HashMap<String, Object>();

    /*
     * 公告内容查询
     * */
    @RequestMapping("/findAnnouncement")
    public List<Map<String, Object>> findAnnouncement() {
        return service.findAnnouncement();
    }

    /*
     * 公告通知【分页条件模糊查询】
     * */
    @RequestMapping("/pageAnnouncement")
    public Map<String, Object> pageAnnouncement(@RequestParam(required = false, defaultValue = "1") int page,
                                                @RequestParam(required = false, defaultValue = "10") int limit,
                                                String name) {
        Page<Map<String, Object>> pages = PageHelper.startPage(page, limit);
        List<Map<String, Object>> list = service.pageAnnouncement(name);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pages.getTotal());
        map.put("data", list);

        return map;
    }

    /*
     * 公告管理删除
     * */
    @RequestMapping(value="/deleteAnnouncement")
    public Map<String, Object> deleteAnnouncement(Announcement an) {
        int a = service.deleteAnnouncement(an);
        if (a > 0) {
            map.put("message", "执行成功");
        } else {
            map.put("message", "执行失败");
        }
        return map;
    }

    /*
     * 公告通知编辑
     * 查询类型
     * */
    @RequestMapping("/updateAnnouncement")
    public Map<String,Object> updateAnnouncement(Announcement an){
        int a=service.updateAnnouncement(an);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    @RequestMapping("/findAnnouncementtype")
    public List<Map<String,Object>> findAnnouncementtype() {
        return service.findAnnouncementtype();
    }
    /*
    * 新建公告
    * */
    @RequestMapping("/saveAnnouncement")
    public Map<String,Object> saveAnnouncement(Announcement an){
        int a=service.saveAnnouncement(an);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }



    /*
    * 更新状态【1生效，2终止】
    * */
    @RequestMapping("/updateState")
    public Map<String,Object> updateState(Announcement an){
        int a=service.updateState(an);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    @RequestMapping("/update")
    public Map<String,Object> update(Announcement an){
        int a=service.update(an);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }









}
