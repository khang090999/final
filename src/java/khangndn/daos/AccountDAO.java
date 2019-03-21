/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import khangndn.db.MyConnection;
import khangndn.dtos.AccountDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class AccountDAO implements Serializable{
    Connection conn;
    PreparedStatement preStm;
    ResultSet rs;
    private void closeConnection() throws Exception
    {
        if(rs!= null) rs.close();
        if(preStm!=null) preStm.close();
        if(conn!=null) conn.close();
    }
    public String checkLogin(String username, String password) throws Exception
    {
        String role ="failed";
        try
        {
            String sql ="Select Role From Account where Username = ? and Password = ? and Status = ?";
            conn= MyConnection.getMyConnection();
            preStm= conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            preStm.setString(3, "true");
            rs= preStm.executeQuery();
            if(rs.next())
            {
                role = rs.getString("Role");
            }
        }
        finally
        {
            closeConnection();
        }
        return role;
    }
    public List<AccountDTO> findByLikeName(String search) throws  Exception
    {
        List<AccountDTO> result;
        String fullname= null;
        String username= null;
        String role = null;
        String phone = null;
        String email = null;
        AccountDTO dto = null;
        try
        {
             String sql="Select Username, Fullname, Role, Phone, Email from Account where Fullname Like ? and Status = ?";
            conn= MyConnection.getMyConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setNString(1, "%"+search+"%");
            preStm.setString(2, "true");
            rs=preStm.executeQuery();   
            result= new ArrayList<>();
             
            while(rs.next())
            {
                 username = rs.getString("Username");
                 fullname = rs.getString("Fullname");
                 role= rs.getString("Role");
                 phone=rs.getString("Phone");
                 email= rs.getString("Email");
                dto= new AccountDTO(username, role, fullname, phone, email);
                result.add(dto);
            }
        }
        finally
        {
            closeConnection();
        }
        return result;
    }
    public boolean insert(AccountDTO dto) throws Exception
    {
        boolean check = false;
        
        try
        {
            String sql="Insert into Account(Username, Password, Fullname, Phone, Email, Role,Status) values(?,?,?,?,?,?,?)";
            conn= MyConnection.getMyConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, dto.getUsername());
            preStm.setString(2, dto.getPassword());
            preStm.setNString(3, dto.getFullname());
            preStm.setString(4, dto.getPhone());
            preStm.setString(5, dto.getEmail());
            preStm.setString(6,"user");
            preStm.setString(7, dto.getStatus());
            check = preStm.executeUpdate()>0;
        }finally
        {
            closeConnection();
        }
        
        return check;
    }
     public boolean delete(String username) throws Exception
    {
        boolean check = false;
        
        try
        {
            String sql="UPDATE Account Set Status = 'false' Where Username = ?";
            conn= MyConnection.getMyConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, username);
            check = preStm.executeUpdate()>0;
        }finally
        {
            closeConnection();
        }
        
        return check;
    }
     public AccountDTO findByPrimaryKey(String key) throws Exception
     {
         AccountDTO dto= null;
         try
         {
             String sql= "Select Fullname, Email, Phone, Role from Account where Username = ?";
             conn=MyConnection.getMyConnection();
             preStm=conn.prepareStatement(sql);
             preStm.setString(1, key);
             rs= preStm.executeQuery();
             if(rs.next())
             {
                 String fullname= rs.getNString("Fullname");
                 String email= rs.getString("Email");
                 String phone= rs.getString("Phone");
                 String role = rs.getString("Role");
                 dto= new AccountDTO(key, role, fullname, phone, email);
             }
         }
         finally
         {
             closeConnection();
         }
         
         return dto;
     }
     public boolean update(AccountDTO dto) throws  Exception
     {
         boolean check= false;
         try
         {
             String sql="Update Account set Fullname = ?, Phone = ?, Email = ? where Username = ?";
             conn=MyConnection.getMyConnection();
             preStm=conn.prepareStatement(sql);
             preStm.setNString(1, dto.getFullname());
             preStm.setString(2, dto.getPhone());
             preStm.setString(3, dto.getEmail());           
             preStm.setString(4, dto.getUsername());
             check=preStm.executeUpdate()>0;
         }
         finally
         {
             closeConnection();
         }
         return  check;
     }
     public boolean changePassword(String username,String password, String newPass) throws  Exception
     {
         boolean check= false;
         try
         {
             String sql="Update Account set Password = ? where Username = ? and Password = ?";
             conn=MyConnection.getMyConnection();
             preStm=conn.prepareStatement(sql);
             preStm.setString(1, newPass);
             preStm.setString(2, username);
             preStm.setString(3, password);           
             check=preStm.executeUpdate()>0;
         }
         finally
         {
             closeConnection();
         }
         return  check;
     }
}
