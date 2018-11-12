package com.example.demo.entity;


public class RecruitScreen {

  private Integer recruitScreenId;
  private Integer talentsId;
  private Integer recruitPlanId;
  private Integer userId;
  private String recruitScreeName;
  private String screenTime;
  private String screenState;


  public Integer getRecruitScreenId() {
    return recruitScreenId;
  }

  public void setRecruitScreenId(Integer recruitScreenId) {
    this.recruitScreenId = recruitScreenId;
  }


  public Integer getTalentsId() {
    return talentsId;
  }

  public void setTalentsId(Integer talentsId) {
    this.talentsId = talentsId;
  }


  public Integer getRecruitPlanId() {
    return recruitPlanId;
  }

  public void setRecruitPlanId(Integer recruitPlanId) {
    this.recruitPlanId = recruitPlanId;
  }


  public Integer getUserId() {
    return userId;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }


  public String getRecruitScreeName() {
    return recruitScreeName;
  }

  public void setRecruitScreeName(String recruitScreeName) {
    this.recruitScreeName = recruitScreeName;
  }


  public String getScreenTime() {
    return screenTime;
  }

  public void setScreenTime(String screenTime) {
    this.screenTime = screenTime;
  }

}
