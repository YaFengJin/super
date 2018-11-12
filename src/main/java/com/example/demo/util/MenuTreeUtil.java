package com.example.demo.util;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class MenuTreeUtil {
    public List<Map<String,Object>> menuCommon;
    public List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    public List<Map<String,Object>> menuList(List<Map<String,Object>> menu){
        this.menuCommon = menu;
        for (Map<String,Object> x : menu) {
            Map<String,Object> mapArr = new LinkedHashMap<String, Object>();
            if((Integer) x.get("pid")==0){
                mapArr.put("name", x.get("name"));
                mapArr.put("url", x.get("url"));
                mapArr.put("children", menuChild((Integer)x.get("id")));
                list.add(mapArr);
            }
        }
        return list;
    }

    public List<Map<String,Object>> menuChild(Integer id){
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
        for(Map<String,Object> a:menuCommon){
            Map<String,Object> childArray = new LinkedHashMap<String, Object>();
            if(a.get("pid")==id){
                childArray.put("name", a.get("name"));
                childArray.put("url", a.get("url"));
                childArray.put("children", menuChild((Integer) a.get("id")));
                lists.add(childArray);
            }
        }
        return lists;
    }
}
