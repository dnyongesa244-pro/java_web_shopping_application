<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eMALL Online Shopping</title>
    <style>
        <!-- your styles here -->
    </style>
</head>
<body>
    <section>
        <h1 id="head">eMALL Products</h1>
        <table>
            <tr>
                <th scope="col">Product ID</th>
                <th scope="col">Product Name</th>
                <th scope="col">Quantity Available</th>
                <th scope="col">Price</th>
                <th scope="col">Image</th>
            </tr>
            <!-- Java code to fetch data from the database -->
            <%
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Load the JDBC driver and establish a connection
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eshoping", "root", "");

                    // Create and execute the SQL query
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM product_for_sale");

                    while (resultSet.next()) {
            %>
            <tr class="items">
                <td><%= resultSet.getInt("product_id") %></td>
                <td><%= resultSet.getString("Product_name") %></td>
                <td><%= resultSet.getInt("Quantity") %></td>
                <td><%= resultSet.getDouble("price") %></td>
                <td><img src="<%= resultSet.getString("image") %>" alt="Product Image" width="100"></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close the database resources
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                }
            %>
        </table>
    </section>
</body>
</html>
