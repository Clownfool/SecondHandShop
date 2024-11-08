<%@page import="dal.DAO"%>
<%@page import="dto.Category"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%
        // Check for success message and display alert
        String Message = (String) session.getAttribute("Message");
        if (Message != null) {
            out.println("<script>");
            out.println("alert('" + Message + "');");
            out.println("</script>");
            session.removeAttribute("Message");
        }
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategories();
        session.setAttribute("listCC", listC);
    %>
    <head>
        <meta charset="utf-8">
        <title>Fashion web | Buy and sell online </title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <link href="img/favicon.ico" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="img/favicon.png" rel="icon">
        <style>
            .container-img, .img-category {
                display: grid;
                grid-template-columns: repeat(auto-fill);
                grid-gap: 10px;
                align-items: center;
                justify-content: center;
                max-width: 100%;
                height: 400px;
                object-fit: contain;
            }
            .scrollable-list {
                overflow-y: auto;
                max-height: 100%;
            }
        </style>
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark" href="FAQs.jsp">FAQs</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Help</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Support</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
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
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-dark pl-2" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="index.jsp" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">S</span>Fashion</h1>
                    </a>
                </div>
            </div>

        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="index.jsp" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">S</span>Fashion</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <c:if test="${sessionScope.user.getRole() == '2' || sessionScope.user == null}">
                                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                                    <a href="shopController" class="nav-item nav-link">Shop</a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <c:if test="${sessionScope.user.getRole() == '2'}">
                                        <a href="./productManagerController" class="nav-item nav-link">Product Manager</a>
                                    </c:if>
                                    <c:if test="${sessionScope.user.getRole() == '2' || sessionScope.user.getRole() == '3'}">
                                        <a href="./OrderManagerController" class="nav-item nav-link">Order Manager</a>
                                    </c:if>
                                    <a href="./MessengerManagerController" class="nav-item nav-link">Messenger</a>
                                </c:if>
                            </div>
                            <c:if test="${sessionScope.user == null}">
                                <div class="navbar-nav ml-auto py-0">
                                    <a href="./Login.jsp" class="nav-item nav-link">Sign in</a>
                                    <a href="Register.jsp" class="nav-item nav-link">Sign up</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user != null && sessionScope.user.getRole()=='2'}">
                                <div class="col-lg-2 col-3 text-right">
                                    <a href="./cart.jsp" class="btn border">
                                        <i class="fas fa-shopping-cart text-primary"></i> <span class="badge badge-light">${sessionScope.ShoppingCart.totalQuantity()}</span>
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.user.getRole() == '1'}">
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Manager</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="AccountManagerController" class="dropdown-item">Accounts</a>
                                        <a href="CategoryManagerController" class="dropdown-item">Categories</a>
                                        <a href="productManagerController" class="dropdown-item">Products</a>
                                        <a href="DiscountManagerController" class="dropdown-item">Discounts</a>
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.user != null}">
                                <div class="nav-item dropdown">
                                    <c:if test="${sessionScope.user.getRole() == '2'|| sessionScope.user.getRole() == '3'}">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.user.getName()}</a>
                                        <div class="dropdown-menu rounded-0 m-0">
                                            <a href="profileController" class="dropdown-item">Profile</a>
                                            <c:if test="${sessionScope.user.getRole() == '2'}">
                                                <a href="OrderForSellerController" class="dropdown-item">Shop's Orders</a>
                                            </c:if>
                                            <c:if test="${sessionScope.user.getRole() == '3'}">
                                                <a href="OrderForShipperController" class="dropdown-item">Shipper's Orders</a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${sessionScope.user.getRole() == '1'}">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.user.getName()}</a>
                                            <div class="dropdown-menu rounded-0 m-0">
                                            </c:if>
                                            <a href="changePassword.jsp" class="dropdown-item">Change password</a>
                                            <a href="logout" class="dropdown-item">Logout</a>
                                        </div>
                                    </div>
                                </c:if> 
                            </div>
                    </nav>
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-1.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Dress</h3>
                                        <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-2.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                        <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-3.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">Flexible With Luxury Colors</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Quality Put Up</h3>
                                        <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="img/carousel-4.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">75% Off All Products</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Highly Appreciate Your Feeling</h3>
                                        <a href="shopController" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-5">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${listRandomC}" var="o">
                    <div class="col-lg-4 col-md-6 pb-1">
                        <div class="cat-item d-flex flex-column border mb-4 img-category" style="padding: 30px;">
                            <a href="CategoryController?cid=${o.category_id}" class="cat-img position-relative overflow-hidden mb-3">
                                <img class="img-fluid" src="${o.img}" alt="">
                            </a>
                            <h5 class="font-weight-semi-bold m-0 text-center">${o.cname}</h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Categories End -->


        <!-- Offer Start -->
        <div class="container-fluid offer pt-5">
            <div class="row px-xl-5">
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                        <img src="img/offer-1.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                            <a href="shopController" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                        <img src="img/offer-2.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                            <a href="shopController" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Offer End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Trendy Products</span></h2>
            </div>
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${listRandom}" var="o">    
                    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header container-img product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid" src="${o.img}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${o.name}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$${o.new_price}.00</h6><h6 class="text-muted ml-2"><del>$${o.old_price}.00</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="detail?pid=${o.product_id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <button id="addToCart" onclick="addToCart(${o.product_id})" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
                            </div>
                        </div>
                    </div>

                </c:forEach>
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
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Ngũ Hành Sơn, Đà Nẵng</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>sfashionfornewword@gmail.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+84 912 345 678</p>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="row">
                        <div class="col-md-6 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shopController"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
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
                        Distributed By <a href="https://www.facebook.com/choy1604/" target="_blank">GROUP 4 SE17B01</a>
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
        <script src="js/homePage.js" defer></script>
    </body>
</html>