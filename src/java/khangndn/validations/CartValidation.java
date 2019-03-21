/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.validations;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import khangndn.db.MyConnection;

/**
 *
 * @author KHANG NGUYEN
 */
public class CartValidation implements Serializable{
    public static boolean checkQuantity(int quantity, String code) throws Exception
    {
        boolean check = false;
        String sql="Select Quantity From Tour_Info Where Code = ?";
        try(Connection conn = MyConnection.getMyConnection();
                PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setString(1, code);
            try(ResultSet rs = ps.executeQuery())
            {
                if(rs.next())
                {
                    int quant= rs.getInt("Quantity");
                    check=quant>=quantity;
                }
            }
        }
        return check;
    }
     public static boolean checkStatus(int id, String code) throws Exception
    {
        boolean check = false;
        String sql="Select Status From Booking_Detail Where Code = ? and BookingID = ?";
        try(Connection conn = MyConnection.getMyConnection();
                PreparedStatement ps = conn.prepareStatement(sql))
        {
            ps.setString(1, code);
            ps.setInt(2, id);
            try(ResultSet rs = ps.executeQuery())
            {
                if(rs.next())
                {
                    String status= rs.getString("Status");
                    check=status.equals("Canceled");
                }
            }
        }
        return check;
    }
}
