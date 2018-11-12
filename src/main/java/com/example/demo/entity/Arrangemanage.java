package com.example.demo.entity;


import java.sql.Timestamp;

public class Arrangemanage {

  private long arrangeManagId;
  private String monday;
  private String tuesday;
  private String wednesday;
  private String thursday;
  private String friday;
  private String saturday;
  private String sunday;
  private String arrangeName;
  private java.sql.Timestamp dateStart;
  private java.sql.Timestamp dateEnd;
  private String userId;
  private String statusn;

    public long getArrangeManagId() {
        return arrangeManagId;
    }

    public void setArrangeManagId(long arrangeManagId) {
        this.arrangeManagId = arrangeManagId;
    }

    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }

    public String getSaturday() {
        return saturday;
    }

    public void setSaturday(String saturday) {
        this.saturday = saturday;
    }

    public String getSunday() {
        return sunday;
    }

    public void setSunday(String sunday) {
        this.sunday = sunday;
    }

    public String getArrangeName() {
        return arrangeName;
    }

    public void setArrangeName(String arrangeName) {
        this.arrangeName = arrangeName;
    }

    public Timestamp getDateStart() {
        return dateStart;
    }

    public void setDateStart(Timestamp dateStart) {
        this.dateStart = dateStart;
    }

    public Timestamp getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Timestamp dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStatusn() {
        return statusn;
    }

    public void setStatusn(String statusn) {
        this.statusn = statusn;
    }

    @Override
    public String toString() {
        return "Arrangemanage{" +
                "arrangeManagId=" + arrangeManagId +
                ", monday='" + monday + '\'' +
                ", tuesday='" + tuesday + '\'' +
                ", wednesday='" + wednesday + '\'' +
                ", thursday='" + thursday + '\'' +
                ", friday='" + friday + '\'' +
                ", saturday='" + saturday + '\'' +
                ", sunday='" + sunday + '\'' +
                ", arrangeName='" + arrangeName + '\'' +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                ", userId='" + userId + '\'' +
                ", statusn='" + statusn + '\'' +
                '}';
    }
}
