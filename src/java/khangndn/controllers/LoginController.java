/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khangndn.dtos.AccountErrorObject;
import khangndn.models.KhangNDNBean;

/**
 *
 * @author KHANG NGUYEN
 */
public class LoginController extends HttpServlet {
    private static final String ERROR= "error.jsp";
    private static final String SUCESS="FirstController";
    private static final String INVALID="index.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String username= request.getParameter("txtUsername").trim();
            String password= request.getParameter("txtPass");
            
             boolean valid = true;
             AccountErrorObject errorObj= new AccountErrorObject();
             
             if(username.length() == 0)
             {
                 valid =false;
                 errorObj.setUsernameError("User name can't be blank!");
             }
             if(password.length() ==0)
             {
                 valid=false;
                 errorObj.setPasswordError("Password can't be blank!");
             }                      
                 KhangNDNBean beans = new KhangNDNBean();
                 beans.setUsername(username);
                 beans.setPassword(password);
                 String role=beans.checkLogin();
                 if(role.equals("failed"))
                 {
                     url=INVALID;
                     request.setAttribute("ERROR", "Invalid Username or Password");
                 }else
                 {
                     HttpSession session = request.getSession();
                     session.setAttribute("USER", username);
                     if(role.equals("admin") || role.equals("user"))
                     {
                         url=SUCESS;
                         session.setAttribute("ROLE", role);
                     }
                     
                     else
                     {
                         request.setAttribute("ERROR", "Your role is not exist!");
                     }
                 }
             
        } catch (Exception e) {
            log("ERROR at LoginController: "+e.getMessage());
        }finally
        {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
