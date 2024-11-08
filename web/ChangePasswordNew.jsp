<%-- 
    Document   : AdminUIDashboard
    Created on : Mar 3, 2024, 7:05:15 PM
    Author     : flywt
--%>
<%@page import="dto.Image"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./css/AdminStyles.css">
        <link href="img/favicon.png" rel="icon">
        <title>Shop</title>
    </head>
    <body>
        <%@include file="AdminUINavbar.jsp" %>
        <!-- Body section -->
        <div class='row body-section'>
            <%@include file="AdminUINavbarHoriz.jsp" %>
            <div class="col-10 right-section">
                <div class="contain-content">
                    <div class='m-2 content-admin'>
                        <div class="heading-me">
                            <div class='fs-4 libre-baskerville-bold ps-4 pt-1'>Change Password
                            </div>
                            <hr class='pad-top-0'>
                        </div>
                        <form action="changePasswordController" class="form-horizontal" role="form">
                            <div class="row d-flex justify-content-around">
                                <div class="col-7">
                                    <div class="row d-flex align-items-center justify-content-around mt-3">
                                        <div class="col-3">
                                            <label for="oldPassword" class="text-start fs-5 text-secondary fw-bold">Old Password</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="password" class="form-control" name="oldPassword" id="oldPassword" required>
                                        </div>
                                    </div>
                                    <div class="row d-flex align-items-center justify-content-around mt-3">
                                        <div class="col-3">
                                            <label for="newPassword" class="text-start fs-5 text-secondary fw-bold">New Password</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="password" class="form-control" name="newPassword" id="passwordChange" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" oninvalid="setCustomValidity('Password must contain at least one digit, one lowercase letter, one uppercase letter, and be at least 8 characters long.')" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                    <div class="row d-flex align-items-center justify-content-around mt-3">
                                        <div class="col-3">
                                            <label for="confirmPassword" class="text-start fs-5 text-secondary fw-bold">Confirm Password</label>
                                        </div>
                                        <div class="col-8">
                                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
                                        </div>
                                    </div>
                                    <div class="row d-flex align-items-center justify-content-end mt-3">
                                        <div class="col-2">
                                            <button name="action" value="save"  class="btn btn-primary-me text-light" type="submit">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src='./js/AdminScript.js'></script>
    </body>
</html>
