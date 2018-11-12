package com.example.demo.util;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class deptTree {
    public List<Map<String,Object>> menuCommon;
    public List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    public List<Map<String,Object>> deptList(List<Map<String,Object>> menu){
        this.menuCommon = menu;
        for (Map<String,Object> x : menu) {
            Map<String,Object> mapArr = new LinkedHashMap<String, Object>();
            if((Integer) x.get("pid")==0){
                mapArr.put("id",x.get("id"));
                mapArr.put("name", x.get("name"));
                mapArr.put("parentId",x.get("pid"));
                if(x.get("checked")!=null && (Integer) x.get("checked")==1){
                    mapArr.put("checked",x.get("checked"));
                }
                mapArr.put("value",x.get("id"));
                mapArr.put("list", deptChild((Integer)x.get("id")));
                list.add(mapArr);
            }
        }
        return list;
    }

    public List<Map<String,Object>> deptChild(Integer id){
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
        for(Map<String,Object> a:menuCommon){
            Map<String,Object> childArray = new LinkedHashMap<String, Object>();
            if(a.get("pid")==id){
                childArray.put("id", a.get("id"));
                childArray.put("name", a.get("name"));
                childArray.put("parentId", a.get("pid"));
                if(a.get("checked")!=null && (Integer) a.get("checked")==1){
                    childArray.put("checked",a.get("checked"));
                }
                childArray.put("value", a.get("id"));
                childArray.put("list", deptChild((Integer) a.get("id")));
                lists.add(childArray);
            }
        }
        return lists;
    }
}
