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
    </head>

    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="MainTourInfoController" method="POST">
                        <span class="login100-form-title p-b-34">
                            Insert Tour Info
                        </span>

                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Tour code ">
                            <input class="input100" type="text" name="txtCode" max="50" value="${param.txtCode}" placeholder="Code...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.codeError}
                            </span>
                        </div>

                        <div class="wrap-input100  validate-input m-b-20" data-validate="Adult price must be a positive number">
                            <input class="input100" type="text" name="txtAdultPrice" value="${param.txtAdultPrice}" placeholder="Adult price...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.adultPriceError}
                            </span>
                        </div>
                        <div class="wrap-input100  validate-input m-b-20" data-validate="Kid price must be a positive number">
                            <input class="input100" type="text" name="txtKidPrice" value="${param.txtKidPrice}" placeholder="Kid price...">
                            <span class="focus-input100"></span>
                            <span class="error">${requestScope.INVALID.kidPriceError}
                            </span>
                        </div>
                        <div class="wrap-input100  validate-input m-b-20" data-validate="Start date must be after today">
                            <input class="input100" type="date" name="dateStart" value="${param.dateStart}" placeholder="Start date...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.startDateError}
                            </span>
                        </div>
                        <div class="wrap-input100  validate-input m-b-20" data-validate="End date must be after or equal Start date">
                            <input class="input100" type="date" name="dateEnd" value="${param.dateEnd}" placeholder="End date...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.endDateError}
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-20" data-validate="Quantity must be a positive integer">
                            <input class="input100" type="text" name="txtQuantity" value="${param.txtQuantity}" placeholder="Quantity...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.quantityError}</span>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <input type="hidden" name="id" value="${param.id}" />
                                <input type="hidden" name="place" value="${param.place}" />
                                <input type="hidden" name="description" value="${param.description}" />
                                <input type="hidden" name="transport" value="${param.transport}" />
                                <input type="hidden" name="image" value="${param.image}" />
                                <button type="submit" name="action" value="Insert" class="login100-form-btn">
                                    Insert
                                </button>
                            </div>
                                <c:url var="Back" value="MainTourController">
                                <c:param name="id" value="${param.id}"/>
                                <c:param name="place" value="${param.place}" />
                                <c:param name="description" value="${param.description}" />
                                <c:param name="transport" value="${param.transport}" />
                                <c:param name="image" value="${param.image}" />
                                <c:param name="action" value="View" />
                            </c:url>
                            <a href="${Back}" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
                                Back to view tour
                                <i class="fa fa-long-arrow-right m-l-5"></i>
                            </a>
                        </div>
                    </form>


                    <div class="login100-more" style="background-image: url('images/destination-5.jpg');"></div>
                </div>
            </div>
        </div>



        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
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