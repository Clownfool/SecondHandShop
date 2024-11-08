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
          <div class="row d-flex justify-content-around">
            <div class="col-7">
              <div class="row d-flex align-items-center justify-content-around mt-3">
                <div class="col-3">
                  <label for="inputUsername" class="text-start fs-5 text-secondary fw-bold">Username</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" id="inputUsername" value="${admin.username}" placeholder="Enter...">
                </div>
              </div>
              <div class="row d-flex align-items-center justify-content-around mt-3">
                <div class="col-3">
                  <label for="inputName" class="text-start fs-5 text-secondary fw-bold">Name</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" id="inputName" value="${admin.name}" placeholder="Enter...">
                </div>
              </div>
              <div class="row d-flex align-items-center justify-content-around mt-3">
                <div class="col-3">
                  <label for="inputEmail" class="text-start fs-5 text-secondary fw-bold">Email</label>
                </div>
                <div class="col-8">
                    <input type="email" class="form-control" id="inputEmail" value="${admin.email}" placeholder="Enter...">
                </div>
              </div>
              <div class="row d-flex align-items-center justify-content-around mt-3">
                <div class="col-3">
                  <label for="inputNumber" class="text-start fs-5 text-secondary fw-bold">Number</label>
                </div>
                <div class="col-8">
                    <input type="number" class="form-control" id="inputNumber" value="0123456789" placeholder="Enter...">
                </div>
              </div>
              <div class="row d-flex align-items-center justify-content-around mt-3">
                <div class="col-3">
                  <label for="inputNumber" class="text-start fs-5 text-secondary fw-bold">Gender</label>
                </div>
                <div class="col-8">
                  <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" checked="" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                    <label class="form-check-label fs-6 fw-bold" for="inlineRadio1">Male</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                    <label class="form-check-label fs-6 fw-bold" for="inlineRadio2">Female</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                    <label class="form-check-label fs-6 fw-bold" for="inlineRadio3">Other</label>
                  </div>
                </div>
              </div>
              <div class="row d-flex align-items-center justify-content-around mt-3">
                <div class="col-3">
                  <label for="inputNumber" class="text-start fs-5 text-secondary fw-bold">Date of birth</label>
                </div>
                <div class="col-8">
                    <input type="date" class="form-control" id="inputNumber" value="3/11/2000" placeholder="Enter...">
                </div>
              </div>
              <div class="row d-flex align-items-center justify-content-end mt-3">
                <div class="col-2">
                  <button class="btn btn-primary-me text-light" type="submit">Save</button>
                </div>
              </div>
            </div>
            <div class="col-3 d-flex flex-column justify-content-center align-items-center">
              <img src="./img/avatar.jpg" class="rounded mx-auto d-block" alt="..." width='200'>
              <div class='mt-3 w-50'>
                <button type="button" class="btn btn-outline-primary-me">Change avatar</button>
              </div>
              <span class='fs-5 text-secondary text-center mt-3'>
                Dụng lượng file tối đa 1 MB
                Định dạng:.JPEG, .PNG
                </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <script src='./js/AdminScript.js'></script>
</body>
</html>
