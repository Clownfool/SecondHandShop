
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>FAQs</title>
        <link href="css/FAQstyle.css" rel="stylesheet">
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
                /* Add any additional styles as needed */
            }
        </style>    
        <link rel="stylesheet" href="css/ratingstar.css"/>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/ratingstar.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header1.jsp" %>

        <h2>Accordion</h2>

        <button class="accordion">What if an item is unavailable?</button>
        <div class="panel">
            <p>
                If an item or size you have selected is not available for purchase on ShopOnline, you can locate it at one of two store in <a href="contact.jsp" ><b>the contact</b></a>
            </p>
        </div>

        <button class="accordion">I have not been confirmed after placing the order</button>
        <div class="panel">
            <p>We will send you an email to confirm that you have ordered the item.</p>
            <p>Please take the initiative to call us via phone number: <b>+84(0) 0123 456 789</b> or contact us via <a href="https://www.facebook.com/thuthuy1911.vn" ><b>Facebook</b></a></p>
        </div>

        <button class="accordion">How to order online in this web?</button>
        <div class="panel">
            <p>Step 1: Chose the item you want to buy in <a href="shop.jsp" ><b>Our Shop.</b></a></p>
            <p>Step 2: View the details of item by click in the <b>"View Detail"</b> right down the price.</p>
            <p>Step 3: Add the item to cart by click in the<b>"Add To Cart"</b>.</p>
            <p>Step 4: Check your item in the <a href="cart.jsp" ><b>Shopping Cart</b></a> and pay the check</p>
        </div>

        <button class="accordion">Forms of payment</button>
        <div class="panel">
            <p>Currently, Our Store only accepts payments through 3 options:
            <p>– Cash collection at home, also known as COD</p>
            <p>– Direct payment: Add one of two store address: Quy Nhon, Binh Dinh or Da Nang.</p>
            <p>– Bank transfer.</p>               
        </div>
        <h3>
            <a href="index.jsp" ><b>Back to shop</b></a>
        </h3>        
        <script src="js/FAQs.js"></script>
    </body>
</html>
