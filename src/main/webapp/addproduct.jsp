<%-- 
    Document   : addproduct
    Created on : Oct 27, 2023, 11:53:25 AM
    Author     : dkoko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post products</title>
    <style>
        form{
            background-color: pink;
            width: 500px;
            border-radius: 5px;
            text-align: center;
        }
        label{
            margin-right: 80px;
        }  
        label, input{
            margin-bottom: 15px;
        }
        #quantity{
            margin-left: 35px;
        }
        #price{
            margin-left: 57px;
        }
        #pid{
            margin-left: 20px;
        }
        h1{
            text-align: center;
            color: blue;
            font-style: italic;
            font-weight: bolder;
            font-size: 35px;
        }

        button{
            padding: 5px;
            color: rgb(102,255,102);
            width: 80px;
            font-weight: bold;
            font-size: 20px;
            border-radius: 3px;
            margin-bottom: 20px;
            margin-top: 10px;
        }
        button:hover{
            background-color: grey;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form action="addproductservlet" method="post">
        <h1>Enter Product Details</h1>
        <label for="productname">Product Name</label>
        <input type="text" name="productname" id="Productname"><br>

        <label for="quantity">Quantity</label>
        <input type="number" name="quantity" id="quantity"><br>

        <label for="price">Price</label>
        <input type="number" name="price" id="price"><br>
        
        <label for="productid">Price id</label>
        <input type="number" name="id" placeholder="product will be given a random id" readonly style="width: fit-content"><br>
        <button type="submit" id="submit">ADD</button>
    </form>
    <button><a href="homepage.jsp">Back</a></button>
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
