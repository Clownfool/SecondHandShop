<%-- 
    Document   : detail
    Created on : Aug 7, 2023, 9:30:29 AM
    Author     : Raiku
--%>

<%@page import="dto.Image"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fasion web | Details for each product</title>
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
            .centered-image {
                display: block;
                margin-left: auto;
                margin-right: auto;
                /* Add any additional styles as needed */
            }
        </style>    
        <link rel="stylesheet" href="css/ratingstar.css"/>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/ratingstar.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="header.jsp" %>

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Product Detail</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Product Detail</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Detail Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div class="flex item-name mb-6">
                        <img src="img/user-2.jpg" alt="Image" class="img-fluid mr-3 mt-1 rounded-full" style="width: 300px;">
                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold"><strong>${detail.username}</strong></h3>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <c:if test="${detail.averageReviews() == 0}">
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 0 && detail.averageReviews() <= 0.75}">
                                <small class="fas fa-star-half-alt"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 0.75 && detail.averageReviews() <= 1.25}">
                                <small class="fas fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 1.25 && detail.averageReviews() <= 1.75}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star-half-alt"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 1.75 && detail.averageReviews() <= 2.25}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 2.25 && detail.averageReviews() <= 2.75}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star-half-alt"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 2.75 && detail.averageReviews() <= 3.25}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="far fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 3.25 && detail.averageReviews() <= 3.75}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star-half-alt"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 3.75 && detail.averageReviews() <= 4.25}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="far fa-star"></small>
                            </c:if>
                            <c:if test="${detail.averageReviews() > 4.25 && detail.averageReviews() <= 4.75}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star-half-alt"></small>
                            </c:if>
                                <c:if test="${detail.averageReviews() > 4.75 && detail.averageReviews() <= 5}">
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                                <small class="fas fa-star"></small>
                            </c:if>
                        </div>
                        <small class="pt-1">(detail.countReviews()} Reviews)</small>
                    </div>
                    <h5>On Sale: ${detail.countProducts()}</h5> <h5>Sold: ${detail.countSoldProduct()}</h5>
                    <a href="ChatboxController?uid=${detail.userId}" class="btn btn-primary" type="submit">Chat</a>
                    <p class="mb-4">Please scroll down to see more products.</p>
                    <div class="d-flex pt-2">
                        <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                        <div class="d-inline-flex">
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Products</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Products</h4>
                            <div class="col-lg-12 col-md-12">
                                <div class="row pb-3">
                                    <c:forEach items="${listP}" var="o"> 
                                        <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                            <div class="card product-item border-0 mb-4">
                                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                    <img class="img-fluid w-100" src="data:image/jpeg;base64,${o.images[0].getImg()}" alt="">
                                                </div>
                                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                                    <h5 class="text-truncate mb-3">${o.name}</h5>
                                                    <div class="d-flex justify-content-center">
                                                        <h6>$${o.price}</h6>
                                                    </div>
                                                    <div class="d-flex justify-content-center">
                                                        <a href="ShopDetailController?uid=${o.user.userId}" class="btn btn-sm text-dark p-0"><h6>${o.user.username}</h6></a>
                                                    </div>
                                                </div>
                                                <div class="card-footer d-flex justify-content-between bg-light border">
                                                    <a href="DetailProductController?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                                    <a href="addtoCart?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                                </div>
                                            </div>
                                        </div> 
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="hint-text">Page <b>${tag}</b></div>
                            <ul class="pagination">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${tag==i?"acvive":""}"><a href="ShopDetailController?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- Rating and Review End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Detail End -->


        <!-- Products Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel related-carousel">
                        <c:forEach items="${listRandom}" var="o">    
                            <div class="card product-item border-0">
                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img src="data:image/jpeg;base64,${o.images[0].getImg()}" alt="Image" />
                                </div>

                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                    <h6 class="text-truncate mb-3">${o.name}</h6>
                                    <div class="d-flex justify-content-center">
                                        <h6>$${o.price}</h6>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <a href="ShopDetailController?uid=${o.user.userId}" class="btn btn-sm text-dark p-0"><h6>${o.user.username}</h6></a>
                                    </div>
                                </div>

                                <div class="card-footer d-flex justify-content-between bg-light border">
                                    <a href="DetailProductController?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                    <a href="addtoCart?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                </div>
                            </div>

                        </c:forEach>
                        <div  id="addCartStatus" class="col-12 text-center" style="color: red;"> </div>
                    </div>
                </div>
            </div>
            <div  id="addCartStatus" class="col-12 text-center" style="color: red;"> </div>
        </div>
        <!-- Products End -->

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
