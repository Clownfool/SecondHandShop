<%-- 
    Document   : orderManager
    Created on : Aug 17, 2023, 2:20:43 AM
    Author     : Raiku
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <link href="img/favicon.png" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Manager</title>

        <link href="css/styleOrders.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div>
            <label style="margin: 2rem;" for="payment">Display Payment Method by</label>
            <select class="" id="payment">
                <option style="text-align: center;" value="all">----Display All----</option>
                <option style="text-align: center;" value="PayPal">Display all PayPal Payment Method</option>
                <option style="text-align: center;" value="Bank">Display all Bank Payment Method</option>
                <option style="text-align: center;" value="direct">Display all Direct Payment Method</option>
            </select>
            <label style="margin: 2rem;" for="status">Display Status by</label>
            <select id="status">
                <option style="text-align: center;" value="all">---Display All---</option>
                <option style="text-align: center;" value="pending">Display all pending order</option>
                <option style="text-align: center;" value="paid">Display all paid order</option>
                <option style="text-align: center;" value="processing">Display all processing order</option>
                <option style="text-align: center;" value="complete">Display all completed order</option>
            </select>
        </div>
        <div id="status-error"></div>
        <form action="OrderForShipperController" method="POST">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Buyer</th>
                        <th>Seller</th>
                        <th>Receipt Address</th>
                        <th>Delivery Address</th>
                        <th>Order Date</th>
                        <th>Total Amount</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Detail</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="table-body">
                    <c:forEach items="${sessionScope.orderList}" var="item">
                        <input type="hidden" name="order_id" value="${item.getOrderId()}">
                        <tr>
                            <td>${item.getOrderId()}</td>
                            <td>${item.getCustomer().getUsername()}</td>
                            <td>${item.getSeller().getUsername()}</td>
                            <td>${item.getCustomer().getAddress()}</td>
                            <td>${item.getSeller().getAddress()}</td>
                            <td>${item.getOrderDate()}</td>
                            <td>${item.getTotalAmount()}</td>
                            <!--Payment Method-->
                            <c:if test="${item.getPaymentMethod() == '1'}">
                                <td class="align-middle admin-role">Pay in cash</td>
                            </c:if>
                                <c:if test="${item.getPaymentMethod() == '2'}">
                                <td class="align-middle admin-role">Pay in EWallet</td>
                            </c:if>
                            <!--///////////////-->
                            <!--Status-->
                            <c:if test="${item.getStatus() == '3'}">
                                <td class="align-middle admin-role">Waiting for Delivery</td>
                            </c:if>
                            <c:if test="${item.getStatus() == '4'}">
                                <td class="align-middle admin-role">Finished</td>
                            </c:if>
                            <!--///////////////-->
                            <td><a href="OrderDetail?order_id=${item.orderId}" class="btn btn-primary" name="submit" id="view" value="view">View Detail</a></td>
                            <c:if test="${item.getStatus() == '3'}">
                                <td><a href="shipperConfirmController?order_id=${item.getOrderId()}" name="action" id="view" value="confirm">Confirm</a></td>
                            </c:if>
                            <c:if test="${item.getStatus() == '4'}">
                                <td></td>
                            </c:if>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
        </form>
        <div class="col-12 pb-1">
            <nav aria-label="Page navigation">
                <ul id="all-pages" class="pagination justify-content-center mb-3">
                    <li class="page-item disabled">
                        <button class="page-link" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </button>
                    </li>
                    <c:forEach begin="1" end="${totalOrders}" var="o">
                        <li class="page-item">
                            <button onclick="changePage(${o})" class="page-link active">${o}</button>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <button class="page-link" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </button>
                    </li>
                </ul>
            </nav>
        </div>
        <%@include file="footer.jsp" %>
        <script src="js/orderManager.js"></script>
    </body>
</html>
