/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.models;

import java.io.Serializable;
import java.util.List;
import khangndn.daos.AccountDAO;
import khangndn.dtos.AccountDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class KhangNDNBean implements Serializable{
    private String username, password,search, newPass;
    private AccountDTO dto;

    public KhangNDNBean() {
    }

    public AccountDTO getDto() {
        return dto;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getSearch() {
        return search;
    }

    public void setDto(AccountDTO dto) {
        this.dto = dto;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getNewPass() {
        return newPass;
    }

    public void setNewPass(String newPass) {
        this.newPass = newPass;
    }
    
    public String checkLogin() throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return dao.checkLogin(username, password);
    }
    public List<AccountDTO> findByLikeName()throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return dao.findByLikeName(search);
    }
    public  boolean insert()throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return  dao.insert(dto);
    } 
    public  boolean delete()throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return  dao.delete(username);
    }
    public  AccountDTO findByPrimaryKey() throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return dao.findByPrimaryKey(username);
    }
    public  boolean update() throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return dao.update(dto);
    }
    public boolean changePassword() throws Exception
    {
        AccountDAO dao = new AccountDAO();
        return dao.changePassword(username, password, newPass);
    }
}
