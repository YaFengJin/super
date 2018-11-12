package com.example.demo.entity;


public class Journalism {

  private long jlId;
  private long jtId;
  private long rtId;
  private String jlTheme;
  private String jlContent;
  private java.sql.Date jlDatetime;
  private java.sql.Date jlTov;
  private String jlState;
  private String jlAccessory;
  private String jlCon;
  private String deptId;
  private String person;

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    private Journalismtype journalismtype;
  private Reprtitiontype reprtitiontype;
  public Reprtitiontype getReprtitiontype() {
    return reprtitiontype;
  }

  public void setReprtitiontype(Reprtitiontype reprtitiontype) {
    this.reprtitiontype = reprtitiontype;
  }


  public Journalismtype getJournalismtype() {
    return journalismtype;
  }

  public void setJournalismtype(Journalismtype journalismtype) {
    this.journalismtype = journalismtype;
  }



  public long getJlId() {
    return jlId;
  }

  public void setJlId(long jlId) {
    this.jlId = jlId;
  }


  public long getJtId() {
    return jtId;
  }

  public void setJtId(long jtId) {
    this.jtId = jtId;
  }


  public long getRtId() {
    return rtId;
  }

  public void setRtId(long rtId) {
    this.rtId = rtId;
  }


  public String getJlTheme() {
    return jlTheme;
  }

  public void setJlTheme(String jlTheme) {
    this.jlTheme = jlTheme;
  }


  public String getJlContent() {
    return jlContent;
  }

  public void setJlContent(String jlContent) {
    this.jlContent = jlContent;
  }


  public java.sql.Date getJlDatetime() {
    return jlDatetime;
  }

  public void setJlDatetime(java.sql.Date jlDatetime) {
    this.jlDatetime = jlDatetime;
  }


  public java.sql.Date getJlTov() {
    return jlTov;
  }

  public void setJlTov(java.sql.Date jlTov) {
    this.jlTov = jlTov;
  }


  public String getJlState() {
    return jlState;
  }

  public void setJlState(String jlState) {
    this.jlState = jlState;
  }


  public String getJlAccessory() {
    return jlAccessory;
  }

  public void setJlAccessory(String jlAccessory) {
    this.jlAccessory = jlAccessory;
  }


  public String getJlCon() {
    return jlCon;
  }

  public void setJlCon(String jlCon) {
    this.jlCon = jlCon;
  }


  public String getDeptId() {
    return deptId;
  }

  public void setDeptId(String deptId) {
    this.deptId = deptId;
  }

}
