package com.example.demo.entity;


import java.sql.Timestamp;

public class Ordermeeting {

  private long orderId;
  private Meet meet;
  private Timestamp orderStartdate;
  private Timestamp orderEnddate;
  private String orderCurdate;
  private Integer orderHours;
  private String orderMintes;
  private String orderTime;
  private String orderTheme;
  private Integer orderState;
  private String userid;
  private String orderName;
  private String orderUserid;
  private Integer orderUser;
  private String orderReason;

  public long getOrderId() {
    return orderId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }

  public Meet getMeet() {
    return meet;
  }

  public void setMeet(Meet meet) {
    this.meet = meet;
  }

  public Timestamp getOrderStartdate() {
    return orderStartdate;
  }

  public void setOrderStartdate(Timestamp orderStartdate) {
    this.orderStartdate = orderStartdate;
  }

  public Timestamp getOrderEnddate() {
    return orderEnddate;
  }

  public void setOrderEnddate(Timestamp orderEnddate) {
    this.orderEnddate = orderEnddate;
  }

  public String getOrderCurdate() {
    return orderCurdate;
  }

  public void setOrderCurdate(String orderCurdate) {
    this.orderCurdate = orderCurdate;
  }

  public Integer getOrderHours() {
    return orderHours;
  }

  public void setOrderHours(Integer orderHours) {
    this.orderHours = orderHours;
  }

  public String getOrderMintes() {
    return orderMintes;
  }

  public void setOrderMintes(String orderMintes) {
    this.orderMintes = orderMintes;
  }

  public String getOrderTime() {
    return orderTime;
  }

  public void setOrderTime(String orderTime) {
    this.orderTime = orderTime;
  }

  public String getOrderTheme() {
    return orderTheme;
  }

  public void setOrderTheme(String orderTheme) {
    this.orderTheme = orderTheme;
  }

  public Integer getOrderState() {
    return orderState;
  }

  public void setOrderState(Integer orderState) {
    this.orderState = orderState;
  }

  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

  public String getOrderName() {
    return orderName;
  }

  public void setOrderName(String orderName) {
    this.orderName = orderName;
  }

  public String getOrderUserid() {
    return orderUserid;
  }

  public void setOrderUserid(String orderUserid) {
    this.orderUserid = orderUserid;
  }

  public Integer getOrderUser() {
    return orderUser;
  }

  public void setOrderUser(Integer orderUser) {
    this.orderUser = orderUser;
  }

  public String getOrderReason() {
    return orderReason;
  }

  public void setOrderReason(String orderReason) {
    this.orderReason = orderReason;
  }
}
