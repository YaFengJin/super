package com.example.demo.controller.jyf;

import com.example.demo.entity.Dept;
import com.example.demo.entity.RecruitPlan;
import com.example.demo.service.jyf.PlanService;
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
public class PlanController {
    @Autowired
    private PlanService ser;
    @RequestMapping(value = "savePlan",method = RequestMethod.POST)
    public Map<String,Object> savePlan(@RequestParam("file") MultipartFile file, HttpServletRequest request, RecruitPlan recruitPlan){
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
        recruitPlan.setRecruitAccess(request.getContextPath() + "/upload/" + name);
        Map<String,Object>map=new HashMap<String, Object>();
        int i = ser.savePlan(recruitPlan);
        if (i>0){
           map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
      @RequestMapping(value = "/queryDeptUser",method = RequestMethod.POST)
      public  List<Map<String,Object>> queryDeptUser(String deptids){
           String[]deptid=deptids.split(",");
           List<Dept>list=new ArrayList<Dept>();
           for (int i=0;i<deptid.length;i++){
               Dept d=new Dept();
               d.setDeptid(Integer.parseInt(deptid[i]));
               list.add(d);
           }
          List<Map<String, Object>> maps = ser.queryDeptUser(list);
          return maps;
      }

      @RequestMapping("/queryPlanUser")
      public Map<String,Object>queryPlanUser(int limit,int page){
          Page<Map<String, Object>> objects = PageHelper.startPage(page, limit);
          List<Map<String, Object>> maps = ser.queryPlanUser();
          Map<String,Object>map=new HashMap<String, Object>();
          map.put("code",0);
          map.put("msg","");
          map.put("data",objects.getResult());
          map.put("count",objects.getTotal());
          return map;
      }
      @RequestMapping(value = "/updatePlan",method = RequestMethod.POST)
      public Map<String,Object>updatePlan(RecruitPlan plan){
          int i = ser.updatePlan(plan);
          Map<String,Object>map=new HashMap<String, Object>();
          if (i>0){
              map.put("message","1");
          }else {
              map.put("message","0");
          }
          return map;
      }
      @RequestMapping(value = "/deletePlan",method = RequestMethod.POST)
      public  Map<String,Object>deletePlan(int id){
           Map<String,Object>map=new HashMap<String, Object>();
          int i = ser.deletePlan(id);
          if (i>0){
              map.put("message","1");
          }else{
              map.put("message","0");
          }
          return map;
      }
    @RequestMapping(value = "/ApplyPlan",method = RequestMethod.POST)
      public Map<String,Object>ApplyPlan(int id){
        Map<String,Object>map=new HashMap<String, Object>();
        int i = ser.ApplyPlan(id);
        if (i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping(value = "/ApplyNotPlan",method = RequestMethod.POST)
    public Map<String,Object>ApplyNotPlan(int id){
        Map<String,Object>map=new HashMap<String, Object>();
        int i = ser.ApplyNotPlan(id);
        if (i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
}
