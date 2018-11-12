package com.example.demo.entity;

public class Facility {
    private Integer fId;

    private Meet meet;

    private String fNumber;

    private String fState;

    private String fName;

    private String fDescribe;

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

    public Meet getMeet() {
        return meet;
    }

    public void setMeet(Meet meet) {
        this.meet = meet;
    }

    public String getfNumber() {
        return fNumber;
    }

    public void setfNumber(String fNumber) {
        this.fNumber = fNumber;
    }

    public String getfState() {
        return fState;
    }

    public void setfState(String fState) {
        this.fState = fState;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getfDescribe() {
        return fDescribe;
    }

    public void setfDescribe(String fDescribe) {
        this.fDescribe = fDescribe;
    }

    public Facility(Integer fId, Meet meet, String fNumber, String fState, String fName, String fDescribe) {
        this.fId = fId;
        this.meet = meet;
        this.fNumber = fNumber;
        this.fState = fState;
        this.fName = fName;
        this.fDescribe = fDescribe;
    }

    public Facility() {
    }
}