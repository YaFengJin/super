package com.example.demo.service.xx;

import com.example.demo.entity.Usersurface;

import java.util.List;
import java.util.Map;

public interface DeptUserService {
    /*查询部门*/
    List<Map> userdeptselect();
    List<Map> Usersurfaceid(Usersurface u);
}
