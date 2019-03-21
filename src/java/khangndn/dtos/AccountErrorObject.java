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
public class AccountErrorObject implements Serializable{
    private String usernameError, passwordError, newPasswordError, fullnameError, roleError,searchError, confirmError, emailError, phoneError;

    public AccountErrorObject() {
    }

    public String getConfirmError() {
        return confirmError;
    }

    public String getEmailError() {
        return emailError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public String getUsernameError() {
        return usernameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public String getFullnameError() {
        return fullnameError;
    }

    public String getRoleError() {
        return roleError;
    }

    public String getSearchError() {
        return searchError;
    }

    public void setSearchError(String searchError) {
        this.searchError = searchError;
    }
    
    public void setUsernameError(String usernameError) {
        this.usernameError = usernameError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public void setFullnameError(String fullnameError) {
        this.fullnameError = fullnameError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getNewPasswordError() {
        return newPasswordError;
    }

    public void setNewPasswordError(String newPasswordError) {
        this.newPasswordError = newPasswordError;
    }
    
}
