package com.example.demo.controller.mk;

import com.example.demo.entity.Facility;
import com.example.demo.service.mk.NewFacilityService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/NewFacilityController")
public class NewFacilityController {
     @Autowired
     private NewFacilityService service;

    /**
     * 新建设备
     * @param f
     * @return
     */
    @RequestMapping("/NewFacility")
    public Map NewFacility(Facility f) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isNewFacility(f);
        if (a > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    /**
     * 查询会议室类型
     * @return
     */
    @RequestMapping("/QueryMeetType")
    public List<Map<String,Object>> QueryMeetType(){
        return service.isQueryMeetType();
    }

    /**
     * 设备管理
     * @param limit
     * @param page
     * @param fName
     * @return
     */
    @RequestMapping("/queryRole")
    public  Map<String,Object> queryRole(@RequestParam(required=false,defaultValue="1")int limit, @RequestParam(required=false,defaultValue="1")int page, String fName){
        Page<Map<String,Object>> pages= PageHelper.startPage(page,limit);
        List<Map<String, Object>> list = service.isQueryFacility(fName);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        return map;
    }

    /**
     * 删除会议设备
     * @param f
     * @return
     */
    @RequestMapping("/DeleteFacility")
    public Map DeleteFacility(Facility f) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isDeleteFacility(f);
        if (a > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    /**
     * 更新会议设备
     * @param f
     * @return
     */
    @RequestMapping("/UpdateFacility")
    public Map UpdateFacility(Facility f) {
        Map<String, Object> map = new HashMap<String, Object>();
        int a = service.isUpdateFacility(f);
        if (a > 0) {
            map.put("message", "编辑成功");
        } else {
            map.put("message", "编辑失败");
        }
        return map;
    }
}
