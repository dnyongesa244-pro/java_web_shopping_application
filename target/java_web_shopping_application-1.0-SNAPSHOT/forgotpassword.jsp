<%-- 
    Document   : forgotpassword
    Created on : Oct 27, 2023, 5:25:05 PM
    Author     : dkoko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recover Password</title>
    <style>
        body {
            background-color: #ffcccc;
            font-family: 'Arial', sans-serif;
        }

        form {
            background-color: #ffe0e0;
            width: 400px;
            border-radius: 5px;
            text-align: center;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-family: 'Monotype Corsiva';
            font-size: 28px;
            color: #0029ff;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #666666;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button {
            background-color: #ababb6;
            font-family: 'Segoe UI Black';
            font-size: 18px;
            color: #66ff66;
            width: 129px;
            border: none;
            border-radius: 3px;
            padding: 5px;
            margin: 10px;
            cursor: pointer;
        }
        
        button:hover {
            background-color: #666666;
        }
    </style>
</head>
<body>
    <form action="forgotpasswordservlet" method="post" onsubmit="return validateForm()">
        <h1>Recover Password</h1>
        
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="securityQuestion">Security Question</label>
        <label for="securityQuestion">Security question</label>
        <select name="securityQuestion" id="securityQuestion">
            <option value="petname">Pet Name</option> 
            <option value="favorite_actor">Best Actor</option> 
            <option value="place_of_birth">Place of birth</option> 
            <option value="bestfriend">Best Friend</option> 
        </select><br>    

        <label for="answer">Answer</label>
        <input type="text" id="answer" name="answer" required>

        <label for="newPassword">New Password</label>
        <input type="password" id="newPassword" name="newPassword" required>

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <p id="passwordMatchError" style="color: red;"></p>

        <button type="submit">Save</button>

        <button type="button" onclick="goBack()">Back</button>
    </form>
    <script>
        function validateForm() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var passwordMatchError = document.getElementById("passwordMatchError");

            if (newPassword !== confirmPassword) {
                passwordMatchError.innerText = "Passwords do not match.";
                return false; // Prevent form submission
            } else {
                passwordMatchError.innerText = ""; // Clear the error message
                return true; // Allow form submission
            }
        }

        function goBack() {
            window.history.back();
        }
    </script>
    
</body>
</html>
