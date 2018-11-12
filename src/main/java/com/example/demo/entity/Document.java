package com.example.demo.entity;


import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.sql.Timestamp;

public class Document {

  private long documentId;
  private long filingCabinetId;
  private String documentName;
  private String documentCon;
  private String documentAccess;
  private String filingCabinetName;

  public String getFilingCabinetName() {
    return filingCabinetName;
  }

  public void setFilingCabinetName(String filingCabinetName) {
    this.filingCabinetName = filingCabinetName;
  }

  private Timestamp dTime;

  public Timestamp getdTime() {
    return dTime;
  }

  public void setdTime(Timestamp dTime) {
    this.dTime = dTime;
  }

  public long getDocumentId() {
    return documentId;
  }

  public void setDocumentId(long documentId) {
    this.documentId = documentId;
  }


  public long getFilingCabinetId() {
    return filingCabinetId;
  }

  public void setFilingCabinetId(long filingCabinetId) {
    this.filingCabinetId = filingCabinetId;
  }


  public String getDocumentName() {
    return documentName;
  }

  public void setDocumentName(String documentName) {
    this.documentName = documentName;
  }


  public String getDocumentCon() {
    return documentCon;
  }

  public void setDocumentCon(String documentCon) {
    this.documentCon = documentCon;
  }


  public String getDocumentAccess() {
    return documentAccess;
  }

  public void setDocumentAccess(String documentAccess) {
    this.documentAccess = documentAccess;
  }

}
