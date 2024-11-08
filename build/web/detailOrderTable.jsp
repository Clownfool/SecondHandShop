<%-- 
    Document   : shop
    Created on : Aug 7, 2023, 9:28:38 AM
    Author     : Raiku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fashion web | View shop for details</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <link href="img/favicon.png" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <style>
            .product-img {
                height: 320px;
                overflow: hidden;
            }
            .product-img img {
                width: 100%;
                height: auto;
                max-height: 100%;

            }
            li {
                list-style: none;
            }
            a.active {
                color: #533f03;
                font-weight: bold;
            }

        </style>    
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="header.jsp" %>


        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>View <b>Order</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="detailOrderTable">
                <div class="modal-dialog-centered">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">View Order</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Order ID</label>
                                    <input value="${detail.orderId}" name="orderId" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Ship Name</label>
                                    <input value="${detail.shipName}" name="shipName" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Ship Mail</label>
                                    <input value="${detail.shipMail}" name="shipMail" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Ship Phone</label>
                                    <input value="${detail.shipPhone}" name="shipPhone" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Ship Address</label>
                                    <input value="${detail.shipAddress}" name="shipAddress" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Order Date</label>
                                    <input value="${detail.orderDate}" name="orderDate" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Ship Fee</label>
                                    <input value="${detail.shipFee}" name="shipFee" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Discount</label>
                                    <input value="${detail.discount.getCode()}" name="discount" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Total Amount</label>
                                    <input value="${detail.totalAmount}" name="totalAmount" type="text" class="form-control" readonly required>
                                </div>
                                <!--Payment Method-->
                                <div class="form-group">
                                    <label>Payment Method</label>
                                    <c:if test="${detail.paymentMethod == '1'}">
                                        <input value="Pay In Cash" name="paymentMethod" type="text" class="form-control" readonly required>
                                    </c:if>
                                    <c:if test="${detail.paymentMethod == '2'}">
                                        <input value="E-Wallet" name="paymentMethod" type="text" class="form-control" readonly required>
                                    </c:if>
                                </div>
                                <!--/Payment Method-->
                                <!--Status-->
                                <div class="form-group">
                                    <label>Status</label>
                                    <c:if test="${detail.status == '1'}">
                                        <input value="Wating for Confirmation" name="paymentMethod" type="text" class="form-control" readonly required>
                                    </c:if>
                                    <c:if test="${detail.status == '2'}">
                                        <input value="Wating for Shipper" name="paymentMethod" type="text" class="form-control" readonly required>
                                    </c:if>
                                    <c:if test="${detail.status == '3'}">
                                        <input value="Wating for Delivery" name="paymentMethod" type="text" class="form-control" readonly required>
                                    </c:if>
                                </div>
                                <!--/Status-->
                                <div class="form-group">
                                    <label>Customer</label>
                                    <input value="${detail.customer.getUsername()}" name="customer" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Seller</label>
                                    <input value="${detail.seller.getUsername()}" name="seller" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Shipper</label>
                                    <input value="${detail.shipper.getUsername()}" name="shipper" type="text" class="form-control" readonly required>
                                </div>
                                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="align-middle">Name</th>
                            <th class="align-middle">Image</th>
                            <th class="align-middle">Quantity</th>
                            <th class="align-middle">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${detail.orderItems}" var="o">
                            <tr>
                                <td class="align-middle">${o.getProduct().name}</td>
                                <td class="align-middle">
                                    <c:if test="${not empty o.getProduct().images}">
                                        <img src="data:image/jpeg;base64,${o.getProduct().images[0].getImg()}" alt="Image" />
                                    </c:if>
                                </td>
                                <td class="align-middle">${o.quantity}</td>
                                <td class="align-middle">${o.price} $</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table> 

                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-6 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p>Chuyên cung cấp các mẫu hợp thời. Không ngại bạn là ai</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Quy Nhơn, Bình Định</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Group2@gmail.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+84 8147 4189</p>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="row">
                        <div class="col-md-6 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-6 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">New Subcribe</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">fashion.com</a>
                        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com"></a><br>
                        Distributed By <a href="https://www.facebook.com/hello.trungkien2711/" target="_blank">GROUP 2 SE17B02</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/addToCart.js"></script>
    </body>

</html>
