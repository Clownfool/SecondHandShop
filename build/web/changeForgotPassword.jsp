<%@page import="Controller.validation"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register your account</title>
    <link rel="stylesheet" href="material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/register.css" >
    <link href="img/favicon.png" rel="icon">
    <style>
        .form-submit {
        margin-bottom: 10px;
    }
        .loginhere {
        margin-top: 5px; 
    }
    
    .row {
      display: flex;
      justify-content: space-between;
    }
  
    .col-md-6 {
      flex: 1;
      margin-right: 5px;
    }
    </style>
</head>
<body style="background-image: url(img/Fpt02.jpg);">
    <div class="main">
        
        <section class="signup">
            
            <div class="container">
                <div class="signup-content">
                    <form action="forgotPasswordController" method="POST" id="signup-form" class="signup-form">
                        <input type="hidden" name="forgotPasswordCustomer" id="forgotPasswordCustomer" value="${sessionScope.forgotPasswordCustomer}"/>
                        <p class="text-danger" style="font-size: 20px;">
                        ${message}
                        </p>  
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="newPassword" id="newPassword" placeholder="New Password" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" oninvalid="setCustomValidity('Password must contain at least one digit, one lowercase letter, one uppercase letter, and be at least 8 characters long.')" oninput="setCustomValidity('')"/>
                        </div>
                        
                        <div class="form-group">
                            <input type="password" class="form-input" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                        </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Change Password"/>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>   
</body>
</html>
<script>
    function isCodeExpired(expiryTime) {
    var currentTime = Date.now();
    return currentTime > expiryTime;
  }
</script>