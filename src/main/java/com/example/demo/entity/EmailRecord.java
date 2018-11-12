package com.example.demo.entity;


public class EmailRecord {

  private Integer rId;
  private Integer bId;//邮件编号
  private Integer userId;//用户编号

  public Integer getrId() {
    return rId;
  }

  public void setrId(Integer rId) {
    this.rId = rId;
  }

  public Integer getbId() {
    return bId;
  }

  public void setbId(Integer bId) {
    this.bId = bId;
  }

  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }
}
