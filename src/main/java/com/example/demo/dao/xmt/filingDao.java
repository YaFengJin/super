package com.example.demo.dao.xmt;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface filingDao {
    /*
    * 查询文件柜
    * */
    @Select("select  " +
            "f.Filing_cabinetId as id,f.Filing_cabinetFId as parentid," +
            "f.Filing_cabinetName as name " +
            "from filing_cabinet as f")
    List<Map<String,Object>>queryfiling();
    //查看子目录
    @Select("select " +
            "f.Filing_cabinetId as id,f.Filing_cabinetName as name " +
            "from filing_cabinet as f where f.Filing_cabinetFId=#{id}")
    List<Map<String,Object>>queryChildFiling(@Param("id")int id);
    //查看文件
    @Select("select d.documentId as id,d.Filing_cabinetId as fid,d.documentName as name," +
            "d.documentCon as con,d.documentAccess as access  " +
            "from filing_cabinet as f,document as d " +
            "where f.Filing_cabinetId=d.Filing_cabinetId and f.Filing_cabinetId=#{id}")
    List<Map<String,Object>>queryDocument(@Param("id")int id);

}
