/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Payment {
    private int id;
    private int requestId;
    private int userId;
    private double amount;
    private String detail;
    private Date paymentDate;
    private String note;
    private String transactionType;
    private String bankCode;
    private String bankTranNo;
    private String cardType;
    private String transactionNo;
    private String transactionStatus;
    private String txnRef;
    private String secureHash;
    private int status;

    public Payment() {
    }

    public Payment(int id, int requestId, int userId, double amount, String detail, Date paymentDate, String note, String transactionType, String bankCode, String bankTranNo, String cardType, String transactionNo, String transactionStatus, String txnRef, String secureHash, int status) {
        this.id = id;
        this.requestId = requestId;
        this.userId = userId;
        this.amount = amount;
        this.detail = detail;
        this.paymentDate = paymentDate;
        this.note = note;
        this.transactionType = transactionType;
        this.bankCode = bankCode;
        this.bankTranNo = bankTranNo;
        this.cardType = cardType;
        this.transactionNo = transactionNo;
        this.transactionStatus = transactionStatus;
        this.txnRef = txnRef;
        this.secureHash = secureHash;
        this.status = status;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getBankCode() {
        return bankCode;
    }

    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }

    public String getBankTranNo() {
        return bankTranNo;
    }

    public void setBankTranNo(String bankTranNo) {
        this.bankTranNo = bankTranNo;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getTransactionNo() {
        return transactionNo;
    }

    public void setTransactionNo(String transactionNo) {
        this.transactionNo = transactionNo;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public String getTxnRef() {
        return txnRef;
    }

    public void setTxnRef(String txnRef) {
        this.txnRef = txnRef;
    }

    public String getSecureHash() {
        return secureHash;
    }

    public void setSecureHash(String secureHash) {
        this.secureHash = secureHash;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    

    
}
