<%-- 
   Document   : cart
   Created on : Aug 7, 2023, 9:29:20 AM
   Author     : Raiku
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="dto.User"%>
<%@page import="dto.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="dal.DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
// Check for success message and display alert
    String Message =(String) session.getAttribute("Message");
    if (Message != null) {
    out.println("<script>");
    out.println("alert('" + Message + "');");
    out.println("</script>");
    session.removeAttribute("Message");
    }
    DAO dao = new DAO();
    User user = (User)session.getAttribute("user");
    ShoppingCart shoppingCart = dao.getShoppingCartByUserID(user.getUserId());
    session.setAttribute("ShoppingCart", shoppingCart);
    BigDecimal totalPrice = shoppingCart.totalPrice();
%>
    <head>
        <meta charset="utf-8">
        <title>CART FASHION</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.png" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="header.jsp" %>
        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="padding: 50px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shopping Cart</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Cart Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Products</th>
                                <th>Images</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <c:set var="totalCart" scope="session" value="${0}"/>
                        <tbody id="listItemCart" class="align-middle">
                            <c:forEach items="${sessionScope.ShoppingCart.getCartItems()}" var="item">
                                <tr id="item" data-id="${item.getProduct().getProductId()}">
                                    <td class="align-middle">${item.getProduct().getName()} </td>
                                    <td class="align-middle"><img src="data:image/jpeg;base64,${item.getProduct().images[0].getImg()}" alt="Image" style="width: 200px;"></td>
                                    <td data-id="product-price${item.getProduct().getProductId()}" class="align-middle">${item.getProduct().getPrice()}</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <a href="updateQuantity?action=minus&cartItemID=${item.getCartItemId()}" class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </a>
                                            </div>
                                                <input id="cartItemQuantity" name="cartItemQuantity" min="1" max="${item.getProduct().getQuantity()}"  type="text" class="form-control form-control-sm bg-secondary text-center" value="${item.getQuantity()}" disabled>
                                            <div class="input-group-btn">
                                                <a href="updateQuantity?action=plus&cartItemID=${item.getCartItemId()}" class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <c:set var="totalCart" scope="session" value="${totalCart + item.getProduct().getPrice()*item.getQuantity()}" />
                                    <td data-id="totalPriceProduct${item.getProduct().getProductId()}" class="align-middle"><c:out value="${item.price}" /></td>
                                    <td class="align-middle"><a href="updateQuantity?action=delete&cartItemID=${item.getCartItemId()}" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div  id="addCartStatus" class="col-12 text-center" style="color: red;"> </div>
                </div>
                <div class="col-lg-4">
<!--                    <form onsubmit="return applyCoupon()" class="mb-5" action="">
                        <div class="input-group">
                            <input id="coupon" type="text" minlength="5" pattern="[0-9A-Z]+" required class="form-control p-4" placeholder="Coupon Code">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Apply Coupon</button>
                            </div>
                        </div>
                    </form>-->
                    <c:if test="${totalCart > 0}">
                        <div id="totalCart" class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                            </div>

                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">Subtotal</h6>
                                    <h6 id="totalPriceCart" class="font-weight-medium"><c:out value="${totalCart}" /></h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Ship Fee For Each Brands</h6>
                                    <h6 id="shipFees" class="font-weight-medium">10</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Orders in Cart</h6>
                                    <h6 id="shipFees" class="font-weight-medium">${sessionScope.ShoppingCart.totalQuantity()}</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Discount</h6>
                                    <h6 id="discount" style="color: red;" class="font-weight-medium">0</h6>
                                </div>
                            </div>
                            <div id="checkOutForm" class="card-footer border-secondary bg-transparent">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5 class="font-weight-bold">Total</h5>
                                    <h5 id="totalPriceCartAddShip" class="font-weight-bold"><c:out value="${totalCart+10*sessionScope.ShoppingCart.countUniqueSellers()}" /></h5>
                                </div>
                                <a href="addOrder.jsp?totalPrice=${totalCart+10*sessionScope.ShoppingCart.countUniqueSellers()}" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Cart End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-6 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p>Chuyên cung cấp các mẫu hợp thời. Không ngại bạn là ai</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Sơn Trà, Đà Nẵng</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Group4@gmail.com</p>
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

        <script src="js/main.js"></script>
        <script src="js/updateCart.js"></script>
    </body>

</html>
