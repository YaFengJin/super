package com.example.demo.entity;

public class Post_Menu {
    private Integer postMenuid;

    private Integer menuid;

    private Integer postid;

    private Post post;

    private Menu menu;

    public Integer getPostMenuid() {
        return postMenuid;
    }

    public void setPostMenuid(Integer postMenuid) {
        this.postMenuid = postMenuid;
    }

    public Integer getMenuid() {
        return menuid;
    }

    public void setMenuid(Integer menuid) {
        this.menuid = menuid;
    }

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public Post_Menu(Integer postMenuid, Integer menuid, Integer postid, Post post, Menu menu) {
        this.postMenuid = postMenuid;
        this.menuid = menuid;
        this.postid = postid;
        this.post = post;
        this.menu = menu;
    }

    public Post_Menu() {
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}