/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.controllers;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khangndn.dtos.CartErrorObject;
import khangndn.models.CartBean;
import khangndn.validations.CartValidation;

/**
 *
 * @author KHANG NGUYEN
 */
public class CancelCartController extends HttpServlet {
    private  static final String ERROR="error.jsp";
    private static final String SUCCESS="ViewBookingTourController";
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
        String url= ERROR;
        try {
            String code= request.getParameter("code");
            String id= request.getParameter("id");
            String quantity=request.getParameter("quantity");
            CartErrorObject errorObj = new CartErrorObject();
            if(!CartValidation.checkStatus(Integer.parseInt(id), code))
            {
                errorObj.setCancelMessage("Your tour has been canceled!");
                request.setAttribute("MESSAGE", errorObj);
                url=SUCCESS;
            }else{
            CartBean beans = new CartBean();
            
            beans.setCode(code);
            beans.setId(Integer.parseInt(id));
            beans.setQuantity(Integer.parseInt(quantity));
            Date date =beans.getCancelDate();
            String status="";
            long time= (date.getTime()-(new Date(System.currentTimeMillis()).getTime()))/(24*60*60*1000);
            if(time >7) 
            {
                errorObj.setCancelMessage("You have to pay 10% of the tour!!!");
                status="10% Paid";
            }else if(5<=time && 7 >time)
            {
                errorObj.setCancelMessage("You have to pay 30% of the tour!!!");
                status="30% Paid";
            }else if(2<= time && 5>time)
            {
                errorObj.setCancelMessage("You have to pay 50% of the tour!!!");
                status="50% Paid";
            }else
            {
                errorObj.setCancelMessage("You have to pay 90% of the tour!!!");
                status="90% Paid";
            }
            request.setAttribute("MESSAGE", errorObj);
            beans.setStatus(status);
            if(beans.updateStatus() )
            {
                url=SUCCESS;
                beans.updateQuantity();
            }else{request.setAttribute("ERROR", "Cancel Tour ERROR");}}
        } catch (Exception e) {
            log("ERROR at CancelCartController: "+e.getMessage());
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
