<%@ page import="com.example.ancientchineselearning.domain.Collection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ancientchineselearning.domain.Account" %><%--
  Created by IntelliJ IDEA.
  User: Fire016
  Date: 2022/12/29
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>个人主页</title>
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
<div class="page-heading-section section bg-parallax"
     data-bg-image="assets/images/slider/slider-2.jpg" data-overlay="15">
    <div class="container">
        <div class="page-heading-content text-center">
            <h2 class="title" style="font-size: 80px;color: #4A3904;font-family: 华文行楷">传承中华传统文化</h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item" style="color: #474137"><a href="index.html" style="color: #474137">主页</a>
                </li>
                <li class="breadcrumb-item active" style="color: #474137">个人主页</li>
            </ol>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- Company List Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">

            <div class="col-lg-8 col-12 mb-5 pr-lg-5" style="margin: 0 auto">

                <!-- Company Details Start -->
                <div style="background-color: #EEEEEE ;padding: 2px 2px">
                    <div style="background-color: white; padding: 18px 0">
                        <div class="job-details-head row mx-0">
                            <div class="company-logo col-auto">
                                <img src="assets/images/new/gravatar.jpg" width="70" height="70"
                                     style="border-radius: 70px;">
                            </div>
                            <%
                                Account account = (Account) request.getSession().getAttribute("LoginAccount");
                            %>
                            <div class="content col">
                                <strong> <span style="font-size: 25px; "><%=account.getAcn_eml()%></span></strong>
                            </div>
                        </div>
                        <hr/>
                        <div class="company-details">
                            <h5 class="mb-3" style="margin: 0 20px">修改密码</h5>
                            <div style="text-align: center; margin: auto">
                                <form action="passwordChangeServlet?eml=<%=account.getAcn_eml()%>" method="post">
                                    <input name="oldPwd" id="oldPwd" placeholder="输入旧密码">
                                    <input name="newPwd" id="newPwd" placeholder="输入新密码">
                                    <button type="submit">修改</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="company-details">
                    <h5 class="mb-3">用户收藏</h5>
                </div>
                <!-- Company Details Start -->

                <!-- Job List Wrap Start -->
                <div class="job-list-wrap">

                    <%

                        List<Collection> list = (List<Collection>) request.getAttribute("collectionList");
                        if (list != null) {
                            for (Collection collection : list) {
                    %>
                    <!-- Job List Start -->
                    <a href="PoetryServlet?type=select&PoetryId=<%=collection.getPoetry().getRid() %>" class="job-list">
                        <div class="company-logo col-auto">
                            <img src="static/picture/company-1.png" alt="Company Logo">
                        </div>
                        <div class="salary-type col-auto order-sm-3">
                            <span class="salary-range">喜欢：<%=collection.getPoetry().getNumOfLike()%></span>
                            <span class="badge badge-success">查看</span>
                        </div>
                        <div class="content col">
                            <h6 class="title"><%=collection.getPoetry().getTitle()%>
                            </h6>
                        </div>
                    </a>
                    <!-- Job List Start -->

                    <%
                            }
                        }
                    %>

                </div>
                <!-- Job List Wrap Start -->

            </div>

            <!-- Company Sidebar Wrap Start -->

            <!-- Company Sidebar Wrap End -->

        </div>
    </div>
</div>
<!-- Company List End -->

<!-- Footer Top Section Start -->

<!-- Footer Top Section End -->

<!-- Footer Bottom Section Start -->

<!-- Footer Bottom Section End -->
<jsp:include page="foot.jsp"></jsp:include>
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