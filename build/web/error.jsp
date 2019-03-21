<%-- 
    Document   : error
    Created on : Feb 16, 2019, 10:57:54 PM
    Author     : KHANG NGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Traveland</title>
    </head>
    <body>
        <h1>Error Page</h1>
        <font color="red">
        ${requestScope.ERROR}
        </font>
        <a href="index.jsp">Back to Login</a>
    </body>
</html>
