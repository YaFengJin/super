package com.example.demo.entity;


public class Checksurface {

  private long checkId;
  private Integer userId;
  private String checkName;
  private java.sql.Date checkTime;
  private String checkRemark;
  private String checkNumber;
  private java.sql.Time goTimeOne;
  private java.sql.Time downTimeOne;
  private java.sql.Time goTimeTwo;
  private java.sql.Time downTimeTwo;
  private String goTimeOneText;
  private String downTimeOneText;
  private String goTimeTwoText;
  private String downTimeTwoText;


  @Override
  public String toString() {
    return "Checksurface{" +
            "checkId=" + checkId +
            ", userId=" + userId +
            ", checkName='" + checkName + '\'' +
            ", checkTime=" + checkTime +
            ", checkRemark='" + checkRemark + '\'' +
            ", checkNumber='" + checkNumber + '\'' +
            ", goTimeOne=" + goTimeOne +
            ", downTimeOne=" + downTimeOne +
            ", goTimeTwo=" + goTimeTwo +
            ", downTimeTwo=" + downTimeTwo +
            ", goTimeOneText='" + goTimeOneText + '\'' +
            ", downTimeOneText='" + downTimeOneText + '\'' +
            ", goTimeTwoText='" + goTimeTwoText + '\'' +
            ", downTimeTwoText='" + downTimeTwoText + '\'' +
            '}';
  }

  public long getCheckId() {
    return checkId;
  }

  public void setCheckId(long checkId) {
    this.checkId = checkId;
  }


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCheckName() {
    return checkName;
  }

  public void setCheckName(String checkName) {
    this.checkName = checkName;
  }


  public java.sql.Date getCheckTime() {
    return checkTime;
  }

  public void setCheckTime(java.sql.Date checkTime) {
    this.checkTime = checkTime;
  }


  public String getCheckRemark() {
    return checkRemark;
  }

  public void setCheckRemark(String checkRemark) {
    this.checkRemark = checkRemark;
  }


  public String getCheckNumber() {
    return checkNumber;
  }

  public void setCheckNumber(String checkNumber) {
    this.checkNumber = checkNumber;
  }


  public java.sql.Time getGoTimeOne() {
    return goTimeOne;
  }

  public void setGoTimeOne(java.sql.Time goTimeOne) {
    this.goTimeOne = goTimeOne;
  }


  public java.sql.Time getDownTimeOne() {
    return downTimeOne;
  }

  public void setDownTimeOne(java.sql.Time downTimeOne) {
    this.downTimeOne = downTimeOne;
  }


  public java.sql.Time getGoTimeTwo() {
    return goTimeTwo;
  }

  public void setGoTimeTwo(java.sql.Time goTimeTwo) {
    this.goTimeTwo = goTimeTwo;
  }


  public java.sql.Time getDownTimeTwo() {
    return downTimeTwo;
  }

  public void setDownTimeTwo(java.sql.Time downTimeTwo) {
    this.downTimeTwo = downTimeTwo;
  }


  public String getGoTimeOneText() {
    return goTimeOneText;
  }

  public void setGoTimeOneText(String goTimeOneText) {
    this.goTimeOneText = goTimeOneText;
  }


  public String getDownTimeOneText() {
    return downTimeOneText;
  }

  public void setDownTimeOneText(String downTimeOneText) {
    this.downTimeOneText = downTimeOneText;
  }


  public String getGoTimeTwoText() {
    return goTimeTwoText;
  }

  public void setGoTimeTwoText(String goTimeTwoText) {
    this.goTimeTwoText = goTimeTwoText;
  }


  public String getDownTimeTwoText() {
    return downTimeTwoText;
  }

  public void setDownTimeTwoText(String downTimeTwoText) {
    this.downTimeTwoText = downTimeTwoText;
  }

}
