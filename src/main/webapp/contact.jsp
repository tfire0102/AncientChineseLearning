<%@page import="com.example.ancientchineselearning.domain.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>错误反馈</title>
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

<body>


<jsp:include page="top.jsp"></jsp:include>

<!-- Page Heading Section Start -->
<div class="page-heading-section section bg-parallax" data-bg-image="assets/images/bg/bg-1.jpg" data-overlay="50">
    <div class="container">
        <div class="page-heading-content text-center">
            <h3 class="title">对知识的严谨我们是认真的</h3>
            <!-- <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp"></a></li>
                <li class="breadcrumb-item active">Contact Us</li>
            </ol> -->
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- Contact Section Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">

            <!-- Contact Map Start -->

            <!-- Contact Map End -->

            <!-- Contact Information Start -->
            <div class="col-lg-5 col-12 mb-5">
                <div class="contact-information">
                    <h5 class="title mb-4">我们的联系方式</h5>
                    <ul>
                        <li><i class="fa fa-map-o"></i><span>内蒙古工业大学金川校区 数据与科学应用学院<br>&emsp;&emsp;软件20-1</span></li>
                        <li><i class="fa fa-phone-square"></i><span>+15848712265</span></li>
                        <li><i class="fa fa-fax"></i><span>+15846172399</span></li>
                        <li><i class="fa fa-envelope-o"></i><span>keller@email.com</span></li>
                    </ul>
                    <div class="contact-social">
                        <a href="#"><i class="fa fa-qq"></i></a>
                        <a href="#"><i class="fa fa-wechat"></i></a>
                        <a href="#"><i class="fa fa-phone"></i></a>
                        <a href="#"><i class="fa fa-comment"></i></a>
                    </div>
                </div>
            </div>
            <!-- Contact Information End -->

            <!-- Contact Form Start -->
            <%
                Account account = (Account) request.getSession().getAttribute("LoginAccount");
                int PoetryId = Integer.valueOf((String) request.getParameter("PoetryId"));
                String PoetryName = (String) request.getParameter("PoetryName");
            %>
            <div class="col-lg-7 col-12 mb-5">
                <div class="contact-form">
                    <h5 class="title mb-4">联系我们</h5>
                    <form action="ContactServlet" method="post">
                        <div class="row mb-n3">
                            <input class="hidden" name="PoetryId" id="PoetryId" placeholder="诗词id"
                                   value="<%=PoetryId %>" readonly>
                            <input class="hidden" name="AccountId" id="AccountId" placeholder="用户id"
                                   value="<%=account.getAcn_rid() %>" readonly>
                            <div class="col-md-6 col-12 mb-3"><input type="text" name="PoetryName" id="PoetryName"
                                                                     placeholder="昵称" value="<%=PoetryName %>" readonly>
                            </div>
                            <div class="col-md-6 col-12 mb-3"><input type="text" name="" id="" placeholder="邮箱"
                                                                     value="<%=account.getAcn_eml() %>" readonly></div>
                            <div class="col-12 mb-3"><textarea name="message" id="message" placeholder="留言"
                                                               rows="4"></textarea></div>
                            <div class="col-12 mb-3">
                                <input class=" btn btn-primary px-5" type="submit" value="发送留言">
                            </div>
                        </div>
                    </form>
                    <!-- <div class="form-messege"></div> -->
                </div>
            </div>

            <!-- Contact Form End -->

        </div>
    </div>
</div>
<!-- Contact Section End -->

<!-- Footer Top Section Start -->
<jsp:include page="foot.jsp"></jsp:include>
<!-- Footer Bottom Section End -->


<!-- JS
============================================ -->

<!-- Google Map API JS -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM"></script> -->

<!-- Vendors JS -->
<script src="static/js/modernizr-3.6.0.min.js"></script>
<script src="static/js/jquery-3.4.1.min.js"></script>
<script src="static/js/bootstrap.bundle.min.js"></script>

<!-- Plugins JS -->
<script src="static/js/slick.min.js"></script>
<script src="static/js/jquery.waypoints.min.js"></script>
<script src="static/js/jquery.counterup.min.js"></script>
<script src="static/js/jquery.parallax.js"></script>
<script src="static/js/jquery.ajaxchimp.min.js"></script>
<script src="static/js/ion.rangeSlider.min.js"></script>
<script src="static/js/jquery.scrollUp.min.js"></script>

<!-- Main Activation JS -->
<script src="static/js/main.js"></script>

</body>

</html>