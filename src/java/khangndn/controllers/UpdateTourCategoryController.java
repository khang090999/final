/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khangndn.dtos.TourDTO;
import khangndn.dtos.TourErrorObject;
import khangndn.models.TourBean;
import khangndn.validations.TourValidation;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author KHANG NGUYEN
 */
public class UpdateTourCategoryController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "SearchTourController";
    private static final String INVALID = "update_category.jsp";

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
        boolean checkImg = false;
        try {
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            boolean valid = true;
            TourErrorObject errorObj = new TourErrorObject();
            if (!isMultiPart) {
                HttpSession session = request.getSession();
                if (session.getAttribute("USER").equals("admin")) {
                    url = "FirstController";
                } else {
                    url = "index.jsp";
                }
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    log("ERROR at file upload: " + e.getMessage());
                }
                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                String filename = null;
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        params.put(item.getFieldName(), item.getString("UTF-8"));
                        System.out.println(item.getString());
                    } else {
                        String itemName = item.getName();
                        filename = itemName.substring(itemName.lastIndexOf("\\") + 1);
                        params.put("image", item);
                    }
                }
                String id = ((String) params.get("txtId")).trim();
                String des = ((String) params.get("txtDescription")).trim();
                String place = ((String) params.get("txtPlace")).trim();
                String transport = ((String) params.get("txtTransport")).trim();
                String type = (String) params.get("cboType");
                if (!TourValidation.checkText(des)) {
                    errorObj.setDesError("Description is not valid!");
                    valid = false;
                }
                if (!TourValidation.checkText(place)) {
                    errorObj.setPlaceError("Place is not valid!");
                    valid = false;
                }
                if (!TourValidation.checkText(transport)) {
                    errorObj.setTransportError("Transport is not valid!");
                    valid = false;
                }
                if (TourValidation.checkImg(filename) == -1) {
                    errorObj.setImgError("File extension is not valid!");
                    valid = false;
                }
                if (TourValidation.checkImg(filename) == 0) {
                    checkImg = true;
                }
                TourDTO dto = null;
                if (!checkImg) {
                    filename = System.currentTimeMillis() + filename;
                    String imgPath = "images/" + filename;
                    dto = new TourDTO(id, des, place, transport, type, imgPath);
                } else {
                    dto = new TourDTO(id, des, place, transport, type);
                }
                if (valid) {

                    TourBean beans = new TourBean();
                    beans.setDto(dto);
                    if (beans.updateCategory()) {
                        url = SUCCESS;
                        if (!checkImg) {
                            try {
                                FileItem item = (FileItem) params.get("image");
                                String realPath = getServletContext().getRealPath("/") + "images\\" + filename;
                                File saveFile = new File(realPath);
                                item.write(saveFile);
                            } catch (Exception e) {
                                log("ERROR at write image file: " + e.getMessage());
                            }
                        }
                    } else {
                        request.setAttribute("ERROR", "Insert Tour Category failed!");
                    }
                } else {
                    url = INVALID;
                    request.setAttribute("INVALID", errorObj);
                    request.setAttribute("DTO", dto);
                }
            }
        } catch (Exception e) {
            log("ERROR at UpdateTourCategoryController: " + e.getMessage());
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
