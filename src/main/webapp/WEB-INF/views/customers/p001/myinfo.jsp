<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DingPet SignIn</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
</head>

<body>
	<div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                
                    <div class="signup-form">
                        <h2 class="form-title">나 의 정 보</h2>
                        
                        <form method="POST" class="register-form" id="register-form" action="signup">
                        
                           
                                <label for="new_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                아이디<input type="text" id="member_id" name="member_id" placeholder="Your ID"/>
                            
                            <input type="button" value="ID중복체크" id="btn_duplicate" onClick="fn_process()" />
                            
                            
                            
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                비밀번호<input type="password" name="member_pwd" id="pass" placeholder="Password"/>
                            </div>
       
                            
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                닉네임<input type="text" name="member_nickname" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                이메일<input type="email" name="member_email" id="email" placeholder="Your Email"/>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                            </div>
                        </form>    
                    </div>
                    
                    
                    <div class="signup-image">
                        <figure><img src="${pageContext.request.contextPath}/resources/images/sign/signup-image.png" alt="sing up image"></figure>
                        <a href="#" class="signup-image-link">I am already member</a>
                    </div>
                    
                    
                </div>
            </div>
        </section>

    </div>
    

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

    
</body>
</html>