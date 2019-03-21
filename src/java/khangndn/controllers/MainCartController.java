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

/**
 *
 * @author KHANG NGUYEN
 */
public class MainCartController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String BUY="BuyController";
    private static final String UPDATE="UpdateCartController";
    private static final String STATUS="UpdateStatusController";
    private static final String BOOKING="BookTourController";
    private static final String REMOVE="RemoveCartController";
    private static final String VIEW="ViewBookingTourController";
    private static final String CANCEL="CancelCartController";
    private static final String SEARCH="SearchCartController";
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
            String action= request.getParameter("action");
            
            if(action.equals("Buy"))
            {
                url=BUY;
            }else if(action.equals("Remove"))
            {
                url=REMOVE;
            }else if(action.equals("UpdateCart"))
            {
                url=UPDATE;
            }else if(action.equals("Book Tour"))
            {
                url=BOOKING;
            }else if(action.equals("View"))
            {
                url=VIEW;
            }else if(action.equals("Cancel"))
            {
                url=CANCEL;
            }else if(action.equals("Search"))
            {
                url=SEARCH;
            }else if(action.equals("Update"))
            {
                url=STATUS;
            }
            else
            {
                request.setAttribute("ERROR", "Action is not supported!");
            }
                
        } catch (Exception e) {
            log("ERROR at MainCartController: "+e.getMessage());
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
