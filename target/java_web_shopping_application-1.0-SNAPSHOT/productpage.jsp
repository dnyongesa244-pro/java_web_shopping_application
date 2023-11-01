<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>eMALL Online Shopping</title>
    <style>
       .div1 {
            text-align: center;
            width: 100%;
            padding: 0;
        }
        /*  Bright Mode styles */
        body.bright-mode {
            background-color: #fff;
            color: #000;
        }
        body.bright-mode .div1 {
            background-color: aqua;
        }
        /*  Mode styles */
        body.dark-mode {
            background-color: #333;
            color: #fff;
        }
        body.dark-mode .div1 {
            background-color: #222;}
    </style>
</head>
<body>
    <div class="div1">
        <h1>LOGIN</h1>
        <label for="modeToggle">Dark Mode</label>
        <input type="checkbox" id="modeToggle">
        <br>
        <label for="bgColorPicker">Choose Background Color:</label>
        <input type="color" id="bgColorPicker">
        <br>
        <label for="txtColorPicker">Choose Text Color:</label>
        <input type="color" id="txtColorPicker">
    </div>
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
    <script>
        // Dark mode toggle
        document.getElementById('modeToggle').addEventListener('change', function() {
            if (this.checked) {
                document.body.classList.add('dark-mode');
            } else {
                document.body.classList.remove('dark-mode');
            }
        });

        // Background color picker
        document.getElementById('bgColorPicker').addEventListener('change', function() {
            document.body.style.backgroundColor = this.value;
        });

        // Text color picker
        document.getElementById('txtColorPicker').addEventListener('change', function() {
            document.body.style.color = this.value;
        });
    </script>
</body>
</html>
