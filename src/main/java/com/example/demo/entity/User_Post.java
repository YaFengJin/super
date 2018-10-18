package com.example.demo.entity;

public class User_Post {
    private Integer userPost;

    private Integer postid;

    private Integer userid;

    private Usersurface user;

    private Post post;

    public Integer getUserPost() {
        return userPost;
    }

    public void setUserPost(Integer userPost) {
        this.userPost = userPost;
    }

    public Integer getPostid() {
        return postid;
    }

    public void setPostid(Integer postid) {
        this.postid = postid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public User_Post(Integer userPost, Integer postid, Integer userid, Usersurface user, Post post) {
        this.userPost = userPost;
        this.postid = postid;
        this.userid = userid;
        this.user = user;
        this.post = post;
    }

    public User_Post() {
    }

    public Usersurface getUser() {
        return user;
    }

    public void setUser(Usersurface user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}