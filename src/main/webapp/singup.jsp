<%-- 
    Document   : singup
    Created on : Oct 27, 2023, 1:04:41 AM
    Author     : dkoko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>

    <style>
        form{
            background-color: pink;
        }
        label{
            margin-right: 100px;
        }
        #fname{
            margin-left: 5px;
        } 
        #lname{
            margin-left: 6px;
        }
        #gender{
            margin-left: 30px;
        }
        #email{
            margin-left: 39px;
        }
        #pnumber{
            margin-left: -20px;
        }
        #password{
            margin-left: 15px;
        }
        #address{
            margin-left: 25px;
        }
        #squestion{
            margin-left: -35px;
        }
        #answer{
            margin-left: 27px;
        }
        label, input, select{
            margin-bottom: 15px;
        }
        h1{
            text-align: center;
            color: blue;
            font-style: italic;
            font-weight: bolder;
            font-size: 35px;
        }
        form{
            width: 500px;
            border-radius: 5px;
            /* margin: auto; */
        }
        label, form, h1, button{
            text-align: center;
        }
        button{
            padding: 5px;
            color: rgb(102,255,102);
            font-weight: bold;
            border-radius: 3px;
            margin-bottom: 20px;
            margin-top: 10px;
        }
        button:hover{
            background-color: grey;
        }
        #submit{
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <form action="singup" method="post">
        <h1>SingUp</h1>
        <label for="fname">First Name</label>
        <input type="text" name="fname" id="fname"><br>

        <label for="lname">Last Name</label>
        <input type="text" name="lname" id="lname"><br>

        <label>Gender</label>
        <input type="radio" id="Male" name="gender" value="Male">
        <label for ="Male">Male</label>
        <input type="radio" id="female" name="gender" value="Female">
        <label for="female">Female</label>
        

        <label for="email">Email</label>
        <input type="email" name="email" id="email"><br>

        <label for="pnumber">Phone Number</label>
        <input type="number" name="pnumber" id="pnumber"><br>

        <label for="password">Password</label>
        <input type="password" name="password" id="password"><br>

        <label for="address">Address</label>
        <input type="text" name="address" id="address"><br>

        <label for="squestion">Security question</label>
        <select name="squestion" id="squestion"> 
            <option value="petname">Pet Name</option> 
            <option value="favorite_actor">Best Actor</option> 
            <option value="place_of_birth">Place of birth</option> 
            <option value="bestfriend">Best Friend</option> 
        </select><br>

        <label for="answer">Answer</label>
        <input type="text" name="answer" id="answer"><br>
        <button type="submit" id="submit">Create Account</button>
        <button type="button" ><a href="login.jsp">Back</a></button>
    </form>
        <footer>
        <h4>Developers</h4>
        <p>Daniel - IN13/00044/21</p>
        <p>Granton - IN13/00036/21</p>
        <p>Aoron - IN13/00030/21</p>
        <p>Ezekiah - IN13/00037/21</p>
        <p>Victor - IN13/00032/21</p>
    </footer>
</body>
</html>