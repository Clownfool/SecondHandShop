<%-- 
   Document   : cart
   Created on : Aug 7, 2023, 9:29:20 AM
   Author     : Raiku
--%>

<%@page import="DAO.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
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
        String search = (String) session.getAttribute("search");
        if (search == null || search == "") {
            search = "";
        }
    %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <script>
        $(document).ready(function () {
            $('#addProduct').on('input', '#priceInput', function () {
                var price = parseFloat($(this).val());
                var serviceFeeInput = $('#addProduct #serviceFeeInput');
                var receiveMoneyInput = $('#addProduct #receiveMoneyInput');
                if (!isNaN(price)) {
                    var serviceFee = price * 0.1; // Example: 10% of the price
                    var receiveMoney = price - serviceFee;
                    serviceFeeInput.val(serviceFee.toFixed(2));
                    receiveMoneyInput.val(receiveMoney.toFixed(2));
                }
            });
        });
        $(document).ready(function () {
            $('#editProduct').on('input', '#priceInput', function () {
                var price = parseFloat($(this).val());
                var serviceFeeInput = $('#editProduct #serviceFeeInput');
                var receiveMoneyInput = $('#editProduct #receiveMoneyInput');
                if (!isNaN(price)) {
                    var serviceFee = price * 0.1; // Example: 10% of the price
                    var receiveMoney = price - serviceFee;
                    serviceFeeInput.val(serviceFee.toFixed(2));
                    receiveMoneyInput.val(receiveMoney.toFixed(2));
                }
            });
        });
    </script>
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
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            .inactive-product {
                color: #ff0000;
            }

            .active-product {
                color: #00ff00;
            }
            .blocked-product {
                color: #0000ff;
            }
        </style>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Product Manager</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="index.jsp">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Product Manager</p>
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
                            <h2>Manage <b>Products</b></h2>
                        </div>
                        <div class="col-lg-5 col-5 text-left">
                            <form action="productManagerController">
                                <div class="input-group">
                                    <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for Products" value = "<%= search%>">
                                    <button type="submit" name="action" value="search" class="btn btn-outline-primary d-flex align-items-center" style="border: none; background: none;">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <c:if test="${sessionScope.user.getRole() == '2'}">
                            <div class="col-lg-3 col-5 text-right">
                                <a href="#addProduct"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            </div>
                        </c:if>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="align-middle">ID</th>
                            <th class="align-middle">Name</th>
                            <th class="align-middle">Image</th>  
                            <th class="align-middle">Category</th>
                            <th class="align-middle">Quantity</th>
                            <th class="align-middle">Price</th>
                            <th class="align-middle">Status</th>
                            <th class="align-middle">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o"> <%-- Vòng lặp list sản phẩm ra --%>
                            <tr>
                                <td class="align-middle">${o.productId}</td>
                                <td class="align-middle">${o.name}</td>
                                <td class="align-middle">
                                    <c:if test="${not empty o.images}">
                                        <img src="data:image/jpeg;base64,${o.images[0].getImg()}" alt="Image" />
                                    </c:if>
                                </td>
                                <td class="align-middle">${o.category.name}</td>
                                <td class="align-middle">${o.quantity}</td>
                                <td class="align-middle">${o.price} $</td>
                                <c:if test="${o.status == '0'}">
                                    <td class="align-middle inactive-product">Inactive</td>
                                </c:if>

                                <c:if test="${o.status == '1'}">
                                    <td class="align-middle active-product">Active</td>
                                </c:if>
                                <c:if test="${o.status == '2'}">
                                    <td class="align-middle blocked-product">Blocked</td>
                                </c:if>
                                <td>
                                    <form action="productManagerController" method="POST" id="signup-form" class="btn" accept-charset="UTF-8">
                                        <input type="hidden" name="product_id" id="product_id" value="${o.productId}"/>
                                        <div>
                                            <%-- Duyệt/vô hiệu hoá sản phẩm của admin --%>
                                            <c:if test="${sessionScope.user.getRole() == '1'}">
                                                <c:if test="${o.status == '0'}">
                                                    <button type="submit" name="action" value="changeStatus" class="btn btn-primary">Activate</button>
                                                </c:if>

                                                <c:if test="${o.status == '1'}">
                                                    <button type="submit" name="action" value="changeStatus" class="btn btn-primary">Inactivate</button>
                                                </c:if>
                                            </c:if>
                                            <%-- --%>
                                            <a href="#editProduct"  class="btn btn-primary" data-toggle="modal"><i style="display:flex; justify-content: center; align-items: center;" class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <c:if test="${sessionScope.user.getRole() == '2'}">
                                                    <c:if test="${o.status == '1'}">
                                                    <a href="changeProductStatusController?pid=${o.productId}&status=${o.status}&action=block" type="submit" name="action" value="changeStatus" class="btn btn-primary">Block</a>
                                                </c:if>

                                                <c:if test="${o.status == '2'}">
                                                    <a href="changeProductStatusController?pid=${o.productId}&status=${o.status}&action=unblock" type="submit" name="action" value="changeStatus" class="btn btn-primary">UnBlock</a>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            <!-- Edit Modal HTML -->
                        <div id="editProduct" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="productManagerController" method="POST">
                                        <input type="hidden" name="pid" value="${o.productId}">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edit Product</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">					
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input name="name" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input id="priceInput" name="price" type="number" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Service Fee</label>
                                                        <input id="serviceFeeInput" name="serviceFee" type="number" class="form-control" disabled>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>You Will Get</label>
                                                        <input id="receiveMoneyInput" name="receiveMoney" type="number" class="form-control" disabled>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Quality</label>
                                                <input type="number" min="0" class="form-control" name="quantity" id="quantity" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" class="form-control" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select name="category" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${sessionScope.listCC}" var="o"><%-- Vòng lặp list categories ra --%>
                                                        <option value="${o.categoryId}">${o.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" name="action" class="btn btn-success" value="Edit">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Cart End -->
                    </c:forEach>
                    </tbody>
                </table>      
                <div class="clearfix">
                    <div class="hint-text">Page <b>${tag}</b></div>
                    <ul class="pagination">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item ${tag==i?"acvive":""}"><a href="productManagerController?index=${i}" class="page-link">${i}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addProduct" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addProductController" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Images</label>
                                <input name="images" type="file" class="form-control" placeholder="Enter Image" multiple="multiple" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input id="priceInput" name="price" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Service Fee</label>
                                        <input id="serviceFeeInput" name="serviceFee" type="number" class="form-control" disabled>
                                    </div>
                                    <div class="col-md-6">
                                        <label>You Will Get</label>
                                        <input id="receiveMoneyInput" name="receiveMoney" type="number" class="form-control" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Quality</label>
                                <input type="number" min="0" class="form-control" name="quantity" id="quantity" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${sessionScope.listCC}" var="o"><%-- Vòng lặp list categories ra --%>
                                        <option value="${o.categoryId}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" name="action" class="btn btn-success" value="Add">
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
