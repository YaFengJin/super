package com.example.demo.entity;

public class Sort {
    private Integer sortId;

    private Bank bank;

    private String sortNumber;

    private String sortStyle;

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public String getSortNumber() {
        return sortNumber;
    }

    public void setSortNumber(String sortNumber) {
        this.sortNumber = sortNumber;
    }

    public String getSortStyle() {
        return sortStyle;
    }

    public void setSortStyle(String sortStyle) {
        this.sortStyle = sortStyle;
    }
}