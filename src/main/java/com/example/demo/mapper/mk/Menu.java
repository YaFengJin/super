package com.example.demo.mapper.mk;

import com.example.demo.entity.Post_Menu;

import java.util.List;

public class Menu {
    private Integer menuid;

    private String menufid;

    private String menuname;

    private String menuurl;

    private List<Post_Menu>post_menus;

    public Integer getMenuid() {
        return menuid;
    }

    public void setMenuid(Integer menuid) {
        this.menuid = menuid;
    }

    public String getMenufid() {
        return menufid;
    }

    public void setMenufid(String menufid) {
        this.menufid = menufid == null ? null : menufid.trim();
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname == null ? null : menuname.trim();
    }

    public String getMenuurl() {
        return menuurl;
    }

    public void setMenuurl(String menuurl) {
        this.menuurl = menuurl == null ? null : menuurl.trim();
    }

    public Menu(Integer menuid, String menufid, String menuname, String menuurl, List<Post_Menu> post_menus) {
        this.menuid = menuid;
        this.menufid = menufid;
        this.menuname = menuname;
        this.menuurl = menuurl;
        this.post_menus = post_menus;
    }

    public Menu() {
    }

    public List<Post_Menu> getPost_menus() {
        return post_menus;
    }

    public void setPost_menus(List<Post_Menu> post_menus) {
        this.post_menus = post_menus;
    }
}