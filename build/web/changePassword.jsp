<%-- 
    Document   : addProduct
    Created on : Aug 23, 2023, 4:28:18 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <link href="img/favicon.png" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <section class="panel panel-default">
                <div class="panel-heading"> 
                    <h3 class="panel-title">Profile</h3> 
                </div> 
                <div class="panel-body">
                    <form action="changePasswordController" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"> Old Password</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="oldPassword" id="password" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">New Password</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="newPassword" id="passwordChange" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" oninvalid="setCustomValidity('Password must contain at least one digit, one lowercase letter, one uppercase letter, and be at least 8 characters long.')" oninput="setCustomValidity('')">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Confirm Password</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
                            </div>
                        </div>
                                <div class="col-sm-offset-3 col-sm-9">
                                    <p class="text-danger" style="font-size: 10px;">
                                        ${message}
                                    </p>
                                </div>
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" name="action" value="save" class="btn btn-primary">Change</button>
                                <a href ="index.jsp" class="btn btn-primary">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div id="status"></div>
            </section>
        </div> 
        <%@include file="footer.jsp" %>
        <script src="js/addProduct.js"></script>
    </body>
</html>

