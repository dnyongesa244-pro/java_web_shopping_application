<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }
        .div1 {
            text-align: center;
            width: 100%; 
            background-color: aqua;
            padding: 0;
        }
        h1 {
            margin: 0; 
        }
        form {
            align-items: center;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="div1">
        <h1>LOGIN</h1>
    </div>
    <form action="adminlogin" method="post">
        <table>
            <tr><td>Email</td><td><input type="text" name="txtname"></td></tr>
            <tr><td>Password</td><td><input type="password" name="txtpassword"></td></tr>
            <tr><td><input type="submit" value="Submit"></td><td><input type="reset"></td></tr>
        </table>
    </form>
    <button><a href="forgotpassword.jsp">Forgot password</button
</body>
=======
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /*  Bright Mode styles */
        .div1 {
            text-align: center;
            width: 100%;
            padding: 0;
        }
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
            background-color: #222;
        }
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
        <h1>Hello welcome admin</h1>
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
>>>>>>> e0ccbdcf54cfd31f2ffa25d8277f767a7449624a
</html>
