<%-- 
    Document   : AdminUIDashboard
    Created on : Mar 3, 2024, 7:05:15 PM
    Author     : flywt
--%>
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
            <div class='fs-4 libre-baskerville-bold ps-4 pt-1'>Setting
            </div>
            <hr class='pad-top-0'>
          </div>
          <div class="accordion" id="accordionPanelsStayOpenExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                  <span class='text-primary-me fw-bold'>Slide Banner</span>
                </button>
              </h2>
              <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                <div class="accordion-body p-0">
                  <!-- Body Slider  -->
                  <div class="accordion" id="accordionInsideSlider">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-slider1">
                          <button class="accordion-button bg-cl-primary-me text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-sliderCol1" aria-expanded="true" aria-controls="panelsStayOpen-sliderCol1">
                            <span class='text-primary-me fw-bold text-light'>Slider 1</span>
                          </button>
                      </h2>
                      <div id="panelsStayOpen-sliderCol1" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                        <div class="accordion-body">
                          <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                        </div>
                      </div>
                    </div>
                    <div class='accordion' style='background-color: #ccc;'>
                      <h2 class="accordion-header fs-5 text-primary-me ps-3 py-2 fw-bold">
                        <i class="bi bi-plus-square"></i>
                        Create
                      </h2>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                  <span class='text-primary-me fw-bold'>FAQs</span>
                </button>
              </h2>
              <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                <div class="accordion-body p-0">
                  <!-- Body FAQs  -->
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="panelsStayOpen-q1">
                        <button class="accordion-button bg-cl-primary-me text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapsedQ1" aria-expanded="true" aria-controls="panelsStayOpen-collapsedQ1">
                          <span class='text-primary-me fw-bold text-light'>Question 1</span>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapsedQ1" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-q1">
                      <div class="accordion-body">
                        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                  <span class='text-primary-me fw-bold'>News</span>
                </button>
              </h2>
              <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                <div class="accordion-body p-0">
                  <!-- Body News  -->
                  <div class="accordion-item">
                    <h2 class="accordion-header" id="panelsStayOpen-n1">
                        <button class="accordion-button bg-cl-primary-me text-light collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapsedN1" aria-expanded="true" aria-controls="panelsStayOpen-collapsedN1">
                          <span class='text-primary-me fw-bold text-light'>News 1</span>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapsedN1" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-n1">
                      <div class="accordion-body">
                        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
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
