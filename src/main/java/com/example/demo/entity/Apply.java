package com.example.demo.entity;

public class Apply {
    private Integer applyId;

    private Bank bank;

    private Sort sort;

    private Usersurface userSurFace;

    private Worksurface workSurFace;

    private WorkJin workJin;

    private Double applyPrice;

    private Integer applyNumber;

    private String applyDate;

    private String applyComment;

    private Integer applyState;

    private String useid;

    private String spyj;

    public String getSpyj() {
        return spyj;
    }

    public void setSpyj(String spyj) {
        this.spyj = spyj;
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public Sort getSort() {
        return sort;
    }

    public void setSort(Sort sort) {
        this.sort = sort;
    }

    public Worksurface getWorkSurFace() {
        return workSurFace;
    }

    public void setWorkSurFace(Worksurface workSurFace) {
        this.workSurFace = workSurFace;
    }

    public WorkJin getWorkJin() {
        return workJin;
    }

    public void setWorkJin(WorkJin workJin) {
        this.workJin = workJin;
    }

    public Double getApplyPrice() {
        return applyPrice;
    }

    public void setApplyPrice(Double applyPrice) {
        this.applyPrice = applyPrice;
    }

    public Integer getApplyNumber() {
        return applyNumber;
    }

    public void setApplyNumber(Integer applyNumber) {
        this.applyNumber = applyNumber;
    }

    public String getApplyComment() {
        return applyComment;
    }

    public void setApplyComment(String applyComment) {
        this.applyComment = applyComment;
    }

    public Integer getApplyState() {
        return applyState;
    }

    public void setApplyState(Integer applyState) {
        this.applyState = applyState;
    }

    public String getUseid() {
        return useid;
    }

    public void setUseid(String useid) {
        this.useid = useid;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public Usersurface getUserSurFace() {
        return userSurFace;
    }

    public void setUserSurFace(Usersurface userSurFace) {
        this.userSurFace = userSurFace;
    }
}