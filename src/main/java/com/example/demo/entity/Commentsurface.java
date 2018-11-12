package com.example.demo.entity;


public class Commentsurface {

  private long cmId;
  private long jlId;
  private String cmName;
  private String userId;
  private String jlTheme;
    private String jlContent;
     private Journalism journalism;

    public String getJlContent() {
        return jlContent;
    }

    public void setJlContent(String jlContent) {
        this.jlContent = jlContent;
    }

    public String getJlTheme() {
        return jlTheme;
    }

    public void setJlTheme(String jlTheme) {
        this.jlTheme = jlTheme;
    }



  public Journalism getJournalism() {
    return journalism;
  }

  public void setJournalism(Journalism journalism) {
    this.journalism = journalism;
  }

  public long getCmId() {
    return cmId;
  }

  public void setCmId(long cmId) {
    this.cmId = cmId;
  }


  public long getJlId() {
    return jlId;
  }

  public void setJlId(long jlId) {
    this.jlId = jlId;
  }


  public String getCmName() {
    return cmName;
  }

  public void setCmName(String cmName) {
    this.cmName = cmName;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

}
