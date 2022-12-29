<%@page import="com.example.ancientchineselearning.domain.Auther" %>
<%@page import="com.example.ancientchineselearning.domain.Dynasty" %>
<%@page import="com.example.ancientchineselearning.domain.Poetry" %>
<%@page import="java.util.List" %>
<%@page import="com.example.ancientchineselearning.dao.Poetry3Dao" %>
<%@ page import="com.example.ancientchineselearning.dao.Poetry3Dao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>名句</title>
    <meta name="robots" content="noindex, follow">
    <meta name="description" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
     data-bg-image="assets/images/bg/jinju.jpg" data-overlay="50">
    <div class="container">
        <div class="page-heading-content text-center">
            <h3 class="title">诗句资源</h3>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp"></a></li>
            </ol>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- Recent Jobs Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">

            <div class="col-lg-12 col-12 mb-5 pr-lg-5">
                <!-- Job List Toolbar Start -->
                <div>

                    <!-- <a href="job-list.jsp"><span class="tn-button">返回诗句</span></a> -->
                </div>

                <div class="job-list-toolbar">
                    <a href="poemControl/ziyuanshangchuan.jsp" class="btn btn-link" style="border-color: black; color:black"><span
                            class="tn-button">上传资源</span></a>
                    <p>
                        选择类型: <select>
                        <option>今日推荐</option>
                        <option>昨日推荐</option>
                        <option>最热推荐</option>
                    </select>
                    </p>
                </div>
                <!-- Job List Toolbar End -->

                <!-- Job List Wrap Start -->
                <div class="job-list-wrap">

                    <!-- Job List Start -->

                    <%
                        Poetry3Dao dao = new Poetry3Dao();
                        List<Poetry> poetryList = dao.getPoetryList();
                        if (poetryList != null) {
                            for (Poetry poetry : poetryList) {
                    %>
                    <div>
                        <a href="PoetryServlet?type=select&PoetryId=<%=poetry.getRid()%>" class="job-list">
                            <div class="company-logo col-auto">
                                <img src="static/picture/company-1.png" alt="Company Logo">
                            </div>
                            <div class="content col">
                                <%-- <a href="PoetryServlet?type=peotry&id=<%=poetry.getRid() %>" target="_blank"> </a>  --%>
                                <h6 class="title"><%=poetry.getFamSentence()%>
                                </h6>
                                <ul class="meta">
                                    <li><strong class="text-primary"><%=poetry.getAuther().getName()%>
                                    </strong></li>
                                    <li><strong>来自古诗：</strong><%=poetry.getTitle()%>
                                    </li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <%
                            }
                        }
                    %>

                    <!-- Job List Wrap Start -->

                    <!-- Pagination Start -->
                    <ul class="pagination pagination-center mt-5">
                        <li class="page-item"><a class="page-link" href="#"><i
                                class="fa fa-angle-left"></i></a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#"><i
                                class="fa fa-angle-right"></i></a></li>
                    </ul>
                    <!-- Pagination End -->

                </div>

                <!-- Job Sidebar Wrap Start -->

                <!-- Job Sidebar Wrap End -->

            </div>
        </div>

    </div>
    <!-- Recent Jobs End -->
</div>
<!-- Footer Bottom Section Start -->
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