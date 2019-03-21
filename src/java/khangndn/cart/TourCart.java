/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.cart;

import java.io.Serializable;
import java.util.HashMap;
import khangndn.dtos.BookingTourDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class TourCart implements Serializable{
     private HashMap<String,BookingTourDTO> cart;
     private String customerName;

    public TourCart( String customerName) {
        this.cart = new HashMap<>();
        this.customerName = customerName;
    }

    public TourCart() {
        this.cart = new HashMap<>();
        this.customerName="Guest";
    }

    public HashMap<String, BookingTourDTO> getCart() {
        return cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
     public void addToCart(BookingTourDTO dto) throws Exception
    {
        this.cart.put(dto.getCode(), dto);
    }
    public void removeCart(String id) throws Exception
    {
        if(this.cart.containsKey(id))
        {
            this.cart.remove(id);
        }
    }
  
    public float getTotal() throws Exception{
        float result =0;
        for (BookingTourDTO value : this.cart.values()) {
            result+=value.getAdultQuantity()*value.getAdultPrice()+value.getKidQuantity()*value.getKidPrice();
        }
        return result;
    }
    public  void updateCart(String id, int kidQuantity, int adultQuantity) throws Exception
    {
        if(this.cart.containsKey(id))
        {
            this.cart.get(id).setKidQuantity(kidQuantity);
            this.cart.get(id).setAdultQuantity(adultQuantity);
        }
    }
}
