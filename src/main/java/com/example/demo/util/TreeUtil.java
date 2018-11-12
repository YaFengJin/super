package com.example.demo.util;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class TreeUtil {
    public List<Map<String,Object>> menuCommon;
    public List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    public List<Map<String,Object>> treeList(List<Map<String,Object>> tree){
        this.menuCommon = tree;
        for (Map<String,Object> t : tree) {
            Map<String,Object> map = new LinkedHashMap<String, Object>();
            if((Integer) t.get("pid")==0){
                map.put("id",t.get("id"));
                map.put("name", t.get("name"));
                map.put("parentId",t.get("pid"));
                map.put("value",t.get("id"));
                map.put("checked",t.get("checked"));
                map.put("list", treeChild((Integer)t.get("id")));
                list.add(map);
            }
        }
        return list;
    }

    public List<Map<String,Object>> treeChild(Integer id){
        List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
        for(Map<String,Object> a:menuCommon){
            Map<String,Object> childArray = new LinkedHashMap<String, Object>();
            if(a.get("pid")==id){
                childArray.put("id",a.get("id"));
                childArray.put("parentId",a.get("pid"));
                childArray.put("value",a.get("id"));
                childArray.put("name", a.get("name"));
                childArray.put("checked",a.get("checked"));
                childArray.put("list", treeChild((Integer)a.get("id")));
                lists.add(childArray);
            }
        }
        return lists;
    }
}
