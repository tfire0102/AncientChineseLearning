<%@page import="com.example.ancientchineselearning.domain.Account" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>成语</title>
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
<!-- 引入顶部 -->
<jsp:include page="top.jsp"></jsp:include>

<!-- Page Heading Section Start -->
<div class="slider-section section">
    <div class="slide-item bg-parallax" data-bg-color="yellow"
         data-bg-image="assets/images/slider/chengyu.jpg" data-overlay="15">
        <div class="container">
            <div class="slider-content text-center">
                <h2 class="title" style="color: #a98f4a;font-family: 华文行楷">经典成语“积累”</h2>
                <strong><p style="font-size: 18px; font-family: 仿宋; color: #a98f4a">时人不识凌云木，直待凌云始道高。</p></strong>
            </div>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- Job Search Section Start -->
<div class="job-search-section section">
    <div class="container">
        <div class="job-search-wrap">

            <!-- Job Search Form Start -->
            <div class="job-search-form">
                <form action="idiomFindServlet">
                    <div class="row mb-n4">

                        <div class="col-lg-9 col-sm-8 col-12 flex-grow-1 mb-4">
                            <input name="findText" id="findText" type="text" placeholder="通过描述查询">
                        </div>

                        <div class="col-lg-3 col-sm-4 col-12 flex-grow-1 mb-4">
                            <input class="btn btn-primary" type="submit"
                                   style="background-color: #B69E72;border-color: #B69E72" value="搜索">
                        </div>

                    </div>
                </form>
            </div>
            <!-- Job Search Form End -->

        </div>
    </div>
</div>
<!-- Job Search Section End -->

<!-- Recent Jobs Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">

            <div class="col-lg-12 col-12 mb-5 pr-lg-5">
                <!-- Job List Wrap Start -->
                <div class="company-list-wrap row">
                    <%
                        List<String> result = (List<String>) request.getAttribute("result");
                        if (result != null) {
                            for (String str : result) {
                    %>
                    <div class="col-xl-2 col-lg-3 col-md-2 col-sm-3 col-12">
                        <div class="company-list">
                            <p class="location" style="text-align: center; font-size: 16px"><%=str%></p>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <!-- Job List Wrap Start -->
            </div>
        </div>
    </div>
</div>
<!-- Recent Jobs End -->

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