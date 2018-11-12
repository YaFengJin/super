package com.example.demo.entity;

public class Meet {
    private Integer mId;

    private Usersurface usersurface;

    private String mName;

    private String mDescription;

    private Integer mNumber;

    private String mTrueoffalse;

    private String mTime;

    private String mCondition;

    private String mAdress;

    private String mState;

    private String deptid;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Usersurface getUsersurface() {
        return usersurface;
    }

    public void setUsersurface(Usersurface usersurface) {
        this.usersurface = usersurface;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmDescription() {
        return mDescription;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }

    public Integer getmNumber() {
        return mNumber;
    }

    public void setmNumber(Integer mNumber) {
        this.mNumber = mNumber;
    }

    public String getmTrueoffalse() {
        return mTrueoffalse;
    }

    public void setmTrueoffalse(String mTrueoffalse) {
        this.mTrueoffalse = mTrueoffalse;
    }

    public String getmTime() {
        return mTime;
    }

    public void setmTime(String mTime) {
        this.mTime = mTime;
    }

    public String getmCondition() {
        return mCondition;
    }

    public void setmCondition(String mCondition) {
        this.mCondition = mCondition;
    }

    public String getmAdress() {
        return mAdress;
    }

    public void setmAdress(String mAdress) {
        this.mAdress = mAdress;
    }

    public String getmState() {
        return mState;
    }

    public void setmState(String mState) {
        this.mState = mState;
    }

    public String getDeptid() {
        return deptid;
    }

    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    public Meet(Integer mId, Usersurface usersurface, String mName, String mDescription, Integer mNumber, String mTrueoffalse, String mTime, String mCondition, String mAdress, String mState, String deptid) {
        this.mId = mId;
        this.usersurface = usersurface;
        this.mName = mName;
        this.mDescription = mDescription;
        this.mNumber = mNumber;
        this.mTrueoffalse = mTrueoffalse;
        this.mTime = mTime;
        this.mCondition = mCondition;
        this.mAdress = mAdress;
        this.mState = mState;
        this.deptid = deptid;
    }

    public Meet() {
    }
}