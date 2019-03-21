/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khangndn.dtos.AccountErrorObject;
import khangndn.models.KhangNDNBean;
import khangndn.validations.AccountValidation;

/**
 *
 * @author KHANG NGUYEN
 */
public class ChangePasswordController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "password.jsp";
    private static final String SUCCESS = "SearchProfileController";
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
            String password= request.getParameter("txtPassword");
            String newPass= request.getParameter("txtNewPassword");
            String confirm= request.getParameter("txtConfirm");
            AccountErrorObject errorObj= new AccountErrorObject();
             boolean valid = true;
             if(!AccountValidation.checkPassword(password)) 
            {
                errorObj.setPasswordError("Password is not valid!");
                valid=false;
            }
             if(!AccountValidation.checkPassword(newPass)) 
            {
                errorObj.setNewPasswordError("Password must be 6 to 32 characters!");
                valid=false;
            }
            if(!confirm.equals(newPass))
            {
                errorObj.setConfirmError("Confirm password must be match with password!");
                valid=false;
            }
            if(valid)
            {
                HttpSession session  = request.getSession();
                KhangNDNBean beans = new KhangNDNBean();
                beans.setPassword(password);
                beans.setNewPass(newPass);
                beans.setUsername((String) session.getAttribute("USER"));
                if(beans.changePassword())
                {
                    url=SUCCESS;
                }else
                {
                    url=INVALID;
                    errorObj.setPasswordError("*Wrong password!");
                    request.setAttribute("INVALID", errorObj);
                }
            }else
            {
                url=INVALID;
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at ChangePasswordController: "+e.getMessage());
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
