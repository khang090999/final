/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.models;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import khangndn.cart.TourCart;
import khangndn.daos.CartDAO;
import khangndn.dtos.BookingTourDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class CartBean implements Serializable{
    private TourCart cart;
    private String username, code, status;
    private int id, quantity;

    public String getStatus() {
        return status;
    }

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public CartBean() {
    }

    public TourCart getCart() {
        return cart;
    }

    public void setCart(TourCart cart) {
        this.cart = cart;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    
    public boolean insertBookingDetail() throws Exception
    {
        CartDAO dao = new CartDAO();
        return dao.insertBookingDetail(cart);
    }
    public List<BookingTourDTO> findByUsername() throws Exception
    {
        CartDAO dao = new CartDAO();
        return dao.findByUsername(username);
    }
    public Date getCancelDate() throws Exception
    {
        CartDAO dao = new CartDAO();
        return dao.getCancelDate(code);
    }
    public boolean updateStatus() throws Exception 
    {
         CartDAO dao = new CartDAO();
        return dao.updateStatus(id,code,status);
    }
     public boolean updateQuantity() throws Exception
    {
    CartDAO dao = new CartDAO();
        return dao.updateQuantity(code,quantity);
    }
     public List<BookingTourDTO> findBookingCart() throws Exception 
     {
         CartDAO dao = new CartDAO();
        return dao.findBookingCart(username, status);
     }
}
