<%@ page import="com.example.ancientchineselearning.domain.Dynasty" %>
<%@ page import="com.example.ancientchineselearning.dao.dynasty1Dao" %>
<%@ page import="com.example.ancientchineselearning.domain.Poetry" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ancientchineselearning.dao.Shiwen1Dao" %>
<%@ page import="com.example.ancientchineselearning.domain.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>古文斋</title>
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

    function search() {
        var poemName = document.getElementById("pomeName").value;
        var autherName = document.getElementById("autherName").value;
        var dynasty = document.getElementById("dynastyID");
        var dynastyIndex = dynasty.selectedIndex;
        var dynastyID = dynasty.options[dynastyIndex].value;
        window.location.href = "ShouYeServlet?poemName=" + poemName +
            "&autherName=" + autherName + "&dynastyID=" + dynastyID;

    }

</script>
<body>
<!-- 引入头部 -->
<jsp:include page="top.jsp"></jsp:include>

<!-- Slider Section Start -->
<div class="slider-section section">
    <div class="slide-item bg-parallax" data-bg-color="yellow"
         data-bg-image="assets/images/slider/slider-2.jpg" data-overlay="15">
        <div class="container">
            <div class="slider-content text-center">
                <h2 class="title" style="color: #4A3904;font-family: 华文行楷">传承中华传统文化</h2>
                <strong><p style="font-size: 18px; font-family: 仿宋; color: #474137">做你学习文言文的好助手</p></strong>
            </div>
        </div>
    </div>
</div>
<!-- Slider Section End -->

<!-- Job Search Section Start -->
<div class="job-search-section section">
    <div class="container">
        <div class="job-search-wrap">

            <!-- Job Search Form Start -->
            <div class="job-search-form">
                <div class="row mb-n4">

                    <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                        <input name="pomeName" id="pomeName" type="text" placeholder="通过诗文题目查询">
                    </div>

                    <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                        <input name="autherName" id="autherName" type="text" placeholder="通过作者查询">
                    </div>

                    <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                        <select id="dynastyID">
                            <option disabled="disabled" style="display: none" value="-1" selected>通过朝代查询</option>
                            <%
                                dynasty1Dao dynastyDao = new dynasty1Dao();
                                List<Dynasty> dynastyList = dynastyDao.getDynastyList();
                                if (dynastyList != null) {
                                    for (Dynasty dynasty : dynastyList) {
                            %>
                            <option value="<%=dynasty.getRid()%>"><%=dynasty.getContent()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                        <a href="javascript:search()" class="btn btn-primary"
                           style="background-color: #B69E72;border-color: #B69E72">搜索</a>
                    </div>

                </div>
            </div>
            <!-- Job Search Form End -->

        </div>
    </div>
</div>
<!-- Job Search Section End -->

<!-- Recent Jobs Start -->
<div class="section section-padding">
    <div class="container">
        <div class="section-title">
            <h2 class="title">大家都在搜</h2>
            <p>这里是当下最热的文章，会有你想要搜索的吗</p>
        </div>

        <!-- Job List Wrap Start -->
        <div class="job-list-wrap">

            <%
                Shiwen1Dao dao = new Shiwen1Dao();
                List<Poetry> list = dao.getZhuyeList();
                if (list != null) {
                    for (Poetry poetry : list) {
            %>
            <!-- Job List Start -->
            <a href="PoetryServlet?type=select&PoetryId=<%=poetry.getRid() %>" class="job-list">
                <div class="company-logo col-auto">
                    <img src="static/picture/company-1.png" alt="Company Logo">
                </div>
                <div class="salary-type col-auto order-sm-3">
                    <span class="salary-range">访问量：<%=poetry.getNumOfLike()%></span>
                    <span class="badge badge-success">查看</span>
                </div>
                <div class="content col">
                    <h6 class="title"><%=poetry.getTitle()%>
                    </h6>
                    <ul class="meta">
                        <li><strong class="text-primary">作者：<%=poetry.getAuther().getName()%>
                        </strong></li>
                        <li><strong>朝代：</strong><%=poetry.getAuther().getDynasty()%>
                        </li>
                    </ul>
                </div>
            </a>
            <!-- Job List Start -->

            <%
                    }
                }
            %>

        </div>
        <!-- Job List Wrap Start -->

        <div class="text-center mt-4 mt-lg-5">
            <a href="shiwen.jsp" class="btn btn-primary"
               style="background-color: #B69E72;border-color: #B69E72">更多文章</a>
        </div>

    </div>
</div>
<!-- Recent Jobs End -->

<!-- Funfact Section Start -->
<div class="section section-padding bg-parallax" data-bg-image="assets/images/new/content-top.jpg" data-overlay="10">
    <div class="container">
        <div class="funfact-wrap row">

            <!-- Funfact Start -->
            <div class="funfact col-md-3 col-sm-6 col-12">
                <span class="counter">1354</span>
                <span class="title">在线人数</span>
            </div>
            <!-- Funfact Start -->

            <!-- Funfact Start -->
            <div class="funfact col-md-3 col-sm-6 col-12">
                <span class="counter">1741</span>
                <span class="title">收录文章</span>
            </div>
            <!-- Funfact Start -->

            <!-- Funfact Start -->
            <div class="funfact col-md-3 col-sm-6 col-12">
                <span class="counter">204</span>
                <span class="title">今日上传</span>
            </div>
            <!-- Funfact Start -->

            <!-- Funfact Start -->
            <div class="funfact col-md-3 col-sm-6 col-12">
                <span class="counter">142</span>
                <span class="title">下载量</span>
            </div>
            <!-- Funfact Start -->

        </div>
    </div>
</div>
<!-- Funfact Section End -->

<!-- Featured Conpanies Start -->
<div class="section section-padding">
    <div class="container">
        <div class="section-title">
            <h2 class="title">诗人生平</h2>
            <p>古往今来千百代，多少诗人在滚滚历史长河留下了他的名字</p>
        </div>

        <!-- Company List Wrap Start -->
        <div class="company-slider row">
            <%
                Shiwen1Dao dao1 = new Shiwen1Dao();
                List<Poetry> list1 = dao.getShirenList();
                if (list1 != null) {
                    for (Poetry poetry : list1) {
            %>
            <!-- Company List Start -->
            <div class="col">
                <a href="AutherServlet?type=xiangqing&ID=<%=poetry.getAuther().getRid() %>" class="feature-company">
                    <span class="company-logo"><img src="static/picture/company-1.png" alt="company-1"></span>
                    <h6 class="title"><%=poetry.getAuther().getName() %>
                    </h6>
                    <span class="open-job"><%=poetry.getAuther().getBtd() %></span>
                </a>
            </div>
            <!-- Company List Start -->
            <%
                    }
                }

            %>
        </div>
        <!-- Company List Wrap Start -->

    </div>
</div>
<!-- Featured Conpanies End -->

<!-- 底部映入 -->
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