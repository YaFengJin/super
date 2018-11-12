package com.example.demo.entity;

import java.util.List;

public class Dept {
    private Integer deptid;

    private String deptname;

    private Integer deptfid;

    private String depttype;

    private List<Usersurface>usersurfaces;

    private List<Post>post;

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname == null ? null : deptname.trim();
    }

    public Integer getDeptfid() {
        return deptfid;
    }

    public void setDeptfid(Integer deptfid) {
        this.deptfid = deptfid;
    }

    public String getDepttype() {
        return depttype;
    }

    public void setDepttype(String depttype) {
        this.depttype = depttype == null ? null : depttype.trim();
    }

    public List<Usersurface> getUsersurfaces() {
        return usersurfaces;
    }

    public void setUsersurfaces(List<Usersurface> usersurfaces) {
        this.usersurfaces = usersurfaces;
    }

    public List<Post> getPost() {
        return post;
    }

    public void setPost(List<Post> post) {
        this.post = post;
    }

}