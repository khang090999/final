<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Traveland </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/confirm.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="FirstController"><span>Traveland</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="FirstController" class="nav-link">Home</a></li>                 
                        <li class="nav-item"><a href="SearchTourController" class="nav-link">Destination</a></li>
                            <c:if test="${sessionScope.USER eq 'admin'}">
                            <li class="nav-item"><a href="search.jsp" class="nav-link">Accounts</a></li>
                            <li class="nav-item"><a href="search_cart.jsp" class="nav-link">Tour Management</a></li>
                            </c:if>
                  
                            <c:if test="${sessionScope.USER != null}" var="checkData">  
                                <li class="nav-item"><a href="view_cart.jsp" class="nav-link">Cart <i class="fa fa-cart-plus" style="font-size:20px; padding: 0" aria-hidden="true"></i></a></li>
                               <li class="nav-item"><a href="ViewBookingTourController" class="nav-link">Booking Tour</a></li>
                                 <c:url value="MainAccountController" var="Profile">
                                    <c:param name="action" value="Profile"/>
                                </c:url>
                               <li class="nav-item"><a href="${Profile}" class="nav-link">Profile</a></li>
                               <c:url value="MainAccountController" var="LogOut">
                                    <c:param name="action" value="LogOut"/>
                                </c:url>
                            <li class="nav-item cta"><a href="${LogOut}" class="nav-link" onclick="return checkLogout(this)">Log Out</a></li>
                        </c:if>
                        <c:if test="${!checkData}">
                            <li class="nav-item cta"><a href="index.jsp" class="nav-link">Login</a></li>
                        </c:if>
                            </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

         