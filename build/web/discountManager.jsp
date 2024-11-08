<%-- 
   Document   : cart
   Created on : Aug 7, 2023, 9:29:20 AM
   Author     : Raiku
--%>

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
    String search =(String) session.getAttribute("search");
    if (search == null || search =="") {
        search="";
    }
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
        
        <!-- Others -->
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <%@include file="header.jsp" %>
        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Discounts Manager</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Discounts Manager</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Cart Start -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-lg-4 d-none d-lg-block">
                            <h2>Manage <b>Discounts</b></h2>
                        </div>
                        <div class="col-lg-5 col-5 text-left">
                            <form action="DiscountManagerController" method="get">
                                <div class="input-group">
                                    <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for Discounts" value = "<%= search %>">
                                    <button type="submit" name="action" value="search" class="btn btn-outline-primary d-flex align-items-center" style="border: none; background: none;">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-3 col-5 text-right">
                            <a href="#addDiscount"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Discount</span></a>
                        </div>
                    </div>
                </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Code</th>
                                <th>Discount Percent</th>
                                <th>Valid From</th>
                                <th>Valid To</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="listCustomer" class="align-middle">
                            <c:forEach items="${sessionScope.ListAllDiscounts}" var="item">
                                <tr id="item" data-id="${item.getId()}">
                                    <td class="align-middle">${item.getId()}</td>
                                    <td class="align-middle">${item.getCode()}</td>
                                    <td class="align-middle">${item.getDiscountPercent()}%</td>
                                    <td class="align-middle">${item.getValidFrom()}</td>
                                    <td class="align-middle">${item.getValidTo()}</td>
                                    <td class="align-middle">
                                <form action="DiscountManagerController" method="POST" id="signup-form" class="btn">
                                        <input type="hidden" name="discount_id" id="discount_id" value="${item.getId()}"/>
                                        <div>
                                        <button type="submit" name="action" value="delete" class="btn btn-primary" onclick="return confirm('Are you sure to delete category ${item.getCode()}?')"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button>
                                    </div>
                                </form></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                <div class="clearfix">
                    <div class="hint-text">Page <b>${tag}</b></div>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item ${tag==i? "acvive" : "" }"><a href="DiscountManagerController?index=${i}&search=<%= search %>" class="page-link">${i}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addDiscount" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="DiscountManagerController" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Discounts</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Code</label>
                                <input name="code" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Discount Percent</label> <br/>
                                <input name="discountPercent" type="number" min="0" max="100" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Valid From</label>
                                <input name="validFrom" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Valid To</label>
                                <input type="date" class="form-control" name="validTo" id="validTo" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
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

        <script src="js/main.js"></script>
        <script src="js/updateCart.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>

</html>
