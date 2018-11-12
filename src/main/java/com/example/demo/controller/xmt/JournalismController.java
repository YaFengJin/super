package com.example.demo.controller.xmt;

import com.example.demo.entity.Document;
import com.example.demo.entity.Filing_Cabinet;
import com.example.demo.entity.Journalism;
import com.example.demo.service.xmt.JournalismService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/journalism")
public class JournalismController {
 @Resource
    private JournalismService service;
   Map<String,Object> map = new HashMap<String,Object>();
    @ResponseBody
    //查询新闻表（journalism）
   @RequestMapping("/query")
     public List<Map<String,Object>> query(){
       System.out.print("jdhfjdf");
      /* map.put("map",map);
       System.out.print(map);*/
       return service.query();
   }
//删除新闻表(journalism)
@ResponseBody
@RequestMapping("/delete")
public Map<String,Object> delete(int JL_Id){
        System.out.print("成功");
        int a = service.delete(JL_Id);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
    }
        return map;
}
//分页条件查询
    @RequestMapping("/pagefind")
    public Map<String,Object> pagefind(@RequestParam(required = false,defaultValue = "2")int page,@RequestParam(required = false,defaultValue = "5")int limit,String name,String person){
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map<String,Object>> list = service.pagefind(name,person);
       map.put("code",0);
       map.put("msg","");
       map.put("count",pages.getTotal());
       map.put("data",list);
       return map;
    }
    //编辑
    @ResponseBody
    @RequestMapping("/update")
public Map<String,Object> update(Journalism j){
        System.out.print("编辑成功");
        int a = service.update(j);
        if(a>0){
            map.put("message","执行成功");
        }else {
            map.put("message","执行失败");
        }
        return map;
}
//查询新闻类型
@ResponseBody
@RequestMapping("/findtype")
    public List<Map<String,Object>> findtype(){
return service.findtype();
    }
    //添加新闻
    @ResponseBody
    @RequestMapping("/save")
    public Map<String,Object> save(Journalism j){
        System.out.print("编辑成功");
        int a = service.save(j);
        if(a>0){
            map.put("message","执行成功");
        }else {
            map.put("message","执行失败");
        }
        return map;
    }
    //查询新闻类型
    @ResponseBody
    @RequestMapping("/findtype1")
    public List<Map<String,Object>> findtype1(){
        return service.findtype1();
    }
    //状态（1==生效，2==终止）
    @ResponseBody
    @RequestMapping("/State")
    public Map<String,Object> State(Journalism j){
        System.out.print("成功了");
        int a = service.State(j);
        if(a>0){
           map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    //状态
    @ResponseBody
    @RequestMapping("/State1")
    public Map<String,Object> State1(Journalism j){
      System.out.print("成功");
      int a = service.State1(j);
      if(a>0){
          map.put("message","执行成功");
      }else{
          map.put("message","执行失败");
      }
      return map;
    }
    @ResponseBody
    @RequestMapping("/Comquery")
    public List<Map<String,Object>> Comquery(){
        System.out.print("哈哈哈哈");
        return service.Comquery();
    }
    //知识管理条件查询
    //分页条件查询(公共文件柜)
    @ResponseBody
    @RequestMapping("/pagefind1")
    public Map<String,Object> pagefind1(@RequestParam(required = false,defaultValue = "2")int page,@RequestParam(required = false,defaultValue = "5")int limit,String dname){
       System.out.print("成功");
        Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
        List<Map<String,Object>> list = service.pagefind1(dname);
        map.put("code",0);
        map.put("msg","");
        map.put("count",pages.getTotal());
        map.put("data",list);
        return map;
    }
    //文件柜删除

    @ResponseBody
    @RequestMapping("/ddelete")
    public Map<String,Object> ddelete(int documentId){
        System.out.print("删除成功");
        int a = service.ddelete(documentId);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    //文件柜编辑

    @ResponseBody
    @RequestMapping("/dupdate")
    public Map<String,Object> dupdate(Document d){
        System.out.print("编辑成功");
        int a = service.dupdate(d);
        if(a>0){
            map.put("message","执行成功");
        }else {
            map.put("message","执行失败");
        }
        return map;
    }
    //通过文件柜id查询内容
    @ResponseBody
    @RequestMapping("/dquery")
    public List<Map<String,Object>> dquery(int documentId){
        return  service.dquery(documentId);
    }
    //文件柜设置查询
    @ResponseBody
    @RequestMapping("/pagequery")
    public Map<String,Object> pagequery(@RequestParam(required = false,defaultValue = "2")int page,@RequestParam(required = false,defaultValue = "5")int limit){
     System.out.print("成功");
     Page<Map<String,Object>> pages = PageHelper.startPage(page,limit);
     List<Map<String,Object>> list = service.fquery();
     map.put("code",0);
     map.put("msg","");
     map.put("count",pages.getTotal());
     map.put("data",list);
        return map;
    }
    //文件柜设置添加
    @ResponseBody
    @RequestMapping("/fsave")
    public Map<String,Object> fsave(Filing_Cabinet f){
        System.out.print("添加成功");
        int a = service.fsave(f);
        if(a>0){
            map.put("message","执行成功");
        }else {
            map.put("message","执行失败");
        }
        return map;
    }
    //文件柜设置删除
    @ResponseBody
    @RequestMapping("/fdelete")
    public Map<String,Object> fdelete(int Filing_cabinetId){
        System.out.print("删除成功");
        int a = service.fdelete(Filing_cabinetId);
        if(a>0){
            map.put("message","执行成功");
        }else{
            map.put("message","执行失败");
        }
        return map;
    }
    //文件柜设置编辑
    @ResponseBody
    @RequestMapping("/fupdate")
    public Map<String,Object> fupdate(Filing_Cabinet f){
        System.out.print("编辑成功");
        int a = service.fupdate(f);
        if(a>0){
            map.put("message","执行成功");
        }else {
            map.put("message","执行失败");
        }
        return map;
    }
    //查询父id
    @ResponseBody
    @RequestMapping("/ffquery")
    public List<Map<String,Object>> ffquery(){
        return service.ffquery();
    }


    @RequestMapping(value = "/queryfiling",method = RequestMethod.POST)
    public List<Map<String,Object>>queryfiling(){
        List<Map<String, Object>> queryfiling = service.queryfiling();
        return queryfiling;
    }
    // //查看子目录
    @RequestMapping(value = "/queryChildFiling",method = RequestMethod.POST)
    public List<Map<String,Object>>queryChildFiling(int id){
        System.out.print("阿顺帆");

        List<Map<String, Object>> maps = service.queryChildFiling(id);
        System.out.println(maps);
        return maps;
    }
}

