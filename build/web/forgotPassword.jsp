<%@page import="Controller.validation"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password?</title>
    <link href="img/favicon.png" rel="icon">
    <link rel="stylesheet" href="material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/register.css" >
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
<%      
        String codeB = (String) session.getAttribute("verificationCode");
        if (validation.isCodeExpired()) {
            codeB = null; 
        } else {
            codeB = (String) session.getAttribute("verificationCode");
        }
%>
<body style="background-image: url(img/Fpt02.jpg);">
    <div class="main">
        
        <section class="signup">
            
            <div class="container">
                <div class="signup-content">
                    <form action="forgotPasswordController" method="POST" id="signup-form" class="signup-form">
                        <p class="text-danger" style="font-size: 20px;">
                        ${message}
                        </p>  
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="argUser" id="argUser" placeholder="Your Username/E-mail" required/>
                        </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Submit E-mail"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="Login.jsp" class="loginhere-link">Login here</a>
                    </p>
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