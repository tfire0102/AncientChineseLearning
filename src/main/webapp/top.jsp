<%@page import="com.example.ancientchineselearning.domain.Dynasty"%>
<%@page import="com.example.ancientchineselearning.dao.dynasty1Dao"%>
<%@page import="com.example.ancientchineselearning.domain.Poetry"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ancientchineselearning.dao.Shiwen1Dao"%>
<%@page import="com.example.ancientchineselearning.domain.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zh">
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>顶头</title>
    <meta name="robots" content="noindex, follow">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    

    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">

    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/flaticon.css">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="static/css/slick.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="static/css/style.css">
</head>

<script type="text/javascript">
	function validata() {
		var name1 = document.getElementById("name1");
		var email1 = document.getElementById("email1");
		var pawd1 = document.getElementById("pawd1");
		var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		
		if(email1.value == "") {
			alert("邮箱不能为空！");
			email1.focus();
			return false;
		}
		
		if(pawd1.value == "") {
			alert("密码不能为空！");
			pawd1.focus();
			return false;
		}else if (pawd1.value.length < 4) {
			alert("请输入至少4位密码！");
			pawd1.focus();
			return false;
		}
		
		return true;
	}
	
	function validata1() {
		var name = document.getElementById("login_name");
		var pawd = document.getElementById("login_pawd");
		
		if(name.value == ""){
			alert("请输入登陆邮箱！");
			name.focus();
			return false;
		}
		
		if(pawd.value == "") {
			alert("请输入登陆密码！");
			pawd.focus;
			return false;
		}
		return ture;
}
	
</script>

<body>
	<header class="header">
        <div class="container">
            <div class="row justify-content-between align-items-center">

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo" >
                        <a href="">
							<img src="static/picture/logo.png" alt="Site Logo">
<!--							<strong><span style="color: white;font-size: 36px">&nbsp;&nbsp;古文斋</span></strong>-->
						</a>
                    </div>
                </div><!-- Header Logo End -->

                <!-- Offcanvas Toggle Start -->
                <div class="col-auto d-lg-none d-flex align-items-center">
                    <button class="offcanvas-toggle">
                        <span></span>
                    </button>
                </div>
                <!-- Offcanvas Toggle End -->

                <!-- Header Links Start -->
                <div class="header-links col-auto order-lg-3">
                <%
                Account loginAccount = (Account)session.getAttribute("LoginAccount");  
                	        		if(loginAccount == null) {
                %>
               		<a href="#" data-toggle="modal" data-target="#loginSignupModal" data-target-sub="#login" style="font-size: 20px">登录</a>
                    <span style="font-size: 20px">/</span>
                    <a href="#" data-toggle="modal" data-target="#loginSignupModal" data-target-sub="#signup" style="font-size: 20px">注册</a>
	            <% 	
	        		}else {
	        	%>
	        		<img src="assets/images/new/gravatar.jpg" width="30" height="30" style="border-radius: 30px">
                    <a href="personalHoemServlet?acnID=<%=loginAccount.getAcn_rid()%>" target="_parent"><%=loginAccount.getAcn_eml() %></a>
	        		<a href="AccountLogoutServlet">&nbsp;退出</a>
	        	<%
	        		}               
                %>
                    
                </div><!-- Header Links End -->

                <!-- Header Menu Start -->
                <nav id="main-menu" class="main-menu col-lg-auto order-lg-2">
                    <ul>
                        <li class="has-children"><a href="index.jsp" style="font-size: 20px">主页</a></li>
                        <li class="has-children"><a href="shiwen.jsp" style="font-size: 20px">诗文</a>
                        <li class="has-children"><a href="chengyu.jsp" style="font-size: 20px">成语</a></li>
<!--
                            <ul class="sub-menu">
                            </ul>
