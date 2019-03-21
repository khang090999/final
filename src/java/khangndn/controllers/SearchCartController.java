/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khangndn.dtos.BookingTourDTO;
import khangndn.dtos.CartErrorObject;
import khangndn.models.CartBean;

/**
 *
 * @author KHANG NGUYEN
 */
public class SearchCartController extends HttpServlet {

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
        try {
            String username= request.getParameter("username");
            String status  = request.getParameter("cboStatus");
            CartErrorObject errObj = new CartErrorObject();
            boolean valid=true;
            if(username.trim().equals("")) 
            {
                valid=false;
                errObj.setSearchError("*Username can't be blank!");
            }
            if(valid){
            CartBean beans= new CartBean();
            beans.setUsername(username);
            beans.setStatus(status);
            List<BookingTourDTO> result = beans.findBookingCart();
            request.setAttribute("INFO", result);
            }else
            {
                request.setAttribute("INVALID", errObj);
            }
        } catch (Exception e) {
            log("ERROR at SearchCartController: "+e.getMessage());
        }finally
        {
            request.getRequestDispatcher("search_cart.jsp").forward(request, response);
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
