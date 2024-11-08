<%-- 
    Document   : AdminUIDashboard
    Created on : Mar 3, 2024, 7:05:15 PM
    Author     : flywt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./css/AdminStyles.css">
        <title>Shop</title>
    </head>
    <style>
        .container-me {
            width: 70%;
            margin: 15px auto;
        }
        .img-content{
            width: 100px;
        }
    </style>
    <body>
        <%@include file="AdminUINavbar.jsp" %>
        <!-- Body section -->
        <div class='row body-section'>
            <%@include file="AdminUINavbarHoriz.jsp" %>
            <div class="col-10 right-section">
                <div class="contain-content">
                    <div class='m-2 content-admin'>
                        <div class="heading-me">
                            <div class='libre-baskerville-bold ps-4 pt-1'>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item fs-5"><a class='a-primary' href="./AdminUIDashboard.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item fs-5 active" aria-current="page">Products</li>
                                    </ol>
                                </nav>
                            </div>
                            <hr class='pad-top-0'>
                        </div>
                        <div class="row w-100 d-flex justify-content-end align-items-center">
                            <div class="col-3 mr-4">
                                <form action="productManagerController">
                                    <div class="input-group">
                                        <input name="search" id="input-search" type="text" class="form-control" placeholder="Search for Products" value = "<%= search%>">
                                        <button type="submit" name="action" value="search" class="btn btn-primary-me d-flex align-items-center text-light">Search</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row w-100 d-flex justify-content-center align-items-center">
                            <div class='col-10'>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Owner</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listP}" var="o"> <%-- Vòng lặp list sản phẩm ra --%>
                                            <tr>
                                                <td class="align-middle">${o.productId}</td>
                                                <td class="align-middle">${o.name}</td>
                                                <td class="align-middle">
                                                    <c:if test="${not empty o.images}">
                                                        <img class="img-content" src="data:image/jpeg;base64,${o.images[0].getImg()}" alt="Image" />
                                                    </c:if>
                                                </td>
                                                <td class="align-middle">${o.user.username}</td>
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
                                                <td class="align-middle text-center">
                                                    <form action="productManagerController" method="POST" id="signup-form" class="btn">
                                                        <input type="hidden" name="product_id" id="product_id" value="${o.productId}"/>
                                                        <div>
                                                            <%-- Duyệt/vô hiệu hoá sản phẩm của admin --%>
                                                            <c:if test="${sessionScope.user.getRole() == '1'}">
                                                                <c:if test="${o.status == '0'}">
                                                                    <button type="submit" name="action" value="changeStatus" class="btn btn-primary-me">Activate</button>
                                                                </c:if>

                                                                <c:if test="${o.status == '1'}">
                                                                    <button type="submit" name="action" value="changeStatus" class="btn btn-primary-me">Inactivate</button>
                                                                </c:if>
                                                            </c:if>
                                                            <%-- --%>
                                                            <a href="#editProduct"  class="btn btn-primary-me" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                            <c:if test="${sessionScope.user.getRole() == '2'}">
                                                                <c:if test="${o.status == '1'}">
                                                                    <a href="changeProductStatusController?pid=${o.productId}&status=${o.status}&action=block" type="submit" name="action" value="changeStatus" class="btn btn-primary-me">Block</a>
                                                                </c:if>

                                                                <c:if test="${o.status == '2'}">
                                                                    <a href="changeProductStatusController?pid=${o.productId}&status=${o.status}&action=unblock" type="submit" name="action" value="changeStatus" class="btn btn-primary-me">UnBlock</a>
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
                                                    <form action="addProductController" method="POST">
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
                    </div>
                </div>
            </div>
        </div>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src=
                "https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
                type="text/javascript">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <script src='./js/AdminScript.js'></script>
    </body>
</html>
