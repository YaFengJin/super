package com.example.demo.dao.xx;

import com.example.demo.entity.Usersurface;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;


//招聘管理
@Mapper
public interface DeptUserDao {
    /*查询部门*/
    @Select("select * from Dept")
    List<Map> userdeptselect();
    @Select("select * from Usersurface where DeptId = #{deptId}")
    List<Map> Usersurfaceid(Usersurface u);
}
