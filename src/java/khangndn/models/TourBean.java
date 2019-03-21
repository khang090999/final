/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.models;

import java.io.Serializable;
import java.util.List;
import khangndn.daos.TourDAO;
import khangndn.dtos.TourDTO;

/**
 *
 * @author KHANG NGUYEN
 */
public class TourBean implements Serializable {

    private String search, code, id, type;
    private TourDTO dto;
    private int num;

    public TourBean() {
    }

    public String getId() {
        return id;
    }

    public int getNum() {
        return num;
    }

    public TourDTO getDto() {
        return dto;
    }

    public String getSearch() {
        return search;
    }

    public String getCode() {
        return code;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDto(TourDTO dto) {
        this.dto = dto;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<TourDTO> findByLikeName() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.findByLikeName(search, type);
    }

    public boolean deleteCategory() throws Exception {
        
        TourDAO dao = new TourDAO();
        return dao.deleteCategory(id);
    }

    public boolean insertCategory() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.insertCategory(dto);
    }

    public TourDTO findByPrimaryKey() throws Exception {
        TourDAO dao = new TourDAO();
        return dao.findByPrimaryKey(id);
    }

    public boolean updateCategory() throws Exception
    {
        TourDAO dao = new TourDAO();
        return dao.updateCategory(dto);
    }
     public List<TourDTO> findTourInfo() throws Exception
     {
        TourDAO dao = new TourDAO();
        return dao.findTourInfo(id);
     }
     public boolean deleteInfo() throws Exception 
     {
         TourDAO dao = new TourDAO();
         return dao.deleteInfo(code);
     }
     public boolean insertInfo() throws Exception 
     {
          TourDAO dao = new TourDAO();
         return dao.insertInfo(dto);
     }
      public TourDTO findInfoByCode() throws Exception
      {
          TourDAO dao = new TourDAO();
         return dao.findInfoByCode(code);
      }
      public boolean updateInfo() throws Exception
      {
          TourDAO dao = new TourDAO();
         return dao.updateInfo(dto);
      } 
      public List<TourDTO> selectTopTour() throws Exception
     {
        TourDAO dao = new TourDAO();
        return dao.selectTopTour(num, type);
     }
}   
