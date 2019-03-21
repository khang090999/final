/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khangndn.dtos.TourDTO;
import khangndn.models.TourBean;

/**
 *
 * @author KHANG NGUYEN
 */
public class SearchTourController extends HttpServlet {

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

            String search = request.getParameter("txtSearch");
            String type = request.getParameter("cboType");
            TourBean beans = new TourBean();
            beans.setType(type);
            List<TourDTO> result = new ArrayList<>();
            if (search.equals("")) {
                beans.setNum(20);
                result = beans.selectTopTour();
            } else {
                beans.setSearch(search.trim());
                result = beans.findByLikeName();
            }
            request.setAttribute("INFO", result);
            
        } catch (NullPointerException e) {
            TourBean beans = new TourBean();
            List<TourDTO> result = new ArrayList<>();
            try {
                beans.setNum(20);
                beans.setType("VIET NAM TOUR");
                result = beans.selectTopTour();
            } catch (Exception ee) {
                log("ERROR at SearchTourController:" + ee.getMessage());
            }
            request.setAttribute("INFO", result);
        } catch (Exception ex) {
            log("ERROR at SearchTourController:" + ex.getMessage());
        } finally {
            request.getRequestDispatcher("search_tour.jsp").forward(request, response);
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
