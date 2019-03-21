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
public class UpdateProfileController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS= "SearchProfileController";
    private static final String INVALID= "update.jsp";
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
            String fullname= request.getParameter("txtFullname");
            String phone= request.getParameter("txtPhone");
            String email= request.getParameter("txtEmail");
            String role= request.getParameter("txtRole");
            String username= request.getParameter("txtUsername");
            AccountDTO dto = new AccountDTO(username, role, fullname, phone, email);
            boolean valid= true;
            AccountErrorObject errorObj = new AccountErrorObject();
            if(!AccountValidation.checkText(fullname))
            {
                errorObj.setFullnameError("*Full name can't be blank!");
                valid=false;
            }
            if(!AccountValidation.checkPhone(phone))
            {
                errorObj.setPhoneError("*Phone number is not valid!");
                valid=false;
            }
            if(!AccountValidation.checkEmail(email))
            {
                errorObj.setEmailError("*Email is not valid!");
                valid=false;
            }
            if(valid)
            {
                KhangNDNBean beans=  new KhangNDNBean();
                beans.setDto(dto);
                if(beans.update())
                {
                    url=SUCCESS;
                }
                else
                {
                    request.setAttribute("ERROR", "Update failed!");
                }
            }else
            {
                url= INVALID;
                request.setAttribute("DTO", dto);
                request.setAttribute("INVALID", errorObj);
            }
        } catch (Exception e) {
            log("ERROR at UpdateProfileController: "+e.getMessage());
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
