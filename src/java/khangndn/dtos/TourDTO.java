/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author KHANG NGUYEN
 */
public class TourDTO implements Serializable{
    private String tourID, description, place, transport, type, code, imgPath;
    private int quantity;
    private float adultPrice, kidPrice;
    private Date startDate, endDate;
    boolean status;
    public TourDTO() {
    }

    public TourDTO(String tourID, String description, String place, String transport, String type, String code, int quantity, float adultPrice, float kidPrice, Date startDate, Date endDate) {
        this.tourID = tourID;
        this.description = description;
        this.place = place;
        this.transport = transport;
        this.type = type;
        this.code = code;
        this.quantity = quantity;
        this.adultPrice = adultPrice;
        this.kidPrice = kidPrice;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public TourDTO(String tourID, String description, String place, String transport, String type, String imgPath) {
        this.tourID = tourID;
        this.description = description;
        this.place = place;
        this.transport = transport;
        this.type = type;
        this.imgPath = imgPath;
    }
    public TourDTO(String tourID, String description, String place, String transport, String type) {
        this.tourID = tourID;
        this.description = description;
        this.place = place;
        this.transport = transport;
        this.type = type;

    }


    public TourDTO(String tourID, String code, int quantity, float adultPrice, float kidPrice, Date startDate, Date endDate) {
        this.tourID = tourID;
        this.code = code;
        this.quantity = quantity;
        this.adultPrice = adultPrice;
        this.kidPrice = kidPrice;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    
    public boolean isStatus() {
        return status;
    }

    public String getTourID() {
        return tourID;
    }

    public String getDescription() {
        return description;
    }

    public String getPlace() {
        return place;
    }

    public String getTransport() {
        return transport;
    }

    public String getType() {
        return type;
    }

    public String getCode() {
        return code;
    }

    public int getQuantity() {
        return quantity;
    }

    public float getAdultPrice() {
        return adultPrice;
    }

    public float getKidPrice() {
        return kidPrice;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setTourID(String tourID) {
        this.tourID = tourID;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setAdultPrice(float adultPrice) {
        this.adultPrice = adultPrice;
    }

    public void setKidPrice(float kidPrice) {
        this.kidPrice = kidPrice;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    
}
