package com.example.demo.entity;


public class Appearmoney {

  private Integer appearMoneyId;
  private Integer wageProjectId;
  private double amout;
  private String userIds;


  public Integer getAppearMoneyId() {
    return appearMoneyId;
  }

  public void setAppearMoneyId(Integer appearMoneyId) {
    this.appearMoneyId = appearMoneyId;
  }


  public Integer getWageProjectId() {
    return wageProjectId;
  }

  public void setWageProjectId(Integer wageProjectId) {
    this.wageProjectId = wageProjectId;
  }


  public double getAmout() {
    return amout;
  }

  public void setAmout(double amout) {
    this.amout = amout;
  }


  public String getUserIds() {
    return userIds;
  }

  public void setUserIds(String userIds) {
    this.userIds = userIds;
  }

}
