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
                width: 100%;
                border-radius: 10px;
                /* Add any additional styles as needed */
            }
            
            .fa-angle-right:before, .fa-angle-left:before{
                color: white;
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
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <%
                                List<Image> images = (List<Image>) session.getAttribute("images"); // Assuming `detail.getImages()` returns the list of images
                                for (int index = 0; index < images.size(); index++) {
                                    Image image = images.get(index);

                                    // Determine if the carousel item should be active
                                    String activeClass = (index == 0) ? "active" : "";

                                    String imageSource = image.getImg(); // Assuming `getImg()` retrieves the image source

                                    // Generate the carousel item HTML code
                                    String carouselItem = String.format(
                                            "<div class=\"carousel-item %s\">\n"
                                            + "    <img class=\"centered-image\" src=\"data:image/jpeg;base64,%s\" alt=\"Image\" />\n"
                                            + "</div>",
                                            activeClass, imageSource
                                    );

                                    // Print or do something with the carousel item
                                    out.println(carouselItem);
                                }
                            %>
                            <!--
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="img/product-2.jpg" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="img/product-3.jpg" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="img/product-4.jpg" alt="Image">
                            </div>
                            -->
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold">${detail.name}</h3>
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
                        <small class="pt-1">(${detail.countReviews()} Reviews)</small>
                    </div>
                        <h3>Price: ${detail.price}00 <u>đ</u></h3>
                    <p class="mb-4">Please scroll down to see more descriptions, and click "Add to cart" to order.</p>
                    <form action="addtoCart">
                        <input  type="hidden" name="pid" value="${detail.productId}">
                        <div class="d-flex align-items-center mb-4 pt-2">
                            <div class="input-group quantity mr-3" style="width: 130px;">
                                <input id="cartItemQuantity" name="quantity" min="1" max="${detail.getQuantity()}"  type="number" class="form-control form-control-sm bg-secondary text-center" required>
                            </div>
                            <button type="submit" id="addToCart"  class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
                        </div>
                    </form>
                    <div class="d-flex pt-2">
                        <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                        <div class="d-inline-flex">
                            <a class="text-dark px-2" href="" title="Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-dark px-2" href="" title="Twitter">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-dark px-2" href="" title="Linked in">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-dark px-2" href="" title="Pinterest">
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                    <div  id="addCartStatus" class="col-12 text-center" style="color: red;"> </div>
                </div>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${detail.countReviews()})</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Product Description</h4>
                            <p>${detail.description} </p>
                            <!--<p>Tiện nghi thứ 2 ko ai chủ nhật</p> -->
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Additional Information</h4>
                            <p>Was distributed by Group 4 SE17B01 FPTU </p>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="media mb-4">
                                        <img src="img/user-2.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                        <div class="media-body">
                                            <h6>${detail.user.getUsername()}</h6>
                                        </div>
                                        <ul>
                                            <li>
                                                <a href="ShopDetailController?uid=${detail.user.userId}" >Watch Shop</a>
                                            </li>
                                            <li>
                                                <a href="ShopDetailController?uid=${detail.user.userId}" >Chat</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Rating and Review begin -->
                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">Review</h4>
                                    <c:forEach items="${reviewList}" var="item"><%-- Vòng lặp list tất cả reviews của sản phẩm --%>
                                        <div class="media mb-4">
                                            <img src="img/user-2.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                            <div class="media-body">
                                                <h6>${item.user.getUsername()}<small> - <i>${item.date}</i></small></h6>
                                                <div class="text-primary mb-2">
                                                    <c:if test="${item.rating == 0.5}">
                                                        <i class="fas fa-star-half-alt"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 1}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 1.5}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star-half-alt"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 2}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 2.5}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star-half-alt"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 3}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 3.5}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star-half-alt"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 4}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="far fa-star"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 4.5}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star-half-alt"></i>
                                                    </c:if>
                                                    <c:if test="${item.rating == 5}">
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </c:if>
                                                </div>
                                                <p>${item.comment}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="col-md-6">
                                    <%--Feedback--%>
                                    <form action="AddReviews">
                                        <input type="hidden" name="productId" value="${detail.productId}">
                                        <h4 class="mb-4">Leave a review</h4>
                                        <small>Your email address will not be published. Required fields are marked *</small>
                                        <div class="d-flex my-3">
                                            <p class="mb-0 mr-2">Your Rating * :</p>
                                            <div id="text-primary">
                                                <input type="radio" id="star5" name="rating" value="5" />
                                                <label class = "full" for="star5" title="Awesome - 5 stars"></label>

                                                <input type="radio" id="star4half" name="rating" value="4.5" />
                                                <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>

                                                <input type="radio" id="star4" name="rating" value="4" />
                                                <label class = "full" for="star4" title="Pretty good - 4 stars"></label>

                                                <input type="radio" id="star3half" name="rating" value="3.5" />
                                                <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                                <input type="radio" id="star3" name="rating" value="3" />
                                                <label class = "full" for="star3" title="Meh - 3 stars"></label>

                                                <input type="radio" id="star2half" name="rating" value="2.5" />
                                                <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>

                                                <input type="radio" id="star2" name="rating" value="2" />
                                                <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>

                                                <input type="radio" id="star1half" name="rating" value="1.5" />
                                                <label class="half" for="star1half" title="Meh - 1.5 stars"></label>

                                                <input type="radio" id="star1" name="rating" value="1" />
                                                <label class = "full" for="star1" title="Sucks big time - 1 star"></label>

                                                <input type="radio" id="starhalf" name="rating" value="0.5" />
                                                <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="message">Your Review *</label>
                                            <textarea name="comment" id="comment" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group mb-0">
                                            <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
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
                                </div>

                                <div class="card-footer d-flex justify-content-between bg-light border">
                                    <a href="detail?pid=${o.productId}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                    <button id="addToCart" onclick="addToCart(${o.productId})" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
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
