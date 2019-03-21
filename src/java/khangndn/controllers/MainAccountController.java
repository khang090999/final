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
public class MainAccountController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
     private static final String LOGOUT = "LogOutController";
    private static final String SEARCH = "SearchAccountController";
    private static final String UPDATE = "UpdateAccountController";
    private static final String INSERT = "InsertAccountController";
    private static final String DELETE = "DeleteAccountController";
    private static final String PROFILE = "SearchProfileController";
    private static final String UPDATE_PROFILE = "UpdateProfileController";
    private static final String CHANGE = "ChangePasswordController";
    private static final String EDIT = "EditAccountController";

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
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Search")) {
                url = SEARCH;
            }else if (action.equals("LogOut")) {
                url = LOGOUT;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("Insert")) {
                url = INSERT;
            } else if (action.equals("Delete")) {
                url = DELETE;
            } else if (action.equals("Edit")) {
                url = EDIT;
            }else if (action.equals("Profile")) {
                url = PROFILE;
            }else if (action.equals("UpdateProfile")) {
                url = UPDATE_PROFILE;
            }else if (action.equals("Change")) {
                url = CHANGE;
            }else{
                request.setAttribute("ERROR", "Action is not supported!");
            }
        } catch (Exception e) {
            log("ERROR at MainAccountController: " + e.getMessage());
        } finally {
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
