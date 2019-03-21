/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.dtos;

import java.io.Serializable;

/**
 *
 * @author KHANG NGUYEN
 */
public class BookingTourDTO implements Serializable{
    private String code, status, username;
    private float kidPrice, adultPrice, price, totalPrice;
    private int kidQuantity, adultQuantity, quantity, id;

    public BookingTourDTO() {
    }

    public BookingTourDTO(String code, float kidPrice, float adultPrice, int quantity) {
        this.code = code;        
        this.kidPrice = kidPrice;
        this.adultPrice = adultPrice;
        this.quantity=quantity;
        this.kidQuantity = 0;
        this.adultQuantity = 1;
    }

    public BookingTourDTO(int id, String code, float price, int kidQuantity, int adultQuantity) {
        this.code = code;
        this.price = price;
        this.kidQuantity = kidQuantity;
        this.adultQuantity = adultQuantity;
        this.id=id;
    }

    public BookingTourDTO(String code, float totalPrice, int kidQuantity, int adultQuantity, int id) {
        this.code = code;
        this.totalPrice = totalPrice;
        this.kidQuantity = kidQuantity;
        this.adultQuantity = adultQuantity;
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

   

    public int getId() {
        return id;
    }

    
    public int getQuantity() {
        return quantity;
    }
    
    public String getCode() {
        return code;
    }

    public String getStatus() {
        return status;
    }

    public float getKidPrice() {
        return kidPrice;
    }

    public float getAdultPrice() {
        return adultPrice;
    }

    public int getKidQuantity() {
        return kidQuantity;
    }

    public int getAdultQuantity() {
        return adultQuantity;
    }

    public String getUsername() {
        return username;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setKidPrice(float kidPrice) {
        this.kidPrice = kidPrice;
    }

    public void setAdultPrice(float adultPrice) {
        this.adultPrice = adultPrice;
    }

    public void setKidQuantity(int kidQuantity) {
        this.kidQuantity = kidQuantity;
    }

    public void setAdultQuantity(int adultQuantity) {
        this.adultQuantity = adultQuantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotalPrice() {
        return kidPrice*kidQuantity+adultPrice*adultQuantity;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }
        
    
}
