package com.example.demo.entity;


public class Attendrule {

  private Integer attendRuleId;
  private Integer deptId;
  private String overtimeHour;
  private String overtimeDay;
  private String lateType;
  private String lateOnce;
  private String lateHour;
  private String oneLateHour;
  private String oneEarlyHour;


  public Integer getAttendRuleId() {
    return attendRuleId;
  }

  public void setAttendRuleId(Integer attendRuleId) {
    this.attendRuleId = attendRuleId;
  }


  public Integer getDeptId() {
    return deptId;
  }

  public void setDeptId(Integer deptId) {
    this.deptId = deptId;
  }


  public String getOvertimeHour() {
    return overtimeHour;
  }

  public void setOvertimeHour(String overtimeHour) {
    this.overtimeHour = overtimeHour;
  }


  public String getOvertimeDay() {
    return overtimeDay;
  }

  public void setOvertimeDay(String overtimeDay) {
    this.overtimeDay = overtimeDay;
  }


  public String getLateType() {
    return lateType;
  }

  public void setLateType(String lateType) {
    this.lateType = lateType;
  }


  public String getLateOnce() {
    return lateOnce;
  }

  public void setLateOnce(String lateOnce) {
    this.lateOnce = lateOnce;
  }


  public String getLateHour() {
    return lateHour;
  }

  public void setLateHour(String lateHour) {
    this.lateHour = lateHour;
  }


  public String getOneLateHour() {
    return oneLateHour;
  }

  public void setOneLateHour(String oneLateHour) {
    this.oneLateHour = oneLateHour;
  }


  public String getOneEarlyHour() {
    return oneEarlyHour;
  }

  public void setOneEarlyHour(String oneEarlyHour) {
    this.oneEarlyHour = oneEarlyHour;
  }

}
