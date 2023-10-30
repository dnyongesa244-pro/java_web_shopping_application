<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Load Data and Images from Database</title>
</head>
<body>
    <%
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eshoping", "root", "");

            // Create a SQL statement to retrieve data and images
            Statement stmt = conn.createStatement();

            // Execute a SQL query to retrieve data and images
            String sql = "SELECT product_id, Product_name, Quantity, price, image FROM product_for_sale";
            ResultSet resultSet = stmt.executeQuery(sql);

            while (resultSet.next()) {
    %>
    <div>
        <h1>Product Data:</h1>
        Product ID: <%= resultSet.getInt("product_id") %><br>
        Product Name: <%= resultSet.getString("Product_name") %><br>
        Quantity: <%= resultSet.getInt("Quantity") %><br>
        Price: <%= resultSet.getDouble("price") %><br>
        <h1>Product Image:</h1>
        <img src="data:image/jpeg;base64, <%= new String(resultSet.getBytes("image"), "ISO-8859-1") %>" alt="Product Image" /><br><br>
    </div>
    <%
            }
            // Close resources
            resultSet.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        }
    %>
</body>
</html>
