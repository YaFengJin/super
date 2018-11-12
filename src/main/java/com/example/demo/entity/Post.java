package com.example.demo.entity;

import java.util.List;

public class Post {
    private Integer postid;

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

    public String getPostname() {
        return postname;
    }

    public void setPostname(String postname) {
        this.postname = postname;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
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

    public Post(Integer postid,String postname, String duty, Dept dept, List<Post_Menu> post_menus, List<User_Post> user_posts) {
        this.postid = postid;
        this.postname = postname;
        this.duty = duty;
        this.dept = dept;
        this.post_menus = post_menus;
        this.user_posts = user_posts;
    }

    public Post() {
    }

    @Override
    public String toString() {
        return super.toString();
    }
}