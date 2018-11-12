package com.example.demo.entity;


import java.sql.Date;

public class Announcement {

  private long amId;
  private Announcementtype announcementtype;
  private String amTheme;
  private String amContent;
  private Date amDatetime;
  private Date amTovs;
  private String amState;
  private Date amTove;
  private String amAccessory;
  private String deptId;
  private String amPerson;


  public long getAmId() {
    return amId;
  }
  public void setAmId(long amId) {
    this.amId = amId;
  }
  public Announcementtype getAnnouncementtype() {
    return announcementtype;
  }
  public void setAnnouncementtype(Announcementtype announcementtype) {
    this.announcementtype = announcementtype;
  }
  public String getAmTheme() {
    return amTheme;
  }
  public void setAmTheme(String amTheme) {
    this.amTheme = amTheme;
  }
  public String getAmContent() {
    return amContent;
  }
  public void setAmContent(String amContent) {
    this.amContent = amContent;
  }
  public Date getAmDatetime() {
    return amDatetime;
  }
  public void setAmDatetime(Date amDatetime) {
    this.amDatetime = amDatetime;
  }
  public Date getAmTovs() {
    return amTovs;
  }
  public void setAmTovs(Date amTovs) {
    this.amTovs = amTovs;
  }
  public String getAmState() {
    return amState;
  }
  public void setAmState(String amState) {
    this.amState = amState;
  }
  public Date getAmTove() {
    return amTove;
  }
  public void setAmTove(Date amTove) {
    this.amTove = amTove;
  }
  public String getAmAccessory() {
    return amAccessory;
  }
  public void setAmAccessory(String amAccessory) {
    this.amAccessory = amAccessory;
  }
  public String getDeptId() {
    return deptId;
  }
  public void setDeptId(String deptId) {
    this.deptId = deptId;
  }
  public String getAmPerson() {
    return amPerson;
  }
  public void setAmPerson(String amPerson) {
    this.amPerson = amPerson;
  }


  public Announcement() {
    super();
  }

  public Announcement(long amId, Announcementtype announcementtype, String amTheme, String amContent,
                      Date amDatetime, Date amTovs, String amState, Date amTove, String amAccessory,
                      String deptId, String amPerson) {
    this.amId = amId;
    this.announcementtype = announcementtype;
    this.amTheme = amTheme;
    this.amContent = amContent;
    this.amDatetime = amDatetime;
    this.amTovs = amTovs;
    this.amState = amState;
    this.amTove = amTove;
    this.amAccessory = amAccessory;
    this.deptId = deptId;
    this.amPerson = amPerson;
  }

  @Override
  public String toString() {
    return "Announcement{" +
            "amId=" + amId +
            ", announcementtype=" + announcementtype +
            ", amTheme='" + amTheme + '\'' +
            ", amContent='" + amContent + '\'' +
            ", amDatetime=" + amDatetime +
            ", amTovs=" + amTovs +
            ", amState='" + amState + '\'' +
            ", amTove=" + amTove +
            ", amAccessory='" + amAccessory + '\'' +
            ", deptId='" + deptId + '\'' +
            ", amPerson='" + amPerson + '\'' +
            '}';
  }
}
