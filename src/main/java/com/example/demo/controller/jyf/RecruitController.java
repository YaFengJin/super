package com.example.demo.controller.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitNeed;
import com.example.demo.service.jyf.RecruitService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/recruit")
public class RecruitController {
    @Autowired
    private RecruitService ser;

    @RequestMapping(value = "/saveRecruit_Need", method = RequestMethod.POST)
    public Map<String, Object> saveRecruit_Need(String postAsk, RecruitNeed r, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
            String path = request.getServletContext().getRealPath("/upload/");
            String name = file.getOriginalFilename();
            File targetFile = new File(path, name);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            try {
                file.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            r.setRecruitNAccess(request.getContextPath() + "/upload/" + name);
        r.setPostAsk(postAsk);
        int i = ser.saveRecruit_Need(r);
        Map<String, Object> map = new HashMap<String, Object>();
        if (i > 0) {
            map.put("message", "1");
        } else {
            map.put("message", "0");
        }
        return map;
    }

    @RequestMapping(value = "/queryDept", method = RequestMethod.POST)
    public List<Map<String, Object>> queryDept() {
        List<Map<String, Object>> maps = ser.queryDept();
        return maps;
    }

    @RequestMapping(value = "/queryDeptName", method = RequestMethod.POST)
    public String[] queryDeptName(String deptid) {
        List<Dept> list = new ArrayList<Dept>();
        String[] deptids = deptid.split(",");
        for (int i = 0; i < deptids.length; i++) {
            Dept d = new Dept();
            d.setDeptid(Integer.parseInt(deptids[i]));
            list.add(d);
        }
        String[] strings = ser.queryDeptName(list);
        return strings;
    }

    @RequestMapping(value = "/queryRecruit_Need")
    public Map<String, Object> queryRecruit_Need(String begintime, String endtime, int limit, int page) {
        Page<Map<String, Object>> pages = PageHelper.startPage(page, limit);
        List<Map<String, Object>> maps = ser.queryRecruit_Need(begintime, endtime);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("data", pages.getResult());
        map.put("count", pages.getTotal());
        return map;
    }

    @RequestMapping(value = "/updateRecruit_Need", method = RequestMethod.POST)
    public Map<String, Object> updateRecruit_Need(String postAsk, RecruitNeed r, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
            String path = request.getServletContext().getRealPath("/upload/");
            String name = file.getOriginalFilename();
            File targetFile = new File(path, name);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            try {
                file.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            r.setRecruitNAccess(request.getContextPath() + "/upload/" + name);
        r.setPostAsk(postAsk);
        int i = ser.updateRecruit_Need(r);
        if (i > 0) {
            map.put("message", "1");
        } else {
            map.put("message", "0");
        }
        return map;
    }

    //修改招聘需求查询部门并选中
    @RequestMapping(value = "/updateQueryDeptName", method = RequestMethod.POST)
    public List<Map<String, Object>> updateQueryDeptName(int id) {
        List<Map<String, Object>> list = ser.queryDept1(id);
        return list;
    }

    //删除招聘需求
    @RequestMapping(value = "/deleteRecruit_Need", method = RequestMethod.POST)
    public Map<String, Object> deleteRecruit_Need(int id) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = ser.deleteRecruit_Need(id);
        if (i > 0) {
            map.put("message", "1");
        } else {
            map.put("message", "0");
        }
        return map;
    }

    @RequestMapping(value = "/queryDeptUserNames", method = RequestMethod.POST)
    public Map<String, Object> queryDeptUserNames(String deptid) {
        Map<String, Object> map = ser.queryDeptNameIds(deptid);
        return map;
    }

}
