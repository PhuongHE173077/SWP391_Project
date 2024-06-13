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
    private Request request_id;
    private double amount;
    private String date_payment;
    private String status;

    public Payment() {
    }

    public Payment(int id, Request request_id, double amount, String date_payment, String status) {
        this.id = id;
        this.request_id = request_id;
        this.amount = amount;
        this.date_payment = date_payment;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Request getRequest_id() {
        return request_id;
    }

    public void setRequest_id(Request request_id) {
        this.request_id = request_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDate_payment() {
        return date_payment;
    }

    public void setDate_payment(String date_payment) {
        this.date_payment = date_payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
