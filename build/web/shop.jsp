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

        <link href="img/favicon.ico" rel="icon">
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


        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2"> - </p>
                    <p class="m-0 active"><a href="#"><strong>Shop</strong></a></p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-12">
                    <!-- Price Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                   <form action="FilterByPriceController" method="POST">
    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
        <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'all'}">checked</c:if> name="price" id="price-all" value="all">
        <label class="custom-control-label" for="price-all">All Price</label>
    </div>
    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
        <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below100' }">checked</c:if>  name="price" id="price-1" value="below100">
        <label class="custom-control-label" for="price-1">$0 - $100</label>
    </div>
    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
        <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below200' }">checked</c:if>  name="price" id="price-2" value="below200">
        <label class="custom-control-label" for="price-2">$100 - $200</label>
    </div>
    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
        <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below300' }">checked</c:if>  name="price" id="price-3" value="below300">
        <label class="custom-control-label" for="price-3">$200 - $300</label>
    </div>
    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
        <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below400' }">checked</c:if>  name="price" id="price-4" value="below400">
        <label class="custom-control-label" for="price-4">$300 - $400</label>
    </div>
    <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
        <input type="radio" class="custom-control-input" <c:if test="${priceRange eq 'below500' }">checked</c:if>  name="price" id="price-5" value="below500">
        <label class="custom-control-label" for="price-5">$400 - $500</label>
    </div>
    <div class="custom-control custom-radio d-flex align-items-center justify-content-end">
        <button style="background-color: #D19C97; border: none; padding: 10px 20px; border-radius: 5px;">Submit</button>
    </div>
</form>

                    </div>
                    <!-- Price End -->
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <form action="shopController" method="GET">
                                    <div class="input-group">
                                        <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for products">
                                        <button class="btn btn-outline-primary d-flex align-items-center" style="border: none; background: none;">
                                            <span class="input-group-text bg-transparent text-primary">
                                                <i class="fa fa-search"></i>
                                            </span>
                                        </button>
                                    </div>

                                </form>
                                <div class="dropdown ml-4">
                                    <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        Sort by
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
<<<<<<< HEAD
                                        <a class="dropdown-item" href="shopController?action=lowest">min to max</a>
                                        <a class="dropdown-item" href="shopController?action=highest">max to min</a>
=======
                                        <a class="dropdown-item" href="SearchProduct?action=highest">Top</a>
                                        <a class="dropdown-item" href="SearchProduct?action=lowest">Popularity</a>
>>>>>>> 5a7e33f8c12d1efdd28c922f5d74c04f69f6d764
                                       
                                </div>
                            </div>
                        </div>
                            <div style="
                                    display: flex;
                                    flex-wrap: wrap;
                                                     ">
                        <c:forEach items="${listP}" var="o">
                            
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="${o.image}" alt="">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h5 class="text-truncate mb-3">${o.name}</h5>
                                        <div class="d-flex justify-content-center">
                                            <h6>${o.price}00<u>đ</u></h6>
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

                        <div class="col-12 pb-1">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mb-3">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <!--
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    -->
                                    <c:forEach begin="1" end="${endPage}" var="o">
                                        <li class="page-item">
                                            <a href="shop?index=${o}" class="page-link ${tag==o?"active":""}">${o}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->


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
