<%-- 
    Document   : AdminUIDashboard
    Created on : Mar 3, 2024, 7:05:15 PM
    Author     : flywt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
// Check for success message and display alert
    String Message = (String) session.getAttribute("Message");
    if (Message != null) {
        out.println("<script>");
        out.println("alert('" + Message + "');");
        out.println("</script>");
        session.removeAttribute("Message");
    }
    String search = (String) session.getAttribute("search");
    if (search == null || search == "") {
        search = "";
    }
%>
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
        <title>Shop</title>
    </head>
    <style>
        .container-me {
            width: 70%;
            margin: 15px auto;
        }
    </style>
    <body>
        <%@include file="AdminUINavbar.jsp" %>
        <!-- Body section -->
        <div class='row body-section'>
            <%@include file="AdminUINavbarHoriz.jsp" %>
            <div class="col-10 right-section">
                <div class="contain-content">
                    <div class='m-2 content-admin'>
                        <div class="heading-me">
                            <div class='libre-baskerville-bold ps-4 pt-1'>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item fs-5"><a class='a-primary' href="./AdminUIDashboard.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item fs-5 active" aria-current="page">Accounts</li>
                                    </ol>
                                </nav>
                            </div>
                            <hr class='pad-top-0'>
                        </div>
                        <div class="row w-100 d-flex justify-content-end align-items-center">
                            <div class="col-3 mr-4">
                            <form action="AccountManagerController" method="get">
                                <div class="input-group">
                                    <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for Accounts" value = "<%= search %>">
                                    <button type="submit" name="action" value="search" class="btn btn-primary-me d-flex align-items-center text-light">Search</button>
                                </div>
                            </form>
                        </div>
                        </div>
                        <div class="row w-100 d-flex justify-content-center align-items-center">
                            <div class='col-10'>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Role</th>
                                            <th scope="col" class='text-center'>Transaction History</th>
                                            <th scope="col" class='text-center'>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.ListAllUsers}" var="item">
                                            <tr id="item" data-id="${item.getUserId()}">
                                                <th scope="row" class="align-middle">${item.getUserId()}</th>
                                                <td class="align-middle">${item.getUsername()}</td>
                                                <td class="align-middle">${item.getName()}</td>
                                                <td class="align-middle">${item.getEmail()}</td>
                                                <c:if test="${item.getRole() == '1'}">
                                                    <td class="align-middle admin-role">Admin</td>
                                                </c:if>

                                                <c:if test="${item.getRole() == '2'}">
                                                    <td class="align-middle customer-role">Customer</td>
                                                </c:if>
                                                <c:if test="${item.getRole() == '3'}">
                                                    <td class="align-middle shipper-role">Shipper</td>
                                                </c:if>
                                                <td class="align-middle text-center">
                                                    <button type='button' class='btn text-light btn-primary-me' disabled="">View</button>
                                                </td>
                                                <td class='text-center'>
                                                    <form action="AccountManagerController" method="POST" id="signup-form" class="btn">
                                                        <input type="hidden" name="user_id" id="user_id" value="${item.getUserId()}"/>
                                                        <div>
                                                            <!--<button type="submit" name="action" value="detail" class="btn btn-primary"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></button>-->
                                                            <!--<button type="submit" name="action" value="delete" class="btn btn-primary" onclick="return confirm('Are you sure to delete account: ${item.getUsername()}?')"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button>-->
                                                            <button type='submit' name="action" value="delete" class='btn text-light btn-primary-me' onclick="return confirm('Are you sure to delete account: ${item.getUsername()}?')">Delete</button>
                                                        </div>
                                                    </form></td>
                                            </tr>
                                        </c:forEach>
                                        <!--                                        <tr>
                                                                                    <th scope="row">1</th>
                                                                                    <td>Mark</td>
                                                                                    <td>Otto</td>
                                                                                    <td>@mdo</td>
                                                                                    <td class='text-center'>10</td>
                                                                                    <td class='text-center'>
                                                                                        <button type='button' class='btn text-light btn-primary-me'>View</button>
                                                                                    </td>
                                                                                    <td class='text-center'>
                                                                                        <button type='button' class='btn text-light btn-primary-me'>Delete</button>
                                                                                    </td>
                                                                                </tr>-->
                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <div class="hint-text">Page <b>${tag}</b></div>
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${endPage}" var="i">
                                            <li class="page-item ${tag==i? "acvive" : "" }"><a href="AccountManagerController?index=${i}&search=<%= search%>" class="page-link">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src=
                "https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
                type="text/javascript">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <script src='./js/AdminScript.js'></script>
    </body>
</html>
