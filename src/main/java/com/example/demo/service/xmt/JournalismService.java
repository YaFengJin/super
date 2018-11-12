package com.example.demo.service.xmt;

import com.example.demo.entity.Filing_Cabinet;
import com.example.demo.entity.Journalism;
import com.example.demo.entity.Document;
import java.util.List;
import java.util.Map;

public interface JournalismService {
    public List<Map<String,Object>> query();
   /* public int delete(Journalism j);*/
    //条件查询
   public List<Map<String,Object>> pagefind(String name, String person);
   //删除
   public int delete(int JL_Id);
   //编辑
   public int update(Journalism j);
   //查询新闻类型
    public List<Map<String,Object>> findtype();
    //添加
    public int save(Journalism j);
    //查询评论类型
    public List<Map<String,Object>> findtype1();
    //状态（0==生效，1==终止）
    public int State(Journalism j);
    public int State1(Journalism j);
    //查询评论表
    public List<Map<String,Object>> Comquery();
    //知识管理
    //分页条件查询(公共文件柜)
    public List<Map<String,Object>> pagefind1(String dname);
    //文件柜删除
    public int ddelete(int documentId);
    //文件柜编辑
    public int dupdate(Document d);
    //通过id查询文件柜内容
    public List<Map<String,Object>> dquery(int documentId);
    //文件柜设置查询
    public List<Map<String,Object>> fquery();
    //文件柜设置添加
    public int fsave(Filing_Cabinet f);
    //文件柜设置删除
    public int fdelete(int Filing_cabinetId);
    //文件柜设置编辑
    public int fupdate(Filing_Cabinet f);
    //查询父id
    public List<Map<String,Object>> ffquery();
    //查询文件柜
     public List<Map<String,Object>> queryfiling();
    //查看子目录
   public List<Map<String,Object>>queryChildFiling(int id);
}
