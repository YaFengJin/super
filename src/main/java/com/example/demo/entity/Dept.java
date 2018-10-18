package com.example.demo.entity;

import java.util.List;

public class Dept {
    private Integer deptid;

    private String deptname;

    private String deptfid;

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

    public String getDeptfid() {
        return deptfid;
    }

    public void setDeptfid(String deptfid) {
        this.deptfid = deptfid == null ? null : deptfid.trim();
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

    public Dept(Integer deptid, String deptname, String deptfid, String depttype, List<Usersurface> usersurfaces, List<Post> post) {
        this.deptid = deptid;
        this.deptname = deptname;
        this.deptfid = deptfid;
        this.depttype = depttype;
        this.usersurfaces = usersurfaces;
        this.post = post;
    }

    public Dept() {
    }
}