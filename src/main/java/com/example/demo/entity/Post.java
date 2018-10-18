package com.example.demo.entity;

import java.util.List;

public class Post {
    private Integer postid;

    private Integer deptid;

    private String posyfid;

    private String postname;

    private String duty;

    private Dept dept;

    private List<Post_Menu>post_menus;

    private List<User_Post>user_posts;

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getPosyfid() {
        return posyfid;
    }

    public void setPosyfid(String posyfid) {
        this.posyfid = posyfid == null ? null : posyfid.trim();
    }

    public String getPostname() {
        return postname;
    }

    public void setPostname(String postname) {
        this.postname = postname == null ? null : postname.trim();
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty == null ? null : duty.trim();
    }

    public Post(Integer postid, Integer deptid, String posyfid, String postname, String duty, Dept dept, List<Post_Menu> post_menus, List<User_Post> user_posts) {
        this.postid = postid;
        this.deptid = deptid;
        this.posyfid = posyfid;
        this.postname = postname;
        this.duty = duty;
        this.dept = dept;
        this.post_menus = post_menus;
        this.user_posts = user_posts;
    }

    public Post() {
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public List<Post_Menu> getPost_menus() {
        return post_menus;
    }

    public void setPost_menus(List<Post_Menu> post_menus) {
        this.post_menus = post_menus;
    }

    public List<User_Post> getUser_posts() {
        return user_posts;
    }

    public void setUser_posts(List<User_Post> user_posts) {
        this.user_posts = user_posts;
    }
}