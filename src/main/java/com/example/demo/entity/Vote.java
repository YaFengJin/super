package com.example.demo.entity;


public class Vote {

  private Integer vId;
  private Integer vtId;
  private String vTheme;
  private String vDescribe;
  private String vAnonymous;
  private java.sql.Date vStartDate;
  private java.sql.Date vEndDate;
  private String vState;
  private String vAccessory;
  private String deptid;


  public Integer getVId() {
    return vId;
  }

  public void setVId(Integer vId) {
    this.vId = vId;
  }


  public Integer getVtId() {
    return vtId;
  }

  public void setVtId(Integer vtId) {
    this.vtId = vtId;
  }


  public String getVTheme() {
    return vTheme;
  }

  public void setVTheme(String vTheme) {
    this.vTheme = vTheme;
  }


  public String getVDescribe() {
    return vDescribe;
  }

  public void setVDescribe(String vDescribe) {
    this.vDescribe = vDescribe;
  }


  public String getVAnonymous() {
    return vAnonymous;
  }

  public void setVAnonymous(String vAnonymous) {
    this.vAnonymous = vAnonymous;
  }


  public java.sql.Date getVStartDate() {
    return vStartDate;
  }

  public void setVStartDate(java.sql.Date vStartDate) {
    this.vStartDate = vStartDate;
  }


  public java.sql.Date getVEndDate() {
    return vEndDate;
  }

  public void setVEndDate(java.sql.Date vEndDate) {
    this.vEndDate = vEndDate;
  }


  public String getVState() {
    return vState;
  }

  public void setVState(String vState) {
    this.vState = vState;
  }


  public String getVAccessory() {
    return vAccessory;
  }

  public void setVAccessory(String vAccessory) {
    this.vAccessory = vAccessory;
  }


  public String getDeptid() {
    return deptid;
  }

  public void setDeptid(String deptid) {
    this.deptid = deptid;
  }

}
