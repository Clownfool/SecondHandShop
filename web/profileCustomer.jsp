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
                <div>
                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                            <span class="font-weight-bold">${sessionScope.user.getUsername()}</span>
                            <span class="text-black-50">${sessionScope.user.getEmail()}</span><span> </span></div>
                    </div>
                </div>
                
                <div class="panel-body col-md-8">
                    <form action="profileController" method="POST" class="form-horizontal" role="form" accept-charset="UTF-8">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Username</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="username" id="usernameDisplay" value="${sessionScope.user.getUsername()}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="email" id="email" placeholder="${sessionScope.user.getEmail()}" disabled>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="customerName" id="customerName" placeholder="${sessionScope.user.getName()}" ${statusSave}>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Phone Number</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="${sessionScope.user.getPhone()}" ${statusSave} pattern="^\d{10}$|^(\d{3})[- ]?\d{3}[- ]?\d{4}$" oninvalid="setCustomValidity('the phone number must be exactly 10 digits for the format 1234567890 or 123-456-7890.')" oninput="setCustomValidity('')">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Address</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="address" id="address" placeholder="${sessionScope.user.getAddress()}" ${statusSave}>
                            </div>
                        </div>

                        <hr>
                        <div class="form-group">
                            <c:if test="${sessionScope.changePassword==false}">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <p class="text-danger" style="font-size: 10px;">
                                        ${message}
                                    </p>
                                </div>
                            </c:if>
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" name="action" value="save" class="btn btn-primary" ${statusSave}>SAVE</button>
                                <button type="submit" name="action" value="edit" class="btn btn-primary" ${statusEdit} >Edit</button>
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