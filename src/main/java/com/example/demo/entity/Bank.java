package com.example.demo.entity;

import java.util.List;

public class Bank {
    private Integer bId;

    private String bBankname;

    private String userid;

    private String deptid;

    private String bstate;

    private List<Sort> sorts;

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getbBankname() {
        return bBankname;
    }

    public void setbBankname(String bBankname) {
        this.bBankname = bBankname;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getDeptid() {
        return deptid;
    }

    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    public String getBstate() {
        return bstate;
    }

    public void setBstate(String bstate) {
        this.bstate = bstate;
    }

    public List<Sort> getSorts() {
        return sorts;
    }

    public void setSorts(List<Sort> sorts) {
        this.sorts = sorts;
    }
}