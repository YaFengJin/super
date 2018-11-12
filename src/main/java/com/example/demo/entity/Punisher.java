package com.example.demo.entity;


public class Punisher {

  private Integer punisherId;
  private Integer userId;
  private double punishGold;
  private java.sql.Timestamp punishTime;
  private String punisherRemark;


  public Integer getPunisherId() {
    return punisherId;
  }

  public void setPunisherId(Integer punisherId) {
    this.punisherId = punisherId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public double getPunishGold() {
    return punishGold;
  }

  public void setPunishGold(double punishGold) {
    this.punishGold = punishGold;
  }


  public java.sql.Timestamp getPunishTime() {
    return punishTime;
  }

  public void setPunishTime(java.sql.Timestamp punishTime) {
    this.punishTime = punishTime;
  }


  public String getPunisherRemark() {
    return punisherRemark;
  }

  public void setPunisherRemark(String punisherRemark) {
    this.punisherRemark = punisherRemark;
  }

}
