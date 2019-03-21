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
public class AccountValidation implements Serializable{
      public static boolean checkText(String text) {
        boolean check = !text.matches("");
        return check;
    }
      public static boolean checkPassword(String password)
      {
          boolean check= (password.length()>=6 && password.length()<=30) ;
          return check;
      }
       public static int checkUsername(String username) throws Exception {
        if (!username.matches("[\\w]+")) {
            return 0;
        } else {
            String sql = "Select Fullname from Account where Username = ?";
            try (Connection conn = MyConnection.getMyConnection();
                    PreparedStatement preStm = conn.prepareStatement(sql);) {
                preStm.setString(1, username);
                try (ResultSet rs = preStm.executeQuery()) {
                    if (rs.next()) {
                        return -1;
                    }
                }
            }
        }
        return 1;
    }
        public static boolean checkPhone(String phone) {
        boolean check = phone.matches("[0-9]{10}");
        return check;
    }
        public static boolean checkEmail(String mail) {
        boolean check = mail.matches("^[a-z][a-z0-9_\\.]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}");
        return check;
    }
}
