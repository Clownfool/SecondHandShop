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
                    <form action="RegisterControl" method="POST" id="signup-form" class="signup-form">
                        <input type="hidden" name="register" id="register" value="${sessionScope.register}"/>
                        <input type="hidden" name="code" id="code" value="<%= codeB %>">
                        <h2 class="form-title">Verify your Email</h2>
                        <h3 class="form-title">Your Verification Code Has Been Sent To Your E-mail</h3>
                        <h3 id="countdownMessage" class="form-title">It will expire in <span id="countdown">180s</span> seconds</h3>
                        <p class="text-danger" style="font-size: 20px;">
                        ${message}
                        </p>  
                        
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" value="${sessionScope.register.getEmail()}" disabled/>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="inputCode" id="inputCode" placeholder="Verification Code" required>
                        </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Verify"/>
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
    // JavaScript code for the countdown
        var seconds = 180; // Total countdown time in seconds
        var countdownElement = document.getElementById("countdown");
        var countdownMessage = document.getElementById("countdownMessage");
        function countdown() {
            if (seconds < 0) {
                // Countdown is over
                countdownMessage.innerHTML = "Your verification code has expired!";
            } else {
                // Display the countdown
                countdownElement.innerHTML = seconds + "s";
            }

            seconds--; // Decrease the countdown time by 1 second
        }

        // Call the countdown function every second
        setInterval(countdown, 1000);
    </script>
</script>