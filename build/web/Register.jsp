<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.Instant"%>
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
    .required-field::after{
        border: 1px solid red;
    }
    </style>
    <%
        String username = (String)session.getAttribute("username");
        String password = (String)session.getAttribute("password");
        String re_password = (String)session.getAttribute("re_password");
        String first_name = (String)session.getAttribute("first_name");
        String last_name = (String)session.getAttribute("last_name");
        String email = (String)session.getAttribute("email");
        String phone = (String)session.getAttribute("phone");
        String address = (String)session.getAttribute("address");
        String role = (String)session.getAttribute("role");
        if (username == null || username =="") {
            username="";
        }
        if (password == null || password =="") {
            password="";
        }
        if (re_password == null || re_password =="") {
            re_password="";
        }
        if (first_name == null || first_name =="") {
            first_name="";
        }
        if (last_name == null || last_name =="") {
            last_name="";
        }
        if (email == null || email =="") {
            email="";
        }
        if (phone == null || phone =="") {
            phone="";
        }
        if (address == null || address =="") {
            address="";
        }
        if (role == null || role =="") {
            role="";
        }
    %>
</head>

<body style="background-image: url(img/Fpt02.jpg);">
    <div class="main">

        <section class="signup">
            
            <div class="container">
                <div class="signup-content">
                    <form action="RegisterControl" method="POST" id="signup-form" class="signup-form">

                        <h2 class="form-title">Create account</h2>
                        
                        <div class="col-sm-offset-3 col-sm-9">
                            <p class="text-danger" style="font-size: 15px; color: red;">
                                ${message}
                            </p>
                        </div>
                        <div class="form-group">
                            <label class="label-agree-term">Username</label><span style="color: red;">*</span>
                            <input type="text" class="form-input required-field" name="username" id="username" value="<%=username%>" placeholder="Your UserName" required pattern="^[a-zA-Z0-9_]{4,20}$" oninvalid="setCustomValidity('Username must contain alphanumeric characters and underscores, and be between 4 and 20 characters long.')" oninput="setCustomValidity('')"/>
                        </div>
                        
                        <div class="form-group">
                            <label class="label-agree-term">Password</label><span style="color: red;">*</span>
                            <input type="password" class="form-input required-field" name="password" id="password" value="<%=password%>" placeholder="Password" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" oninvalid="setCustomValidity('Password must contain at least one digit, one lowercase letter, one uppercase letter, and be at least 8 characters long.')" oninput="setCustomValidity('')"/>
                            <span class="zmdi zmdi-eye field-icon toggle-password"></span>
                            <i class="bi bi-eye-slash" id="togglePassword"></i>
                        </div>
                        
                        <div class="form-group">
                            <label class="label-agree-term">Confirm Password</label><span style="color: red;">*</span>
                            <input type="password" class="form-input required-field" name="re_password" id="re_password" value="<%=re_password%>" placeholder="Confirm Your Password" required/>
                        </div>
                        
                        
                        
                        <div class="form-group">
                            <label class="label-agree-term">Name</label><span style="color: red;">*</span>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-input required-field" name="first_name" id="first_name" value="<%=first_name%>" placeholder="Your First Name" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-input required-field" name="last_name" id="last_name" value="<%=last_name%>" placeholder="Your Last Name" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="label-agree-term">Email</label><span style="color: red;">*</span>
                            <input type="email" class="form-input required-field" name="email" id="email" value="<%=email%>" placeholder="Your E-mail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"/>
                        </div>
                        
                        <div class="form-group">
                            <label class="label-agree-term">Phone Number</label><span style="color: red;">*</span>
                            <input type="text" class="form-input required-field" maxlength="10" name="phone" id="phone" value="<%=phone%>" placeholder="Your Phone" required pattern="^\d{10}$|^(\d{3})[- ]?\d{3}[- ]?\d{4}$" oninvalid="setCustomValidity('the phone number must be exactly 10 digits for the format 1234567890 or 123-456-7890.')" oninput="setCustomValidity('')">
                        </div>
                        <div class="form-group">
                            <label class="label-agree-term">Address</label><span style="color: red;">*</span>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-input required-field" name="address" id="address" valuee="<%=address%>" placeholder="Your Address" required>
                                </div>
                                <div class="col-md-6">
                                    <select name="province" class="form-input required-field" id="provinceSelect" required>
                                        <option value="">*Select province*</option>
                                        <%-- Use a loop to add all provinces --%>
                                        <% String[] provinces = {"Ha Noi", "Ho Chi Minh City", "Da Nang", "Hai Phong", "Can Tho", "An Giang", "Ba Ria - Vung Tau", "Bac Giang", "Bac Kan", "Bac Lieu", "Bac Ninh", "Ben Tre", "Binh Dinh", "Binh Duong", "Binh Phuoc", "Binh Thuan", "Ca Mau", "Cao Bang", "Dak Lak", "Dak Nong", "Dien Bien", "Dong Nai", "Dong Thap", "Gia Lai", "Ha Giang", "Ha Nam", "Ha Tinh", "Hai Duong", "Hau Giang", "Hoa Binh", "Hung Yen", "Khanh Hoa", "Kien Giang", "Kon Tum", "Lai Chau", "Lam Dong", "Lang Son", "Lao Cai", "Long An", "Nam Dinh", "Nghe An", "Ninh Binh", "Ninh Thuan", "Phu Tho", "Quang Binh", "Quang Nam", "Quang Ngai", "Quang Ninh", "Quang Tri", "Soc Trang", "Son La", "Tay Ninh", "Thai Binh", "Thai Nguyen", "Thanh Hoa", "Thua Thien Hue", "Tien Giang", "Tra Vinh", "Tuyen Quang", "Vinh Long", "Vinh Phuc", "Yen Bai"}; %>
                                        <% for (String province : provinces) { %>
                                            <option value="<%= province %>"><%= province %></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="label-agree-term">Role</label><span style="color: red;">*</span>
                            <select id ="role" name="role" class="form-input required-field" aria-label="Default select example" required>
                                <option class="form-input required-field" value="">*Select Role*</option>
                                <option class="form-input required-field" value="2">Customer</option>
                                <option class="form-input required-field" value="3">Shipper</option>
                            </select>
                        </div>
                        <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Sign Up"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account, right ? <a href="Login.jsp" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>
    </div>   
</body>
</html>