-->
                        </li>
                        <li><a href="jinju.jsp" style="font-size: 20px">名句</a></li>
                        <li><a href="zuozhezhanshi.jsp" style="font-size: 20px">作者</a></li>
                        <% 
                        if(loginAccount != null) {
	                        if("user:adm".equals(loginAccount.getAcn_perm())) {
	                	%>
	                		<li><a style="font-size: 20px">管理</a>
	                			<ul class="sub-menu">
	                				<li><a href="poemControlServlet?type=examine" style="font-size: 10px">资源审核</a></li>
	                				<li><a href="poemControlServlet?type=change" style="font-size: 10px">资源修改</a></li>
	                				<li><a href="pressControlServlet" style="font-size: 10px">评论审核</a></li>
	                				<li><a href="feedbackShowServlet" style="font-size: 10px">用户反馈</a></li>
	                			</ul>
	                		</li>
	                		
	                	<%	
	                    	}
                        }
                        %>
                        </ul>
                </nav>
                <!-- Header Menu End -->

            </div>

        </div>
    </header>
    
    <!--Offcanvas Section Start-->
    <div id="offcanvas" class="offcanvas-section">
        <button class="offcanvas-close" data-target="#offcanvas">&times;</button>
        <div class="offcanvas-wrap">
            <div class="inner">

                <!-- Offcanvas user Start -->
                <div class="offcanvas-user">
                <%
	        		if(loginAccount == null) {
	        	%>
               		<a href="#" data-toggle="modal" data-target="#loginSignupModal" data-target-sub="#login" style="font-size: 24px">登录</a>
                	<span>or</span>
                	<a href="#" data-toggle="modal" data-target="#loginSignupModal" data-target-sub="#signup">注册</a>	
	            <% 	
	        		}else {
	        	%>	
	        		<a href="index.jsp" target="_parent"><%=loginAccount.getAcn_eml() %></a>
	        		<a href="AccountLogoutServlet">&nbsp;退出</a>
	        	<%
	        		}               
                %>
                </div>
                <!-- Offcanvas user End -->

                <!-- Offcanvas Menu Start -->
                <div class="offcanvas-menu">
                </div>
                <!-- Offcanvas Menu End -->

            </div>
        </div>
    </div>
    <!--Offcanvas Section End-->
    <!--OffCanvas Overlay-->
    <div class="offcanvas-overlay"></div>


    <div class="loginSignupModal modal fade" id="loginSignupModal" tabindex="-1" role="dialog" aria-labelledby="loginSignupModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">

                    <ul class="loginSignupNav nav">
                        <li><a class="nav-link active" data-toggle="tab" href="#login">登录</a></li>
                        <li><a class="nav-link" data-toggle="tab" href="#signup">注册</a></li>
                    </ul>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <div class="modal-body">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="login">
                            <form action="AccountLoginServlet?page=index" method="post" onsubmit="return validata1()">
                                <div class="row mb-n3">
                                    <div class="col-12 mb-3"><input type="email" name="login_name" id="login_name" placeholder="邮箱"></div>       
                                    <div class="col-12 mb-3"><input type="password" name="login_pawd" id="login_pawd" placeholder="密码"></div>
                                    <div class="col-12 mb-3">
                                        <div class="row justify-content-between mb-n2">
                                            <div class="col-auto mb-2">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" name="remember-me" id="remember-me" value="checkedValue" class="custom-control-input">
                                                    <label class="custom-control-label" for="remember-me">记住我</label>
                                                </div>
                                            </div>
                                            <div class="col-auto mb-2"><a href="#">忘记密码？</a></div>
                                        </div>
                                    </div>
                                    <div class="col-12 mb-3"><input class="btn btn-primary w-100" type="submit" value="登录"></div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col text-center">
                                        <p class="text-muted">或者使用登录</p>
                                        <div class="login-reg-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="signup">
                            <form action="AccountRegisterServlet?page=index" method="post" onsubmit="return validata()">
                                <div class="row mb-n3">                                    
                                    <div class="col-12 mb-3"><input type="email" name="email1" id="email1" value="" placeholder="你的邮箱地址"></div>
                                    <div class="col-12 mb-3"><input type="password" name="pawd1" id="pawd1" value="" placeholder="输入一个密码"></div>
                                    <div class="col-12 mb-3"><input class="btn btn-primary w-100" type="submit" value="立即注册"></div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col text-center">
                                        <p class="text-muted">或者使用注册</p>
                                        <div class="login-reg-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-pinterest"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>