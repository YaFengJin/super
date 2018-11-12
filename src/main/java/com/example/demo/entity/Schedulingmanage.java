package com.example.demo.entity;


import java.sql.Time;

public class Schedulingmanage {

  private long schedulingManagId;
  private String schedulingName;
  private java.sql.Time dutyTime1;
  private java.sql.Time dutyTime2;
  private java.sql.Time timeLate1;
  private java.sql.Time timeLate2;
  private java.sql.Time dutyTime3;
  private java.sql.Time dutyTime4;
  private java.sql.Time timeLate3;
  private java.sql.Time timeLate4;


  public Schedulingmanage() {
  }

  public Schedulingmanage(long schedulingManagId, String schedulingName, Time dutyTime1, Time dutyTime2, Time timeLate1, Time timeLate2, Time dutyTime3, Time dutyTime4, Time timeLate3, Time timeLate4) {
    this.schedulingManagId = schedulingManagId;
    this.schedulingName = schedulingName;
    this.dutyTime1 = dutyTime1;
    this.dutyTime2 = dutyTime2;
    this.timeLate1 = timeLate1;
    this.timeLate2 = timeLate2;
    this.dutyTime3 = dutyTime3;
    this.dutyTime4 = dutyTime4;
    this.timeLate3 = timeLate3;
    this.timeLate4 = timeLate4;
  }

  @Override
  public String toString() {
    return "Schedulingmanage{" +
            "schedulingManagId=" + schedulingManagId +
            ", schedulingName='" + schedulingName + '\'' +
            ", dutyTime1=" + dutyTime1 +
            ", dutyTime2=" + dutyTime2 +
            ", timeLate1=" + timeLate1 +
            ", timeLate2=" + timeLate2 +
            ", dutyTime3=" + dutyTime3 +
            ", dutyTime4=" + dutyTime4 +
            ", timeLate3=" + timeLate3 +
            ", timeLate4=" + timeLate4 +
            '}';
  }

  public long getSchedulingManagId() {
    return schedulingManagId;
  }

  public void setSchedulingManagId(long schedulingManagId) {
    this.schedulingManagId = schedulingManagId;
  }

  public String getSchedulingName() {
    return schedulingName;
  }

  public void setSchedulingName(String schedulingName) {
    this.schedulingName = schedulingName;
  }

  public Time getDutyTime1() {
    return dutyTime1;
  }

  public void setDutyTime1(Time dutyTime1) {
    this.dutyTime1 = dutyTime1;
  }

  public Time getDutyTime2() {
    return dutyTime2;
  }

  public void setDutyTime2(Time dutyTime2) {
    this.dutyTime2 = dutyTime2;
  }

  public Time getTimeLate1() {
    return timeLate1;
  }

  public void setTimeLate1(Time timeLate1) {
    this.timeLate1 = timeLate1;
  }

  public Time getTimeLate2() {
    return timeLate2;
  }

  public void setTimeLate2(Time timeLate2) {
    this.timeLate2 = timeLate2;
  }

  public Time getDutyTime3() {
    return dutyTime3;
  }

  public void setDutyTime3(Time dutyTime3) {
    this.dutyTime3 = dutyTime3;
  }

  public Time getDutyTime4() {
    return dutyTime4;
  }

  public void setDutyTime4(Time dutyTime4) {
    this.dutyTime4 = dutyTime4;
  }

  public Time getTimeLate3() {
    return timeLate3;
  }

  public void setTimeLate3(Time timeLate3) {
    this.timeLate3 = timeLate3;
  }

  public Time getTimeLate4() {
    return timeLate4;
  }

  public void setTimeLate4(Time timeLate4) {
    this.timeLate4 = timeLate4;
  }
}
