package com.example.demo.controller.jyf;

import com.example.demo.entity.RecruitHire;
import com.example.demo.service.jyf.HireService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/recruit")
public class HireController {
    @Autowired
    private HireService ser;

    @RequestMapping(value = "/queryDeptOne",method = RequestMethod.POST)
    public List<Map<String,Object>>queryDeptOne(String deptids){
        List<Map<String, Object>> maps = ser.queryDeptOne(deptids);
        return maps;
    }
    @RequestMapping(value = "/queryEmpType",method = RequestMethod.POST)
    public List<Map<String,Object>>queryEmpType(){
        List<Map<String, Object>> maps = ser.queryEmpType();
        return maps;
    }
    @RequestMapping(value = "/saveRecruitHire",method = RequestMethod.POST)
    public Map<String,Object>saveRecruitHire(RecruitHire hire){
        int i = ser.saveRecruitHire(hire);
        Map<String,Object>map=new HashMap<String, Object>();
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
    @RequestMapping("/queryRecruitHire")
    public Map<String,Object>queryRecruitHire(int limit,int page){
        Map<String,Object>map=new HashMap<String, Object>();
        Page<List<Map<String,Object>>>pages=PageHelper.startPage(page,limit);
        List<Map<String, Object>> maps = ser.queryRecruitHire();
        map.put("code",0);
        map.put("msg","");
        map.put("data",pages.getResult());
        map.put("count",pages.getTotal());
        return map;
    }
    @RequestMapping(value = "/updateRecruitHire",method = RequestMethod.POST)
    public Map<String,Object>updateRecruitHire(RecruitHire recruitHire){
        Map<String,Object>map=new HashMap<String, Object>();
        int i = ser.updateRecruitHire(recruitHire);
        if(i>0){
            map.put("message","1");
        }else{
            map.put("message","0");
        }
        return map;
    }
}
