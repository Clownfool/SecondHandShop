<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login to system</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/login.css">
        <link href="img/favicon.png" rel="icon">
        <style>
            #user::after {
                content: '*';
                color: red;
            }
            #password-field::after {
                content: '*';
                color: red;
            }
        </style>


    </head>
    <body class="img js-fullheight" style="background-image: url(img/Fpt02.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login to system</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>

                            <div class="col-sm-offset-3 col-sm-9">
                                <p class="text-danger" style="font-size: 20px;">
                                    ${message}
                                </p>
                            </div>

                            <form action="login" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input id="user" name ="user" type="text" class="form-control" placeholder="Username/E-mail" required>
                                </div>
                                <div class="form-group">
                                    <input name="pass" id="password-field" type="password" class="form-control" placeholder="Password" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">Remember Me
                                            <input type="checkbox" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="forgotPassword.jsp" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>
                            </form>
                            <p class="signuphere">
                                Do not have an account ? <a href="Register.jsp" class="signuphere-link">Sign-up here</a>
                            </p>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/SecondHandClothesPlatform/LoginGoogleHandler&response_type=code&client_id=307569771183-0earpio630bpk27htd69e65rk9f5id33.apps.googleusercontent.com&approval_prompt=force" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-gmail mr-2"></span> Google</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

        <script src="js/login.js"></script>

    </body>
</html>

