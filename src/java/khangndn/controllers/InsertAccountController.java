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
import khangndn.dtos.AccountDTO;
import khangndn.dtos.AccountErrorObject;
import khangndn.models.KhangNDNBean;
import khangndn.validations.AccountValidation;

/**
 *
 * @author KHANG NGUYEN
 */
public class InsertAccountController extends HttpServlet {
    private static final String ERROR= "error.jsp";
    private static final String SUCCESS="index.jsp";
    private static final String INVALID="insert.jsp";
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
        String url=ERROR;
        try {
            String username= request.getParameter("txtUsername");
            String password= request.getParameter("txtPassword");
            String confirm= request.getParameter("txtConfirm");
            String fullname= request.getParameter("txtFullname");
            String phone= request.getParameter("txtPhone");
            String email= request.getParameter("txtEmail");
            AccountErrorObject errorObj= new AccountErrorObject();
            AccountDTO dto = new AccountDTO(username, fullname, phone, email);
            dto.setPassword(password);
            boolean valid = true;
            
            if(AccountValidation.checkUsername(username)==0) 
            {
                errorObj.setUsernameError("Username can't be blank!");
                valid=false;
            }
            else if(AccountValidation.checkUsername(username)==-1) 
            {
                errorObj.setUsernameError("Username existed!");
                valid=false;
            }
            if(!AccountValidation.checkPassword(password)) 
            {
                errorObj.setPasswordError("Password must be 6 to 32 characters!");
                valid=false;
            }
            if(!confirm.equals(password))
            {
                errorObj.setConfirmError("Confirm password must be match with password!");
                valid=false;
            }
            if(!AccountValidation.checkText(fullname))
            {
                errorObj.setFullnameError("Full name can't be blank!");
                valid=false;
            }
            if(!AccountValidation.checkPhone(phone))
            {
                errorObj.setPhoneError("Phone number is not valid!");
                valid=false;
            }
            if(!AccountValidation.checkEmail(email))
            {
                errorObj.setEmailError("Email is not valid!");
                valid=false;
            }
            if(valid)
            {
                KhangNDNBean beans= new KhangNDNBean();
                dto.setStatus("true");
                beans.setDto(dto);
                if(beans.insert())
                {
                    url=SUCCESS;
                }else
                {
                    request.setAttribute("ERROR", "Insert failed");
                }
            }else
            {
                request.setAttribute("INVALID", errorObj);
                url=INVALID;
            }
            
        } catch (Exception e) {
            log("ERROR at InsertAccountController: "+e.getMessage());
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
