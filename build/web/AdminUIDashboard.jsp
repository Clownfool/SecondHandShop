<%-- 
    Document   : AdminUIDashboard
    Created on : Mar 3, 2024, 7:05:15 PM
    Author     : flywt
--%>
<%@page import="dto.Image"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="./css/AdminStyles.css">
  <link href="img/favicon.png" rel="icon">
  <title>Shop</title>
</head>
    <body>
  <%@include file="AdminUINavbar.jsp" %>
  <!-- Body section -->
  <div class='row body-section'>
    <%@include file="AdminUINavbarHoriz.jsp" %>
    <div class="col-10 right-section">
      <div class="contain-content">
        <div class='m-2 content-admin'>
          <div class="heading-me">
            <div class='fs-4 libre-baskerville-bold ps-4 pt-1'>Dashboard
            </div>
            <hr class='pad-top-0'>
          </div>
          <div class="row w-100 d-flex justify-content-around">
            <div id='gotoAccounts' class="col-2 shadow-lg rounded d-flex flex-column align-items-center hover-me">
              <i class="bi bi-person text-primary-me icon-tag fw-bolder"></i>
              <div class='fw-bolder fs-3'>${admin.countCustomers()}</div>
              <div class='fs-4 fw-bold text-primary-me pb-2'>Accounts</div>
              <span class='fs-smaller p-3 border-top border-success'><span class='text-success'>1 UP</span> last 30 days</span>
            </div>
            <div id="gotoProducts" class="col-2 shadow-lg rounded d-flex flex-column align-items-center">
              <i class="bi bi-box-seam text-primary-me icon-tag fw-bolder"></i>
              <div class='fw-bolder fs-3'>${admin.countProducts()}</div>
              <div class='fs-4 fw-bold text-primary-me pb-2'>Products</div>
              <span class='fs-smaller p-3 border-top border-success'><span class='text-success'>1 UP</span> last 30 days</span>
            </div>
              <div id="gotoTransactions" class="col-2 shadow-lg rounded d-flex flex-column align-items-center">
              <i class="bi bi-currency-dollar text-primary-me icon-tag fw-bolder"></i>
              <div class='fw-bolder fs-3'>${admin.countSoldProduct()}</div>
              <div class='fs-4 fw-bold text-primary-me pb-2'>Transaction</div>
              <span class='fs-smaller p-3 border-top border-success'><span class='text-success'>1 UP</span> last 30 days</span>
            </div>
            <div class="col-2 shadow-lg rounded d-flex flex-column align-items-center">
              <i class="bi bi-clipboard2-data text-primary-me icon-tag fw-bolder"></i>
              <div class='fw-bolder fs-3'>15</div>
              <div class='fs-4 fw-bold text-primary-me pb-2'>Report</div>
              <span class='fs-smaller p-3 border-top border-success'><span class='text-success'>1 UP</span> last 30 days</span>
            </div>
          </div>
          <div class="row w-100 d-flex justify-content-around mt-5">
            <div class="container-me">
              <h2>2023</h2>
              <div>
                <canvas id="myChart"></canvas>
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
  <script>
    // Get the div element by its id
    var gotoAccountPage = document.getElementById('gotoAccounts');
    var gotoProductPage = document.getElementById('gotoProducts');
    var gotoTransactionPage = document.getElementById('gotoTransactions');
  
    // Attach a click event listener to the div
    gotoAccountPage.addEventListener('click', function() {
      // Change the window location to the desired URL
      window.location.href = 'AccountManagerController';
    });
    gotoProductPage.addEventListener('click', function() {
      // Change the window location to the desired URL
      window.location.href = 'productManagerController';
    });
    gotoTransactionPage.addEventListener('click', function() {
      // Change the window location to the desired URL
      window.location.href = 'OrderManagerForAdmin';
    });
  </script>
</body>
</html>
