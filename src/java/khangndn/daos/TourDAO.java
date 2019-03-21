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
import java.sql.Date;
import java.util.List;
import khangndn.db.MyConnection;
import khangndn.dtos.TourDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class TourDAO implements Serializable {

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

    public List<TourDTO> findTourInfo(String search) throws Exception {
        List<TourDTO> result;
        String code = null;
        int quantity;
        float adultPrice;
        float kidPrice;
        Date startDate;
        Date endDate;
        Date date = new Date(System.currentTimeMillis());
        TourDTO dto = null;
        try {
            String sql = "Select Code, AdultPrice, KidPrice, StartDate, EndDate, Quantity From Tour_Info"
                    + " Where TourID = ? And StartDate > ? And Status = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, search);
            preStm.setDate(2, date);
            preStm.setBoolean(3, true);
            rs = preStm.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                code = rs.getString("Code");
                quantity = rs.getInt("Quantity");
                adultPrice = rs.getFloat("AdultPrice");
                kidPrice = rs.getFloat("KidPrice");
                startDate = rs.getDate("StartDate");
                endDate = rs.getDate("EndDate");
                dto = new TourDTO(search, code, quantity, adultPrice, kidPrice, startDate, endDate);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> selectTopTour(int num, String type) throws Exception {
        List<TourDTO> result;

        String id = null;
        String des = null;
        String place = null;
        String transport = null;
        String imgPath = null;
        TourDTO dto = null;
        try {
            String sql = "Select Top " + num + " Tour_Category.TourID, Description, Place, Transport, Image From Tour_Category where Status = ? And Type = ?";

            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "true");
            preStm.setString(2, type);
            rs = preStm.executeQuery();
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getString("TourID");
                des = rs.getNString("Description");
                place = rs.getNString("Place");
                transport = rs.getNString("Transport");
                imgPath = rs.getString("Image");
                dto = new TourDTO(id, des, place, transport, type, imgPath);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<TourDTO> findByLikeName(String search, String type) throws Exception {
        List<TourDTO> result;

        String id = null;
        String des = null;
        String place = null;
        String transport = null;
        String imgPath = null;
        TourDTO dto = null;
        try {
            String sql = "Select Tour_Category.TourID, Description, Place, Transport, Image From Tour_Category"
                    + " Where Tour_Category.Place Like ? And Status = ? And Type = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setNString(1, "%" + search + "%");
            preStm.setBoolean(2, true);
            preStm.setNString(3, type);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                id = rs.getString("TourID");
                des = rs.getNString("Description");
                place = rs.getNString("Place");
                transport = rs.getNString("Transport");
                imgPath = rs.getString("Image");

                dto = new TourDTO(id, des, place, transport, type, imgPath);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteCategory(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE Tour_Category Set Status = 'false' Where TourID = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean insertCategory(TourDTO dto) throws Exception {
        boolean check = false;

        try {
            String sql = "Insert into Tour_Category(TourID, Description, Place, Transport, Type, Image, Status) values(?,?,?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getTourID());
            preStm.setNString(2,dto.getDescription());
            preStm.setNString(3, dto.getPlace());
            preStm.setNString(4, dto.getTransport());
            preStm.setString(5, dto.getType());
            preStm.setString(6, dto.getImgPath());
            preStm.setBoolean(7, true);
            System.out.println(dto.getDescription());
            check = preStm.executeUpdate() > 0;
            
        } finally {
            closeConnection();
        }

        return check;
    }

    public TourDTO findByPrimaryKey(String key) throws Exception {
        TourDTO dto = null;
        try {
            String sql = "Select Description, Place, Transport, Type, Image from Tour_Category where TourID = ? And Status = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, key);
            preStm.setBoolean(2, true);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String des = rs.getNString("Description");
                String place = rs.getNString("Place");
                String transport = rs.getNString("Transport");
                String type = rs.getString("Type");
                String imgPath = rs.getString("Image");
                dto = new TourDTO(key, des, place, transport, type, imgPath);
            }
        } finally {
            closeConnection();
        }

        return dto;
    }

    public boolean updateCategory(TourDTO dto) throws Exception {
        boolean check = false;
        try {
            if (dto.getImgPath() != null) {
                String sql = "Update Tour_Category set Description = ?, Place = ?, Transport = ?, Type = ?, Image = ? where TourID = ?";
                conn = MyConnection.getMyConnection();
                preStm = conn.prepareStatement(sql);
                preStm.setNString(1, dto.getDescription());
                preStm.setNString(2, dto.getPlace());
                preStm.setNString(3,dto.getTransport());
                preStm.setString(4, dto.getType());
                preStm.setString(5, dto.getImgPath());
                preStm.setString(6, dto.getTourID());
                check = preStm.executeUpdate() > 0;
            } else {
                String sql = "Update Tour_Category set Description = ?, Place = ?, Transport = ?, Type = ? where TourID = ?";
                conn = MyConnection.getMyConnection();
                preStm = conn.prepareStatement(sql);
                preStm.setNString(1, dto.getDescription());
                preStm.setNString(2, dto.getPlace());
                preStm.setNString(3, dto.getTransport());
                preStm.setString(4, dto.getType());
                preStm.setString(5, dto.getTourID());
                check = preStm.executeUpdate() > 0;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean deleteInfo(String code) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE Tour_Info Set Status = 'false' Where Code = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, code);
            check = preStm.executeUpdate() > 0;

        } finally {
            closeConnection();
        }

        return check;
    }

    public boolean insertInfo(TourDTO dto) throws Exception {
        boolean check = false;

        try {
            String sql = "Insert into Tour_Info(Code, TourID, AdultPrice, KidPrice, StartDate, EndDate, Quantity, Status) values(?,?,?,?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getCode());
            preStm.setString(2, dto.getTourID());
            preStm.setFloat(3, dto.getAdultPrice());
            preStm.setFloat(4, dto.getKidPrice());
            preStm.setDate(5, dto.getStartDate());
            preStm.setDate(6, dto.getEndDate());
            preStm.setInt(7, dto.getQuantity());
            preStm.setBoolean(8, true);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }

        return check;
    }

    public TourDTO findInfoByCode(String code) throws Exception {
        TourDTO dto = null;
        try {
            String sql = "Select TourID, AdultPrice, KidPrice, StartDate, EndDate, Quantity from Tour_Info where Code = ? And Status = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, code);
            preStm.setBoolean(2, true);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String id = rs.getString("TourID");
                float adultPrice = rs.getFloat("AdultPrice");
                float kidPrice = rs.getFloat("KidPrice");
                Date startDate = rs.getDate("StartDate");
                Date endDate = rs.getDate("EndDate");
                int quantity = rs.getInt("Quantity");
                dto = new TourDTO(id, code, quantity, adultPrice, kidPrice, startDate, endDate);
            }
        } finally {
            closeConnection();
        }

        return dto;
    }

    public boolean updateInfo(TourDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Tour_Info set AdultPrice = ?, KidPrice = ?, StartDate = ?, EndDate = ?, Quantity = ? where Code = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setFloat(1, dto.getAdultPrice());
            preStm.setFloat(2, dto.getKidPrice());
            preStm.setDate(3, dto.getStartDate());
            preStm.setDate(4, dto.getEndDate());
            preStm.setInt(5, dto.getQuantity());
            preStm.setString(6, dto.getCode());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
