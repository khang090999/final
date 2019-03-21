/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.validations;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import khangndn.db.MyConnection;

/**
 *
 * @author KHANG NGUYEN
 */
public class TourValidation implements Serializable{
     public static boolean checkText(String text) {
        return !text.matches("");
    }
     public static int checkTourID(String id) throws Exception {
        if (!id.matches("[\\w]+")) {
            return 0;
        } else {
            String sql = "Select Place from Tour_Category where TourID = ?";
            try (Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);) {
                preStm.setString(1, id);
                try (ResultSet rs = preStm.executeQuery()) {
                    if (rs.next()) {
                        return -1;
                    }
                }
            }
        }
        return 1;
    }
     public static int checkImg(String img)
     {

         if(img.trim().length()==0) return 0;
         String ext= img.substring(img.indexOf(".")+1);
         if (!(ext.equals("jpg") || ext.equals("bmp") || ext.equals("png"))) return -1;
         else return 1;
     }
     public static boolean checkTourInfo(String tour)throws Exception
     {
         boolean check=true;
          String sql = "Select Code from Tour_Info where TourID = ? And Status = ? And StartDate > ?";
            try (Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);) {
                preStm.setString(1, tour);
                preStm.setBoolean(2, true);
                preStm.setDate(3, new Date(System.currentTimeMillis()));
                try (ResultSet rs = preStm.executeQuery()) {
                    if (rs.next()) {
                        check = false;
                    }
                }
            }
            return check;
     }
      public static int checkCode(String code) throws Exception {
        if (!code.matches("[\\w]+")) {
            return 0;
        } else {
            String sql = "Select TourID from Tour_Info where Code = ?";
            try (Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);) {
                preStm.setString(1, code);
                try (ResultSet rs = preStm.executeQuery()) {
                    if (rs.next()) {
                        return -1;
                    }
                }
            }
        }
        return 1;
    }
      public static boolean checkPrice(String price) {
        if(price.matches("[0-9]+[.]{0,1}[0-9]{0,}"))
        {
            if(Float.parseFloat(price)>0) return true;
        }
        return false;
    }
      public static boolean checkQuantity(String quantity)
      {
          return quantity.matches("[0-9]+");
      }
      public static boolean checkDate(String date)
      {
          Date tmpDate= Date.valueOf(date);
          Date currentDate =  new Date(System.currentTimeMillis());
          return tmpDate.after(currentDate);
      }
      public static boolean checkEndDate(String startDate, String endDate)
      {
          Date tmpStartDate = Date.valueOf(startDate);
          Date tmpEndDate = Date.valueOf(endDate);
          return (tmpEndDate.after(tmpStartDate) || tmpEndDate.equals(tmpStartDate));
      }
}
