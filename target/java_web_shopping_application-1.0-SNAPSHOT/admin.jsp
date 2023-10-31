<%-- 
    Document   : admin
    Created on : Oct 31, 2023, 10:47:02 AM
    Author     : dkoko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="div1">
        <h1>LOGIN</h1>
    </div>
    <form action="loginservlet1" method="post">
        <table>
            <tr><td>Email</td><td><input type="text" name="txtname"></td></tr>
            <tr><td>Password</td><td><input type="password" name="txtpassword"></td></tr>
            <tr><td><input type="submit" value="Submit"></td><td><input type="reset"></td></tr>
        </table>
    </form>
</body>
</html>
