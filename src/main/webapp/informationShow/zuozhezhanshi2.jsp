<%@page import="com.example.ancientchineselearning.domain.Auther" %>
<%@page import="java.util.List" %>
<%@page import="com.example.ancientchineselearning.dao.Auther3Dao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    // 获取请求绝对路径
    // 获取使用协议
    String scheme = request.getScheme();
    // 获取网站域名
    String webSite = request.getServerName();
    // 获取URL请求的端口号
    int port = request.getServerPort();
    // 获取当前应用的根路径
    String path = request.getContextPath();

    // 拼接根路径
    String basePath = scheme + "://" + webSite + ":" + port + path + "/";
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>诗人信息</title>
    <base href="<%=basePath%>">
    <meta name="robots" content="noindex, follow">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->


    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">

    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../static/css/flaticon.css">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="../static/css/slick.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="../static/css/style.css">

</head>

<body>

<jsp:include page="../top.jsp"></jsp:include>

<!-- Page Heading Section Start -->
<div class="page-heading-section section bg-parallax" data-bg-image="assets/images/bg/2.jpg" data-overlay="50">
    <div class="container">
        <div class="page-heading-content text-center">
            <h3 class="title">作者展示</h3>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- Company List Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">


            <%
                Auther auther = (Auther) request.getAttribute("auther");
            %>
            <div class="col-lg-8 col-12 mb-5 pr-lg-5">
                <div class="job-list-details">
                    <div class="job-details-body">
                        <div>
                            <strong><p class="mb-3" style="font-size: 36px; text-align: center">
                                <%=auther.getName()%>
                            </p></strong>
                            <p style="text-align: center" ><%=auther.getBtd() %></p>
                        </div>
                        <br>
                        <div>
                            <div>
                                <p><%=auther.getName()%>（<%=auther.getBtd() %>），<%=auther.getDynasty()%>，<%=auther.getInfo() %>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-12 mb-5 pr-lg-5">
                <div class="job-list-details">
                    <div class="job-details-body">
                        <img src="static/picture/<%=auther.getRid() %>.png">
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<!-- Footer Top Section Start -->
<jsp:include page="../foot.jsp"></jsp:include>
<!-- Footer Top Section End -->

<!-- Footer Bottom Section Start -->

<!-- Footer Bottom Section End -->

<!-- JS
============================================ -->

<!-- Google Map API JS -->
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM"></script> -->

<!-- Vendors JS -->
<script src="../static/js/modernizr-3.6.0.min.js"></script>
<script src="../static/js/jquery-3.4.1.min.js"></script>
<script src="../static/js/bootstrap.bundle.min.js"></script>

<!-- Plugins JS -->
<script src="../static/js/slick.min.js"></script>
<script src="../static/js/jquery.waypoints.min.js"></script>
<script src="../static/js/jquery.counterup.min.js"></script>
<script src="../static/js/jquery.parallax.js"></script>
<script src="../static/js/jquery.ajaxchimp.min.js"></script>
<script src="../static/js/ion.rangeSlider.min.js"></script>
<script src="../static/js/jquery.scrollUp.min.js"></script>

<!-- Main Activation JS -->
<script src="../static/js/main.js"></script>

</body>

</html>
</html>