<%-- 
    Document   : AdminUIDashboard
    Created on : Mar 3, 2024, 7:05:15 PM
    Author     : flywt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        .img-content{
            width: 100px;
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
                                        <li class="breadcrumb-item fs-5 active" aria-current="page">Transactions</li>
                                    </ol>
                                </nav>
                            </div>
                            <hr class='pad-top-0'>
                        </div>
                        <div class="row w-100 d-flex justify-content-center align-items-center">
                            <div class='col-10'>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Customer</th>
                                            <th scope="col">Seller</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Total Amount</th>
                                            <th scope="col">Payment Method</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.orderList}" var="item"> <%-- Vòng lặp list sản phẩm ra --%>
                                            <tr>
                                                <td class="align-middle">${item.getOrderId()}</td>
                                                <td class="align-middle">${item.orderId}</td>
                                                <td class="align-middle">${item.getCustomer().getUsername()}</td>
                                                <td class="align-middle">${item.getSeller().getUsername()}</td>
                                                <c:set var="dateString" value="${item.getOrderDate()}" />
                                                <c:set var="shortDate" value="${fn:substring(dateString, 0, 10)}" />
                                                <td class="align-middle"><c:out value="${shortDate}" /></td>
                                                <td class="align-middle">${item.getTotalAmount()}</td>
                                                <c:if test="${item.getPaymentMethod() == '1'}">
                                                    <td class="align-middle">Pay in Cash</td>
                                                </c:if>
                                                <c:if test="${item.getPaymentMethod() == '2'}">
                                                    <td class="align-middle">E-Wallet</td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
