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
import khangndn.dtos.TourDTO;
import khangndn.dtos.TourErrorObject;
import khangndn.models.TourBean;
import khangndn.validations.TourValidation;

/**
 *
 * @author KHANG NGUYEN
 */
public class UpdateInfoController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ViewTourController";
    private static final String INVALID ="update_info.jsp";
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
            String id = request.getParameter("id");
            String code= request.getParameter("txtCode");
            String adultPrice = request.getParameter("txtAdultPrice");
            String kidPrice = request.getParameter("txtKidPrice");
            String startDate= request.getParameter("dateStart");
            String endDate= request.getParameter("dateEnd");
            String quantity= request.getParameter("txtQuantity");
            TourErrorObject errorObj = new TourErrorObject();
            boolean valid = true;
            if(!TourValidation.checkPrice(adultPrice))
            {
                valid=false;
                errorObj.setAdultPriceError("Adult price must be a positive number!");
                adultPrice="0";
            }
            if(!TourValidation.checkPrice(kidPrice))
            {
                valid=false;
                errorObj.setKidPriceError("Kid price must be a positive number!");
                kidPrice="0";
            }
            if(startDate.equals(""))
            {
                valid=false;
                errorObj.setStartDateError("Please choose Tour Start Date!");
                
            }else if(!TourValidation.checkDate(startDate))
            {
                valid=false;
                errorObj.setStartDateError("Start date must be after today");
            }
            if(endDate.equals(""))
            {
                valid=false;
                errorObj.setEndDateError("Please choose Tour End Date!!!");
            }else if(!TourValidation.checkEndDate(startDate, endDate))
            {
                valid=false;
                errorObj.setEndDateError("End date must be after or equal Start date");
            }
           if(!TourValidation.checkQuantity(quantity))
           {
               valid=false;
               errorObj.setQuantityError("Quantity must be a positive integer");
           }
            TourDTO dto = new TourDTO(id, code, Integer.parseInt(quantity), Float.parseFloat(adultPrice), Float.parseFloat(kidPrice), Date.valueOf(startDate), Date.valueOf(endDate));
            if(valid)
            {
                
                 TourBean beans = new TourBean();
                 beans.setDto(dto);
                 if(beans.updateInfo())
                 {
                     url=SUCCESS;
                 }else
                 {
                     request.setAttribute("ERROR", "Update Info failed!");
                 }
            }else
            {
                request.setAttribute("DTO", dto);
                request.setAttribute("INVALID", errorObj);
                url=INVALID;
             }
        } catch (Exception e) {
            log("ERROR at UpdateInfoController: "+e.getMessage());
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
