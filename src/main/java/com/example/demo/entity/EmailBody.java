package com.example.demo.entity;


import java.sql.Timestamp;

public class EmailBody {

  private Integer bId;
  private Integer bPerson;
  private String bRecipients;
  private String bTheme;
  private String bContent;
  private String bUrl;
  private Timestamp bTime;
  private String bRank;
  private Integer bState;
  private Integer bState1;
  private Integer bStatus;


    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public Integer getbPerson() {
        return bPerson;
    }

    public void setbPerson(Integer bPerson) {
        this.bPerson = bPerson;
    }

    public String getbRecipients() {
        return bRecipients;
    }

    public void setbRecipients(String bRecipients) {
        this.bRecipients = bRecipients;
    }

    public String getbTheme() {
        return bTheme;
    }

    public void setbTheme(String bTheme) {
        this.bTheme = bTheme;
    }

    public String getbContent() {
        return bContent;
    }

    public void setbContent(String bContent) {
        this.bContent = bContent;
    }

    public String getbUrl() {
        return bUrl;
    }

    public void setbUrl(String bUrl) {
        this.bUrl = bUrl;
    }

    public Timestamp getbTime() {
        return bTime;
    }

    public void setbTime(Timestamp bTime) {
        this.bTime = bTime;
    }

    public String getbRank() {
        return bRank;
    }

    public void setbRank(String bRank) {
        this.bRank = bRank;
    }

    public Integer getbState() {
        return bState;
    }

    public void setbState(Integer bState) {
        this.bState = bState;
    }

    public Integer getbState1() {
        return bState1;
    }

    public void setbState1(Integer bState1) {
        this.bState1 = bState1;
    }

    public Integer getbStatus() {
        return bStatus;
    }

    public void setbStatus(Integer bStatus) {
        this.bStatus = bStatus;
    }
}
