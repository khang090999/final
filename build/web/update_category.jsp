<%-- 
    Document   : insert_tour
    Created on : Feb 22, 2019, 10:29:05 AM
    Author     : KHANG NGUYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Traveland </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
        <script src="js/file-reader.js"></script>
    </head>

    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="UpdateTourCategoryController" method="POST" enctype="multipart/form-data">
                        <span class="login100-form-title p-b-34">
                            Update Tour
                        </span>
                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Tour ID">
                            <input class="input100" readonly="true" type="text" name="txtId" value="${requestScope.DTO.tourID}" placeholder="Tour ID...">
                            <span class="focus-input100"></span>
                            <span class="error">${requestScope.INVALID.idError}
                            </span> 
                        </div>
                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Tour Description">
                            <input class="input100" type="text" name="txtDescription" max="500" value="${requestScope.DTO.description}" placeholder="Tour description...">
                            <span class="focus-input100"></span>
                            <span class="error">${requestScope.INVALID.desError}
                            </span> 
                        </div>

                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Place">
                            <input class="input100" type="text" name="txtPlace" max="50" value="${requestScope.DTO.place}" placeholder="Place...">
                            <span class="focus-input100"></span>
                            <span class="error">${requestScope.INVALID.placeError}
                            </span> 
                        </div>

                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Transport">
                            <input class="input100" type="text" name="txtTransport" max="50" value="${requestScope.DTO.transport}" placeholder="Transport...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.transportError}
                            </span> 
                        </div>

                        <div class="wrap-input100  validate-input m-b-20">
                             <select name="cboType" class="input100 input-append">
                            <option <c:if test="${requestScope.DTO.type eq 'Viet Nam Tour'}">selected="true"</c:if>>Viet Nam Tour</option>
                            <option <c:if test="${requestScope.DTO.type eq 'World Tour'}">selected="true"</c:if>>World Tour</option>
                            </select>
                        </div>
                       <div class="wrap-input100  validate-input m-b-20" data-validate="Image is not valid">
                           <input id="imgInp" class="input100 figure-caption" max="50" type="file" name="fileUpdate" value="" onchange="readURL(this)">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.imgError}
                            </span> 
                        </div>
                         

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                <button type="submit" name="action" value="Update" class="login100-form-btn">
                                    Update
                                </button>
                            </div>
                                <c:url var="SearchTour" value="MainTourController" >
                                    <c:param name="action" value="Search"/>
                                    <c:param name="txtSearch" value="${param.txtSearch}"/>
                                </c:url>
                            <a href="${SearchTour}" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
                                Back 
                                <i class="fa fa-long-arrow-right m-l-5"></i>
                            </a>
                        </div>
                    </form>


                            <div id="file-img" class="login100-more" style="background-image: url('${requestScope.DTO.imgPath}');" ></div>
                </div>  
            </div>
        </div>



        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script><!--===============================================================================================-->
        
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <script>
            $(".selection-2").select2({
                minimumResultsForSearch: 20,
                dropdownParent: $('#dropDownSelect1')
            });
        </script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/login.js"></script>

    </body>

</html>