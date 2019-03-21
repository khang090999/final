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
public class AccountDTO implements Serializable{
    private String username, password, role, fullname, phone, email,status;

    public AccountDTO() {
    }

    public AccountDTO(String username, String role, String fullname, String phone, String email) {
        this.username = username;
        this.role = role;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
    }

    public AccountDTO(String username, String fullname, String phone, String email) {
        this.username = username;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
    }
    
    public String getStatus() {
        return status;
    }
    
    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

   
    
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getFullname() {
        return fullname;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
