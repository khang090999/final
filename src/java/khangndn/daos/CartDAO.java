/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import khangndn.cart.TourCart;
import khangndn.db.MyConnection;
import khangndn.dtos.BookingTourDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class CartDAO {

    Connection conn;
    PreparedStatement preStm;
    ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    private int insertBooking(TourCart cart) throws Exception {

        int id = 0;
        String sql = "Insert into Booking(Username, Date, Price) values(?,?,?) Select @@IDENTITY as BookingID";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preStm.setString(1, cart.getCustomerName());
            preStm.setDate(2, new Date(System.currentTimeMillis()));
            preStm.setFloat(3, cart.getTotal());
            preStm.executeUpdate();
            rs = preStm.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt("BookingID");

            }

        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean insertBookingDetail(TourCart cart) throws Exception {
       
        if (!updateQuantity(cart)) {
            return false;
        }
        
        int id = insertBooking(cart);
         
        boolean check = false;
        int num = cart.getCart().size();
        String value = "";
        for (int i = 0; i < num; i++) {
            if (i < num - 1) {
                value += "(?,?,?,?,?,?),";
            } else {
                value += "(?,?,?,?,?,?)";
            }
        }
        
        String sql = "Insert into Booking_Detail(BookingID, Code, AdultQuantity, KidQuantity, Price, Status) values" + value;
        try {
            if (id > 0) {
                conn = MyConnection.getMyConnection();
                
                preStm = conn.prepareStatement(sql);
                int count = 1;
                for (BookingTourDTO dto : cart.getCart().values()) {
                    
                    preStm.setInt(count++, id);
                    preStm.setString(count++, dto.getCode());
                    preStm.setInt(count++, dto.getAdultQuantity());
                    preStm.setInt(count++, dto.getKidQuantity());
                    preStm.setFloat(count++, dto.getAdultPrice() * dto.getAdultQuantity() + dto.getKidPrice() * dto.getKidQuantity());
                    preStm.setString(count++, "Canceled");
                    
                }
                check = preStm.executeUpdate() > 0;
            }
            
        } finally {
            closeConnection();
        }
        return check;
    }

    private boolean updateQuantity(TourCart cart) throws Exception {
        boolean check = false;
        String sql = "Update Tour_Info set Quantity= Quantity - ? where Code = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            for (BookingTourDTO dto : cart.getCart().values()) {
                preStm.setInt(1, dto.getKidQuantity() + dto.getAdultQuantity());
                preStm.setString(2, dto.getCode());
                check = preStm.executeUpdate() > 0;
                if (!check) {
                    return check;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<BookingTourDTO> findByUsername(String username) throws Exception {
        List<BookingTourDTO> result = null;
        BookingTourDTO dto = null;
        String sql = "Select  BookingID, Code, AdultQuantity, KidQuantity, Price from Booking_Detail "
                + "where Status = ? And BookingID In (Select BookingID from Booking where Username = ?)";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "Canceled");
            preStm.setString(2, username);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("BookingID");
                String code = rs.getString("Code");
                int adult = rs.getInt("AdultQuantity");
                int kid = rs.getInt("kidQuantity");
                float price = rs.getFloat("Price");
                dto = new BookingTourDTO(id, code, price, kid, adult);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public Date getCancelDate(String code) throws Exception {
        Date date = null;
        String sql = "Select StartDate from Tour_Info where Code = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, code);
            rs = preStm.executeQuery();
            if (rs.next()) {
                date = rs.getDate("StartDate");
            }
        } finally {
            closeConnection();
        }

        return date;
    }

    public boolean updateStatus(int id, String code, String status) throws Exception {
        boolean check = false;
        String sql = "Update Booking_Detail set Status = ?  where BookingID = ? and Code = ?";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            preStm.setInt(2, id);
            preStm.setString(3, code);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    public boolean updateQuantity(String code, int quantity) throws Exception
    {
        boolean check=false;
        String sql="Update Tour_Info set Quantity = Quantity + ? where Code = ?";
        try
        {
            conn= MyConnection.getMyConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setInt(1, quantity);
            preStm.setString(2, code);
            check = preStm.executeUpdate()>0;
        }
        finally
        {
            closeConnection();
        }
        return check;
    }
    public List<BookingTourDTO> findBookingCart(String username, String status) throws Exception {
        List<BookingTourDTO> result = null;
        BookingTourDTO dto = null;
        String sql = "Select Distinct Booking_Detail.BookingID, Code, AdultQuantity, KidQuantity, Booking_Detail.Price from Booking_Detail where Status = ? And Booking_Detail.BookingID In (Select BookingID from Booking where Username Like ?)";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            preStm.setString(2, "%"+username+"%");
            
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("BookingID");
                String code = rs.getString("Code");
                int adult = rs.getInt("AdultQuantity");
                int kid = rs.getInt("kidQuantity");
                float price = rs.getFloat("Price");
                dto = new BookingTourDTO(code, price, kid, adult, id);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
