package com.example.demo.dao.mb;

import com.example.demo.entity.Dictionaries;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface DictionariesDao {
    //添加
    @Insert("insert into dictionaries(dictionariesname,dictionariestypename,)" +
            "values(#{dictionariesname},#{dictionariestypename}) ")
    int savedicti(Dictionaries dicti);
    //查询部门
    @Select("select DictionariesTypeName,dictionariesname from dictionaries")
    List<Map<String,Object>>query();
}
