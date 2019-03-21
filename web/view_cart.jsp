<%-- 
    Document   : view_cart
    Created on : Feb 26, 2019, 10:11:30 PM
    Author     : KHANG NGUYEN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html lang="en">
    <head>
        <title>Traveland </title>
        <meta charset="utf-8">
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
        <script src="js/view_tour.js"></script>
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


        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
                    <div class="col-md-7 ftco-animate mt-5" data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Be a Traveler not a Tourist</h1>
                        <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Travel to the any corner of the world, without going around in circles</p>
                    </div>
                </div>
            </div>
        </div>
        <section class="ftco-section ftco-no-pb ftco-no-pt">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="search-wrap-1 ftco-animate p-4">
                            <form action="MainTourController" method="POST" class="search-property-1">
                                <div class="row">
                                    <div class="col-lg align-items-end">
                                        <div class="form-group">
                                            <label for="#">Destination</label>
                                            <div class="form-field">
                                                <div class="icon">
                                                    <span class="ion-ios-search"></span>
                                                </div>
                                                <input type="text" name="txtSearch" class="form-control" placeholder="Search place">
                                            </div>
                                        </div>
                                    </div>
                                     <div class="col-lg align-items-end">
                                        <div class="form-group">
                                            <label for="#">Type</label>
                                            <div class="form-field">
                                                <div class="select-wrap">
                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                    <select name="cboType" class="form-control">
                                                       <option <c:if test="${param.cboType eq 'Viet Nam Tour'}">selected="true"</c:if>>Viet Nam Tour</option>
                                                        <option <c:if test="${param.cboType eq 'World Tour'}">selected="true"</c:if>>World Tour</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg align-self-end">
                                        <div class="form-group">
                                            <div class="form-field">
                                                <input type="submit" name="action" value="Search" class="form-control btn btn-primary">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center pb-5">
                    <div class="col-md-12 heading-section text-center ftco-animate">
                        <h2 class="mb-4">${sessionScope.shoppingCart.customerName}</h2>
                    </div>
                </div>
                <c:set var="cart" value="${sessionScope.shoppingCart.cart}" />

                <div class="row">
                    <c:if test="${cart!=null}">
                        <c:if test="${not empty cart}" var="checkData">
                            <table class="table table-borderless  table-responsive-xl table-striped table-hover">
                                <thead class="border-bottom">
                                    <tr>
                                        <th>No</th>                         
                                        <th>Code</th>
                                        <th>Adult Quantity</th>
                                        <th>Kid Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cart}" var="dto" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${dto.value.code}</td>
                                            <form action="MainCartController" method="POST">
                                                <input type="hidden" name="code" value="${dto.value.code}"/>
                                                <input type="hidden" name="action" value="UpdateCart"/>
                                            <td><input  class="${dto.value.code}" type="number" name="txtAdultQuantity" value="${dto.value.adultQuantity}" min="1" max="${dto.value.quantity}" onchange="loadDoc(this);"/></td>
                                            <td><input  class="${dto.value.code}" type="number" name="txtKidQuantity" value="${dto.value.kidQuantity}" min="0" max="${dto.value.quantity}" onchange="loadDoc(this);"></td>
                                            </form>
                                            <td>${dto.value.totalPrice} VND 
                                                <div class="float-right">
                                             <span>
                                                    <c:url var="DeleteLink" value="MainCartController">
                                                        <c:param name="code" value="${dto.value.code}"/>
                                                        <c:param name="action" value="Remove"/>
                                                    </c:url>
                                                    <a href="${DeleteLink}">
                                                        <button class="btn-toolbar btn btn-light">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </button>
                                                    </a>
                                                </span>
                                                        </div>
                                            </td>

                                            <td>
                                                <span class="error" id="${dto.value.code}" style="display: none" ></span>
                                            </td>
                                   
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td id="total">Total: ${sessionScope.shoppingCart.total} VND </td>
                                    <td>
                                        <form action="MainCartController" method="POST">
                                            <button id="sub" type="submit" name="action" value="Book Tour" class="btn btn-primary">Book Tour</button>
                                        </form>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <span class="error">
                                ${requestScope.INVALID.quantityError}<br/>
                            </span>
                        </c:if>
                        <c:if test="${!checkData}">
                            Your cart is empty<br/>
                        </c:if> 
                    </c:if>
                </div>
            </div>
        </section>
       <br/>
<section class="ftco-subscribe" style="background-image: url(images/bg_1.jpg); height: 500px">
      <div class="overlay">
        <div class="container">
          <div class="row d-flex justify-content-center">
           
          </div>
        </div>
      </div>
    </section>


    <footer class="ftco-footer ftco-footer-2 ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Traveland</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Infromation</h2>
              <ul class="list-unstyled">
                <li class="py-2 d-block">Online Enquiry</li>
                <li class="py-2 d-block">General Enquiries</li>
                <li class="py-2 d-block">Booking Conditions</li>
                <li class="py-2 d-block">Privacy and Policy</li>
                <li class="py-2 d-block">Refund Policy</li>
                <li class="py-2 d-block">Call Us</li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Experience</h2>
              <ul class="list-unstyled">
                <li class="py-2 d-block">Adventure</li>
                <li class="py-2 d-block">Hotel and Restaurant</li>
                <li class="py-2 d-block">Beach</li>
                <li class="py-2 d-block">Nature</li>
                <li class="py-2 d-block">Camping</li>
                <li class="py-2 d-block">Party</li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">2nd Floor, Innovation Building, Block 24 - Quang Trung Software Park - Tan Chanh Hiep Ward, District 12, HCMC</span></li>
	                <li><span class="icon icon-phone"></span><span class="text"> 0857664974</span></li>
                        <li><span class="icon icon-envelope"></span><span class="text"> khangndnse130148@fpt.edu.vn</span></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>