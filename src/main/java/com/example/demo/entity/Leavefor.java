package com.example.demo.entity;


public class Leavefor {

  private long leaveForId;
  private long userId;
  private long ratyfyUser;
  private String empInfoName;
  private String gender;
  private String leaveForDept;
  private String leaveNumber;
  private String leaveForPost;
  private java.sql.Timestamp beginTime;
  private java.sql.Timestamp overTime;
  private java.sql.Timestamp leaveTime;
  private String forCause;
  private String leaveState;
  private String leaveType;


  public long getLeaveForId() {
    return leaveForId;
  }

  public void setLeaveForId(long leaveForId) {
    this.leaveForId = leaveForId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getRatyfyUser() {
    return ratyfyUser;
  }

  public void setRatyfyUser(long ratyfyUser) {
    this.ratyfyUser = ratyfyUser;
  }


  public String getEmpInfoName() {
    return empInfoName;
  }

  public void setEmpInfoName(String empInfoName) {
    this.empInfoName = empInfoName;
  }


  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }


  public String getLeaveForDept() {
    return leaveForDept;
  }

  public void setLeaveForDept(String leaveForDept) {
    this.leaveForDept = leaveForDept;
  }


  public String getLeaveNumber() {
    return leaveNumber;
  }

  public void setLeaveNumber(String leaveNumber) {
    this.leaveNumber = leaveNumber;
  }


  public String getLeaveForPost() {
    return leaveForPost;
  }

  public void setLeaveForPost(String leaveForPost) {
    this.leaveForPost = leaveForPost;
  }


  public java.sql.Timestamp getBeginTime() {
    return beginTime;
  }

  public void setBeginTime(java.sql.Timestamp beginTime) {
    this.beginTime = beginTime;
  }


  public java.sql.Timestamp getOverTime() {
    return overTime;
  }

  public void setOverTime(java.sql.Timestamp overTime) {
    this.overTime = overTime;
  }


  public java.sql.Timestamp getLeaveTime() {
    return leaveTime;
  }

  public void setLeaveTime(java.sql.Timestamp leaveTime) {
    this.leaveTime = leaveTime;
  }


  public String getForCause() {
    return forCause;
  }

  public void setForCause(String forCause) {
    this.forCause = forCause;
  }


  public String getLeaveState() {
    return leaveState;
  }

  public void setLeaveState(String leaveState) {
    this.leaveState = leaveState;
  }


  public String getLeaveType() {
    return leaveType;
  }

  public void setLeaveType(String leaveType) {
    this.leaveType = leaveType;
  }

  @Override
  public String toString() {
    return "Leavefor{" +
            "leaveForId=" + leaveForId +
            ", userId=" + userId +
            ", ratyfyUser=" + ratyfyUser +
            ", empInfoName='" + empInfoName + '\'' +
            ", gender='" + gender + '\'' +
            ", leaveForDept='" + leaveForDept + '\'' +
            ", leaveNumber='" + leaveNumber + '\'' +
            ", leaveForPost='" + leaveForPost + '\'' +
            ", beginTime=" + beginTime +
            ", overTime=" + overTime +
            ", leaveTime=" + leaveTime +
            ", forCause='" + forCause + '\'' +
            ", leaveState='" + leaveState + '\'' +
            ", leaveType='" + leaveType + '\'' +
            '}';
  }
}
