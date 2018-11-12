package com.example.demo.service.jyf;

import com.example.demo.dao.jyf.UserDao;
import com.example.demo.entity.Menu;
import com.example.demo.entity.Post;
import com.example.demo.entity.Post_Menu;
import com.example.demo.entity.Usersurface;
import com.example.demo.util.MenuTreeUtil;
import com.example.demo.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao dao;

    @Override
    public List<Map<String, Object>> userLogin(String name, String password) {
        return dao.userLogin(name,password);
    }

    @Override
    public int select(String name) {
        return dao.select(name);
    }

    @Override
    public int update(String name, String password) {
        return dao.update(name,password);
    }

    @Override
    public Usersurface findByUser(String name) {
        return dao.findByUser(name);
    }

    @Override
    public List<Map<String, Object>> queryUser(int id) {
        MenuTreeUtil menuTree = new MenuTreeUtil();
        List<Map<String, Object>> list = dao.queryUser(id);
        List<Map<String, Object>> menulist = menuTree.menuList(list);
        return menulist;
    }

    @Override
    public List<Map<String, Object>> queryRole(String postName) {
        return dao.queryRole(postName);
    }

    @Override
    public List<Map<String, Object>> queryDept() {
        return dao.queryDept();
    }

    @Override
    public int saveRole(Post post) {
        return dao.saveRole(post);
    }

    @Override
    public int deleteRole(int id) {
        return dao.deleteRole(id);
    }

    @Override
    public int updateRole(Post p) {
        return dao.updateRole(p);
    }

    @Override
    public List<Map<String, Object>> queryPostMenu(int id) {
        //获取数据
        List<Map<String, Object>> list = dao.queryPostMenu(id);
        TreeUtil treeUtil=new TreeUtil();
        List<Map<String, Object>>tree=treeUtil.treeList(list);
       return tree;
    }
    @Transactional
    @Override
    public int grantMenuforpost(int id, String menuid) {
        int result=0;
        if (menuid==null || menuid==""){
            int delete=dao.deletePostMenu(id);
            if (delete>0){
                result=1;
            }
        }else{
            String[]menuids=menuid.split(",");
            List<Post_Menu>list=new ArrayList<Post_Menu>();
            for(int i=0;i<menuids.length;i++){
                Post_Menu pm=new Post_Menu();
                Post p=new Post();
                Menu m=new Menu();
                m.setMenuid(Integer.parseInt(menuids[i]));
                p.setPostid(id);
                pm.setMenu(m);
                pm.setPost(p);
                list.add(pm);
            }
            int delete=dao.deletePostMenu(id);
            if (delete>=0){
                int insert=dao.insertPostMenu(list);
                if(insert>0){
                    result=1;
                }else{
                    result=0;
                }
            }else{
                result=0;
            }
        }
        return result;
    }
}
