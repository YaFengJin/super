package com.example.demo.entity;


public class Affair {

  private long aId;
  private String aContent;
  private java.sql.Date aStartDate;
  private java.sql.Date aEndDate;
  private java.sql.Date aRepeatDate;
  private String userid;


  public long getAId() {
    return aId;
  }

  public void setAId(long aId) {
    this.aId = aId;
  }


  public String getAContent() {
    return aContent;
  }

  public void setAContent(String aContent) {
    this.aContent = aContent;
  }


  public java.sql.Date getAStartDate() {
    return aStartDate;
  }

  public void setAStartDate(java.sql.Date aStartDate) {
    this.aStartDate = aStartDate;
  }


  public java.sql.Date getAEndDate() {
    return aEndDate;
  }

  public void setAEndDate(java.sql.Date aEndDate) {
    this.aEndDate = aEndDate;
  }


  public java.sql.Date getARepeatDate() {
    return aRepeatDate;
  }

  public void setARepeatDate(java.sql.Date aRepeatDate) {
    this.aRepeatDate = aRepeatDate;
  }


  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

}
