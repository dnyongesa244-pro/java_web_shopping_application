<%-- 
    Document   : homepage
    Created on : Oct 27, 2023, 1:31:03 PM
    Author     : dkoko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Welcome to home page</h1>
        <button><a href="addproduct.jsp">ADD product</a></button>
        <!--<button><a href="productpage.jsp">view products</a></button>-->
        <button><a href="http://localhost/shoppingapp/myindex.php">view products</a></button>
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
