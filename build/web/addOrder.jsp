<%-- 
    Document   : addProduct
    Created on : Aug 23, 2023, 4:28:18 PM
    Author     : Admin
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="dto.ShoppingCart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<%    
    ShoppingCart shoppingCart  = (ShoppingCart) session.getAttribute("ShoppingCart");
    String ship_name = shoppingCart.getUser().getName();
    String ship_mail = shoppingCart.getUser().getEmail();
    String ship_phone = shoppingCart.getUser().getPhone();
    String ship_address = shoppingCart.getUser().getAddress();
    BigDecimal total_amount = shoppingCart.totalPrice();
%>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <link href="img/favicon.ico" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="img/favicon.png" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <section class="panel panel-default">
                <div class="panel-heading"> 
                    <h3 class="panel-title">Checkout</h3> 
                </div> 
                <div class="panel-body">

                    <form action="OrderManagerController?total_amount=<%=total_amount%>" method="POST">

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Ship Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ship_name" id="ship_name" value="<%=ship_name%>" required>
                            </div>
                        </div> 

                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">Ship Mail</label>
                            <div class="col-sm-9">
                                <input type="hidden" name="ship_mail" value="<%=ship_mail%>">
                                <input type="email" class="form-control" id="ship_mail" value="<%=ship_mail%>" disabled>
                            </div>
                        </div>  
                        
                        <div class="form-group">
                            <label for="text" class="col-sm-3 control-label">Ship Phone</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ship_phone" id="ship_phone" value="<%=ship_phone%>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-3 control-label">Ship Address</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ship_address" id="ship_address" value="<%=ship_address%>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-3 control-label">Ship Fee</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="ship_fee" id="ship_fee" value="5" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-3 control-label">Discount Code</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="discount_code" id="discount_code">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="text" class="col-sm-3 control-label">Total Amount</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="total_amount" id="total_amount" value="<%=total_amount%>" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="payment_method" class="col-sm-3 control-label">Payment Method</label>
                            <div class="col-sm-9">
                                <select name="payment_method" class="form-select" aria-label="Default select example">
                                        <option value="1">Pay in cash</option>
                                        <option value="2">E-Wallet</option>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" name="submit" value="order" class="btn btn-primary">ORDER</button>
                            </div>
                        </div> 
                    </form>
                </div>
                <div id="status"></div>
            </section>
        </div> 
        <%@include file="footer.jsp" %>
        <script src="js/addProduct.js"></script>
    </body>
</html>

