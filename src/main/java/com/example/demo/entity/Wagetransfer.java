package com.example.demo.entity;


public class Wagetransfer {

  private Integer wageTransferId;
  private Integer userId;
  private double wageFront;
  private double wageBack;


  public Integer getWageTransferId() {
    return wageTransferId;
  }

  public void setWageTransferId(Integer wageTransferId) {
    this.wageTransferId = wageTransferId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public double getWageFront() {
    return wageFront;
  }

  public void setWageFront(double wageFront) {
    this.wageFront = wageFront;
  }


  public double getWageBack() {
    return wageBack;
  }

  public void setWageBack(double wageBack) {
    this.wageBack = wageBack;
  }

}
