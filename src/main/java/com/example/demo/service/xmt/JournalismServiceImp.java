package com.example.demo.service.xmt;

import com.example.demo.dao.xmt.JournalismDao;
import com.example.demo.entity.Document;
import com.example.demo.entity.Filing_Cabinet;
import com.example.demo.entity.Journalism;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class JournalismServiceImp implements JournalismService{
    @Resource
    private JournalismDao dao;
//查询新闻表（Journalism）
    public List<Map<String,Object>> query() {
        return dao.query();
    }
  /*  //通过id编号删除新闻表（journalism）
   public int delete(Journalism j){
    return dao.delete(j);
   }*/
   //条件查询
  public List<Map<String,Object>> pagefind(String name,String perosn){
      return dao.pagefind(name, perosn);
  }
  //删除
    public int delete(int JL_Id){
      return dao.delete(JL_Id);
    }
    //编辑
    public int update(Journalism j){
      return dao.update(j);
    }
    //查询新闻类型
    public List<Map<String,Object>> findtype(){
      return dao.findtype();
    }
    //添加
    public int save(Journalism j){
      return dao.save(j);
    }
    //查询评论类型
    public List<Map<String,Object>> findtype1(){
      return dao.findtype1();
    }
    //状态（0==生效，1==终止）
    public int State(Journalism j){
      return dao.State(j);
    }
    public int State1(Journalism j){
      return dao.State1(j);
    }
    //查询评论表
    public List<Map<String,Object>> Comquery(){
    return dao.Comquery();
    }
    //知识管理条件查询（公共文件柜）
    public List<Map<String,Object>> pagefind1( String dname){
    return dao.pagefind1(dname);
    }
    //文件柜删除
    public int ddelete(int documentId){
    return dao.ddelete(documentId);
    }
    //文件柜编辑
    public int dupdate(Document d){
    return dao.dupdate(d);
    }
    //通过文件柜id查询内容
    public List<Map<String,Object>> dquery(int documentId){
    return dao.dquery(documentId);
    }
    //文件柜设置查询
    public List<Map<String,Object>> fquery(){
    return dao.fquery();
    }
    //文件柜设置添加
    public int fsave(Filing_Cabinet f){
    return dao.fsave(f);
    }
    //文件柜设置删除
    public int fdelete(int Filing_cabinetId){
    return dao.fdelete(Filing_cabinetId);
    }
    //文件柜设置编辑
    public int fupdate(Filing_Cabinet f){
    return dao.fupdate(f);
    }
    //查询父id
    public List<Map<String,Object>> ffquery(){
    return dao.ffquery();
    }
  @Override
  public List<Map<String, Object>> queryfiling() {
    List<Map<String, Object>> queryfiling = dao.queryfiling();
    return queryfiling;
  }
  //查看子目录
  public List<Map<String, Object>> queryChildFiling(int id) {
    List<Map<String, Object>> maps = dao.queryChildFiling(id);
    if(maps!=null&&maps.size()>0){
      return maps;
    }else{
      return dao.queryDocument(id);
    }


  }
}
