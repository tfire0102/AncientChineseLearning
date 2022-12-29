<%@ page import="com.example.ancientchineselearning.domain.Press" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Fire016
  Date: 2022/12/28
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html class="no-js" lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>用户评论审核</title>
    <base href="<%=basePath%>">
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

<jsp:include page="../top.jsp"></jsp:include>


<!-- Page Heading Section Start -->
<div class="page-heading-section section bg-parallax"
     data-bg-image="assets/images/slider/slider-2.jpg" data-overlay="15">
    <div class="container">
        <div class="page-heading-content text-center">
            <%--      <h3 class="title">用户上传资源审核界面</h3>--%>
            <h2 class="title" style="font-size: 80px;color: #4A3904;font-family: 华文行楷">传承中华传统文化</h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item" style="color: #474137"><a href="index.jsp" style="color: #474137">主页</a></li>
                <li class="breadcrumb-item active" style="color: #474137">评论审核</li>
            </ol>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- Recent Jobs Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">

            <div style="width: 80%; margin: 0 auto">

                <!-- Job List Toolbar Start -->
                <%
                    List<Press> pressList = (List<Press>) request.getAttribute("pressList");
                %>
                <div class="job-list-toolbar">
                    <p>此处显示<%=pressList.size()%>条记录</p>
                    <p>排序方式:
                        <select>
                            <option>发布时间</option>
                            <option>名称</option>
                        </select>
                    </p>
                </div>
                <!-- Job List Toolbar End -->

                <!-- Job List Wrap Start -->
                <div class="job-list-wrap">
                    <%
                        if (pressList != null) {
                            for (Press press : pressList) {
                    %>
                    <!-- Job List Start -->
                    <div class="job-list">
                        <div class="company-logo col-auto">
                            <img src="static/picture/company-1.png" alt="Company Logo">
                        </div>
                        <div class="salary-type col-auto order-sm-3">
                            <a href="pressOperationServlet?type=agree&rid=<%=press.getRid()%>" class="badge btn-success" style="border-radius: 5px">发布</a>
                            <a href="pressOperationServlet?type=refuse&rid=<%=press.getRid()%>" class="badge btn-danger" style="border-radius: 5px">违规</a>
                        </div>
                        <div class="content col">
                            <h6 class="title">
                                <%=press.getAccount()%>【<span><%=press.getPoem()%></span>】
                            </h6>
                            <textarea style="resize: none" rows="3" readonly><%=press.getContent()%></textarea>

                        </div>
                    </div>
                    <!-- Job List Start -->
                    <%
                        }
                    } else {
                    %>
                    <span>当前还没有需要审核的评论</span>
                    <%
                        }
                    %>
                </div>
                <!-- Job List Wrap Start -->

                <!-- Pagination Start -->
                <ul class="pagination pagination-center mt-5">
                    <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
                <!-- Pagination End -->

            </div>

        </div>
    </div>
</div>
<!-- Recent Jobs End -->

<jsp:include page="../foot.jsp"></jsp:include>

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