package com.example.demo.controller.jyf;

import com.example.demo.entity.Post;
import com.example.demo.service.jyf.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService ser;
    //用户登录
    @RequestMapping(value = "/userLogin",method = RequestMethod.POST)
    public  String  userLogin(String name,String password){
        Subject subject= SecurityUtils.getSubject();
        String newPassword=new SimpleHash("MD5",password,name,1024).toHex();
        UsernamePasswordToken usernamePasswordToken=new UsernamePasswordToken(name,newPassword);
        //进行验证，这里可以捕获异常，然后返回对应信息
        subject.login(usernamePasswordToken);
        // shiro登陆验证
        try {
            SecurityUtils.getSubject().login(usernamePasswordToken);
        } catch (UnknownAccountException ex) {
            return "用户不存在！";
        } catch (IncorrectCredentialsException ex) {
            return "密码错误！";
        } catch (ExcessiveAttemptsException e) {
            // TODO: handle exception
            return "登录失败多次，账户锁定10分钟";
        } catch (AuthenticationException ex) {
            return ex.getMessage(); // 自定义报错信息
        } catch (Exception ex) {
            ex.printStackTrace();
            return "内部错误，请重试！";
        }
        return "success";
    }
    //查询菜单
    @RequestMapping(value = "/queryUser", method = RequestMethod.POST)
    public List<Map<String, Object>> queryUser(int id) {
        List<Map<String, Object>> queryuser = ser.queryUser(id);
        return queryuser;
    }

    //查询角色
    @RequestMapping(value = "/queryRole")
    public Map<String, Object> queryRole(@RequestParam(required = false, defaultValue = "1") int limit, @RequestParam(required = false, defaultValue = "1") int page, String postName) {
        Page<Map<String, Object>> pages = PageHelper.startPage(page, limit);
        List<Map<String, Object>> list = ser.queryRole(postName);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pages.getTotal());
        map.put("data", list);
        return map;
    }

    //查询部门
    @RequestMapping(value = "/queryDept", method = RequestMethod.POST)
    public List<Map<String, Object>> queryDept() {
        List<Map<String, Object>> list = ser.queryDept();
        return list;
    }

    //添加角色
    @RequestMapping(value = "/saveRole", method = RequestMethod.POST)
    public Map<String, Object> saveRole(Post p) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = ser.saveRole(p);
        if (i > 0) {
            map.put("message", "添加成功");
        } else {
            map.put("message", "添加失败");
        }
        return map;
    }

    //删除角色
    @RequestMapping(value = "/deleteRole", method = RequestMethod.POST)
    public Map<String, Object> deleteRole(int id) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = ser.deleteRole(id);
        if (i > 0) {
            map.put("message", "删除成功");
        } else {
            map.put("message", "删除失败");
        }
        return map;
    }

    //修改角色
    @RequestMapping(value = "/updateRole", method = RequestMethod.POST)
    public Map<String, Object> updateRole(Post p) {
        Map<String, Object> map = new HashMap<String, Object>();
        int i = ser.updateRole(p);
        if (i > 0) {
            map.put("message", "修改成功");
        } else {
            map.put("message", "修改失败");
        }
        return map;
    }

    //查询角色拥有的权限
    @RequestMapping(value = "/queryPostMenu", method = RequestMethod.POST)
    public List<Map<String, Object>> queryPostMenu(int id) {
        List<Map<String, Object>> maps = ser.queryPostMenu(id);
        return maps;
    }

    //给角色分配权限
    @RequestMapping(value = "/grantMenuforpost", method = RequestMethod.POST)
    public Map<String, Object> grantMenuforpost(int id,String menuid) {
        int result = ser.grantMenuforpost(id, menuid);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("message", "分配成功");
        } else {
            map.put("message", "分配失败");
        }
        return map;
    }

}
