package com.example.demo.entity;

import java.util.List;

public class Usersurface {
    private Integer userid;

    private Integer deptid;

    private String useraccount;

    private String userpassword;

    private String username;

    private Dept dept;

    private List<User_Post>user_posts;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount == null ? null : useraccount.trim();
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword == null ? null : userpassword.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Usersurface(Integer userid, Integer deptid, String useraccount, String userpassword, String username, Dept dept, List<User_Post> user_posts) {
        this.userid = userid;
        this.deptid = deptid;
        this.useraccount = useraccount;
        this.userpassword = userpassword;
        this.username = username;
        this.dept = dept;
        this.user_posts = user_posts;
    }

    public Usersurface() {
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public List<User_Post> getUser_posts() {
        return user_posts;
    }

    public void setUser_posts(List<User_Post> user_posts) {
        this.user_posts = user_posts;
    }
}