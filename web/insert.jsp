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
                    <form class="login100-form validate-form" action="MainAccountController" method="POST">
                        <span class="login100-form-title p-b-34">
                            Sign Up
                        </span>

                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Full name">
                            <input class="input100" max="50" type="text" name="txtFullname" value="${param.txtFullname}" placeholder="Name...">
                            <span class="focus-input100"></span>
                            <span class="error">${requestScope.INVALID.fullnameError}
                            </span> 
                        </div>

                        <div class="wrap-input100  validate-input m-b-20" data-validate="Invalid email: ex@abc.xyz">
                            <input class="input100" type="text" name="txtEmail" max="50" value="${param.txtEmail}" placeholder="Email addess...">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.emailError}
                            </span>
                        </div>
                            <div class="wrap-input100  validate-input m-b-20" data-validate="Invalid phone number">
                            <input class="input100" type="text" name="txtPhone" value="${param.txtPhone}" placeholder="Phone number...">
                            <span class="focus-input100"></span>
                            <span class="error">${requestScope.INVALID.phoneError}
                            </span>
                            </div>
                        <div class="wrap-input100  validate-input m-b-20" data-validate="Type Username">
                            <input class="input100" type="text" name="txtUsername" max="50" value="${param.txtUsername}" placeholder="Username...">
                            <span class="focus-input100"></span>
                             <span class="error"> ${requestScope.INVALID.usernameError}</span>
                        </div>
                           
                        <div class="wrap-input100  validate-input m-b-20" data-validate="Password must be 6 to 32 characters">
                            <input class="input100" type="password" id="password" name="txtPassword" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.passwordError}
                            </span>
                        </div>
                        <div class="wrap-input100 validate-input m-b-20" data-validate="Not match password">
                            <input class="input100" type="password" name="txtConfirm" placeholder="Confirm Password">
                            <span class="focus-input100"></span>
                            <span class="error"> ${requestScope.INVALID.confirmError}
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button type="submit" name="action" value="Insert" class="login100-form-btn">
                                    Sign Up
                                </button>
                            </div>

                            <a href="index.jsp" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
                                Sign in
                                <i class="fa fa-long-arrow-right m-l-5"></i>
                            </a>
                        </div>
                    </form>


                        <div class="login100-more" style="background-image: url('images/destination-1.jpg');"></div>
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