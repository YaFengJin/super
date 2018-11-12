package com.example.demo.controller.mb;

import com.example.demo.entity.EmpType;
import com.example.demo.entity.Usersurface;
import com.example.demo.service.mb.UsersurfaceService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/mb")
public class UsersurfaceController {
    @Autowired
    private UsersurfaceService service;

    @RequestMapping("/queryUser")
    public Map<String, Object> queryUser(@RequestParam(value = "limit", defaultValue = "1") int limit, @RequestParam(value = "page", defaultValue = "1") int page) {
        Page<Map<String, Object>> p = PageHelper.startPage(page, limit);
        List<Map<String, Object>> list = service.select();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", p.getTotal());
        map.put("data", p.getResult());
        return map;
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public Map<String, Object> updateUser(Usersurface user) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = service.updateUser(user);
        if (i > 0) {
            map.put("message", "更新成功");
        } else {
            map.put("message", "更新失败");
        }
        return map;
    }

    @RequestMapping(value = "/queryDept", method = RequestMethod.POST)
    public List<Map<String, Object>> queryDept() {
        List<Map<String, Object>> maps = service.queryDept();
        return maps;
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public Map<String, Object> saveUser(Usersurface user) {
        String password=new SimpleHash("MD5",user.getUserpassword(),user.getUsername(),1024).toHex();
        user.setUserpassword(password);
        int i = service.saveUser(user);
        Map<String, Object> map = new HashMap<String, Object>();
        if (i > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    @RequestMapping(value = "/deleteUser")
    public Map<String, Object> deleteUser(int id) {
        int i = service.deleteUser(id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (i > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    //查询员工
    @RequestMapping(value = "/select1")
    public Map<String, Object> select1(@RequestParam(value = "limit", defaultValue = "1") int limit, @RequestParam(value = "page", defaultValue = "1") int page) {
        Page<Map<String, Object>> p = PageHelper.startPage(page, limit);
        List<Map<String, Object>> list = service.select1();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", p.getTotal());
        map.put("data", p.getResult());
        return map;
    }

    //增加员工
    @RequestMapping(value = "/savetype", method = RequestMethod.POST)
    public Map<String, Object> savetype(EmpType type) {
        int i = service.savetype(type);
        Map<String, Object> map = new HashMap<String, Object>();
        if (i > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }
}
