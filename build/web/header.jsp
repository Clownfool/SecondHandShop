<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">S</span>Fashion</h1>
            </a>
        </div>
        <div class="col-lg-5 col-5 text-left">
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
        </div>
        <c:if test="${sessionScope.user != null && sessionScope.user.getRole()=='2'}">
            <div class="col-lg-1 col-2 text-right">
                <a href="./cart.jsp" class="btn border">
                    <!-- fix này -->
                    <i class="fas fa-shopping-cart text-primary"></i> <span class="badge badge-light">${sessionScope.ShoppingCart.totalQuantity()}</span>
                </a>
            </div>
        </c:if>
    </div>

</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <c:if test="${sessionScope.user.getRole() == '2'} || ${sessionScope.user.getRole() == '1'}">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>

                <nav class="collapse navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Dresses <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">Men's Dresses</a>
                                <a href="" class="dropdown-item">Women's Dresses</a>
                                <a href="" class="dropdown-item">Baby's Dresses</a>
                            </div>
                        </div><!--
                        -->
                        <c:if test="${sessionScope.user.getRole() == '2' || sessionScope.user == null}">
                            <ul class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                                <c:forEach items="${sessionScope.listCC}" var="o">
                                    <li class="nav-item">
                                        <a href="CategoryController?cid=${o.categoryId}" class="nav-link">${o.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </div>
                </nav>
            </c:if>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="index.jsp" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1"></span>Fashion</h1>
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
            <c:if test="${sessionScope.user.getRole() == '2'} || ${sessionScope.user.getRole() == '3'}">
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
            </c:if>
        </div>
    </div>
</div>
<!-- Navbar End -->