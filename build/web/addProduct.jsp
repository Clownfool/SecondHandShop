<%-- 
    Document   : addProduct
    Created on : Aug 23, 2023, 4:28:18 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/favicon.png" rel="icon">
        <title>Add Product</title>
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <section class="panel panel-default">
                <div class="panel-heading"> 
                    <h3 class="panel-title">Add product</h3> 
                </div> 
                <div class="panel-body">

                    <form action="productManagerController" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Seller ID</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="sellerId" id="sellerId" placeholder="${sessionScope.user.getUserId()}" disabled>
                            </div>
                        </div> 

                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Product Name</label>
                            <div class="col-sm-9">
                                <label class="control-label small">Product Name:</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="Product name" required>
                            </div>
                        </div>  
                        
                        <div class="form-group">
                            <label for="description" class="col-sm-3 control-label">Product Description</label>
                            <div class="col-sm-9">
                                <label class="control-label small">Description:</label>
                                <textarea name="description" id="description" class="form-control"></textarea>
                            </div>
                        </div> 

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Quantity</label>
                            <div class="col-sm-9"> 
                                <label class="control-label small">Quantity:</label>
                                <input type="number" min="0" class="form-control" name="quantity" id="quantity" placeholder="Quantity" required>
                            </div>     
                        </div> 

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Price</label>
                            <div class="col-sm-9"> 
                                <label class="control-label small">Price:</label>
                                <input type="number" min="0" class="form-control" name="price" id="price" placeholder="Price" required>
                            </div>     
                        </div> 
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Image</label>
                            <div class="col-sm-9">
                                <label class="control-label small">Image:</label>
                                <input name="images" type="file" class="form-control" placeholder="Enter Image" multiple required>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label for="category" class="col-sm-3 control-label">Product Category</label>
                            <div class="col-sm-3">
                                <label class="control-label small">Category:</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${sessionScope.listCC}" var="o">
                                        <option value="${o.categoryId}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-primary">ADD PRODUCT</button>
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

