package com.example.demo.entity;

public class Post_Menu {
    private Integer postMenuid;

    private Post post;

    private Menu menu;

    public Integer getPostMenuid() {
        return postMenuid;
    }

    public void setPostMenuid(Integer postMenuid) {
        this.postMenuid = postMenuid;
    }


    public Post_Menu(Integer postMenuid,  Post post, Menu menu) {
        this.postMenuid = postMenuid;
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