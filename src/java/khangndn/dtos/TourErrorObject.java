/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khangndn.dtos;

import java.io.Serializable;

/**
 *
 * @author KHANG NGUYEN
 */
public class TourErrorObject implements Serializable{
    private String searchError, idError, desError, placeError, transportError, imgError, deleteError,
            codeError, quantityError, adultPriceError, kidPriceError, startDateError, endDateError;

    public TourErrorObject() {
    }

    public String getDeleteError() {
        return deleteError;
    }

    public String getImgError() {
        return imgError;
    }

    public String getSearchError() {
        return searchError;
    }

    public String getIdError() {
        return idError;
    }

    public String getDesError() {
        return desError;
    }

    public String getPlaceError() {
        return placeError;
    }

    public String getTransportError() {
        return transportError;
    }

    public String getCodeError() {
        return codeError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public String getAdultPriceError() {
        return adultPriceError;
    }

    public String getKidPriceError() {
        return kidPriceError;
    }

    public String getStartDateError() {
        return startDateError;
    }

    public String getEndDateError() {
        return endDateError;
    }

    public void setSearchError(String searchError) {
        this.searchError = searchError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public void setDesError(String desError) {
        this.desError = desError;
    }

    public void setPlaceError(String placeError) {
        this.placeError = placeError;
    }

    public void setTransportError(String transportError) {
        this.transportError = transportError;
    }

    public void setCodeError(String codeError) {
        this.codeError = codeError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public void setAdultPriceError(String adultPriceError) {
        this.adultPriceError = adultPriceError;
    }

    public void setKidPriceError(String kidPriceError) {
        this.kidPriceError = kidPriceError;
    }

    public void setStartDateError(String startDateError) {
        this.startDateError = startDateError;
    }

    public void setEndDateError(String endDateError) {
        this.endDateError = endDateError;
    }

    public void setImgError(String imgError) {
        this.imgError = imgError;
    }

    public void setDeleteError(String deleteError) {
        this.deleteError = deleteError;
    }
    
}
