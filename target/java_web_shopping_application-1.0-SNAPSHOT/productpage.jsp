<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>eMALL Online Shopping</title>
</head>
<body>
    <h1>eMALL Products</h1>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>

        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.jdbc.Driver"); // Replace with your JDBC driver

                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/emall", "root", ""); // Replace with your database URL, username, and password

                statement = connection.createStatement();
                resultSet = statement.executeQuery("SELECT * FROM products");

                while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("ProductID") %></td>
            <td><%= resultSet.getString("ProductName") %></td>
            <td><%= resultSet.getString("Quantity") %></td>
            <td><%= resultSet.getString("Price") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }
        %>
    </table>
</body>
</html>
