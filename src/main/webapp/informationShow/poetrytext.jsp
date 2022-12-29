<%@page import="com.example.ancientchineselearning.domain.Account" %>
<%@page import="com.example.ancientchineselearning.domain.Press" %>
<%@page import="java.util.List" %>
<%@page import="com.example.ancientchineselearning.dao.Poetry2Dao" %>
<%@page import="com.example.ancientchineselearning.domain.Poetry" %>
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
    <title>诗词信息</title>
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
<script type="text/javascript">
    function fabulous(id) {
        var num = document.getElementById("num").innerHTML;
        num = Number(num) + Number(1);
        document.getElementById("num").innerHTML = num;
        <%Poetry poetry = (Poetry)request.getAttribute("Poetrytext");
        Poetry2Dao poetryDao = new Poetry2Dao();
        poetryDao.updateselectPoetryById(poetry.getRid());%>
    }

</script>
<body>

<!-- 页面头部 -->
<jsp:include page="../top.jsp"></jsp:include>

<!-- Page Heading Section Start -->
<div class="slider-section section">
    <div class="slide-item bg-parallax" data-bg-color="yellow"
         data-bg-image="assets/images/slider/slider-4.jpg" data-overlay="15">
        <div class="container">
            <div class="slider-content text-center">
                <h2 class="title" style="color: #4A3904;font-family: 华文行楷">传承中华传统文化</h2>
                <strong><p style="font-size: 18px; font-family: 仿宋; color: #474137">做你学习文言文的好助手</p></strong>
            </div>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->


<!-- Recent Jobs Start -->
<div class="section section-padding">
    <div class="container">
        <div class="row mb-n5">

            <!-- Job List Details Start -->
            <div class="col-lg-8 col-12 mb-5 pr-lg-5">
                <div class="job-list-details">
                    <!--上方点赞div-->
                    <div class="job-details-head row mx-0">
                        <div class="company-logo col-auto">
                            <!--作者信息入口-->
                            <img src="static/picture/yangliu3.jpg" width="70">
                        </div>
                        <div class="salary-type col-auto order-sm-3">

                            <span class="salary-range"><h5 style="color: red">♥<span
                                    id="number"><%=poetry.getNumOfLike()%></span></h5></span>
                            <span class="badge badge-success"><a
                                    onclick="fabulous(<%=poetry.getRid()%>)">一键三连</a></span>
                        </div>
                        <div class="content col">
                            <!--动态名句-->
                            <h4 class="title" style="color: black"><%=poetry.getFamSentence()%>
                            </h4>
                            <ul class="meta">
                                <!--作者入口-->
                                <li><strong class="text-primary"><a
                                        href="AutherServlet?type=xiangqing&ID=<%=poetry.getAuther().getRid() %>"><%=poetry.getAuther().getName()%>
                                </a></strong></li>
                                <li>&nbsp;&nbsp;&nbsp;弘扬中华民族传统文化</li>
                            </ul>
                        </div>
                    </div>
                    <div class="job-details-body">
                        <!--诗词原文-->
                        <div style="margin: auto 150px;">
                            <h6 class="mb-3"><%=poetry.getTitle()%>
                            </h6>
                            <p><%=poetry.getAuther().getName()%>
                                <span>【<%=poetry.getAuther().getDynasty()%>】</span>
                            </p>
                            <p><%=poetry.getContent()%>
                            </p>
                        </div>

                        <!--诗词翻译-->
                        <div>
                            <h6 class="mb-3 mt-4">诗词翻译</h6>
                            <div>
                                <p><%=poetry.getTranslate()%>
                                </p>
                            </div>
                        </div>

                        <!--诗词鉴赏-->
                        <div>
                            <h6 class="mb-3 mt-4">诗词鉴赏</h6>
                            <div>
                                <p>&emsp;&emsp;<%=poetry.getAppreciate()%>
                                </p>
                            </div>

                        </div>
                        <!-- 诗词注释 -->
                        <div>
                            <h6 class="mb-3 mt-4">诗词注释</h6>
                            <div>
                                <p>&emsp;&emsp;<%=poetry.getNotes()%>
                                </p>
                            </div>

                        </div>
                        <h6 class="mb-3 mt-4">猜你喜欢</h6>
                        <%
                            Poetry2Dao dao = new Poetry2Dao();
                            List<Poetry> poetryList = dao.SelectGlike(poetry.getRid(), poetry.getAuther().getDynasty());
                            for (Poetry poetrylist : poetryList) {
                        %>
                        <!-- 猜你喜欢 -->
                        <div>

                            <div>
                                <a href="PoetryServlet?type=select&PoetryId=<%=poetrylist.getRid() %>" class="job-list">
                                    <div class="company-logo col-auto">
                                        <img src="static/picture/<%=poetrylist.getAuther().getRid() %>.png"
                                             alt="Company Logo" width="60px">
                                    </div>
                                    <div class="salary-type col-auto order-sm-3">
                                        <span class="salary-range">点赞数：<%=poetrylist.getNumOfLike() %></span>
                                        <span class="badge badge-success">查看</span>
                                    </div>
                                    <div class="content col">
                                        <h6 class="title"><%=poetrylist.getTitle() %>
                                        </h6>
                                        <ul class="meta">
                                            <li><strong class="text-primary"><%=poetrylist.getAuther().getName() %>
                                            </strong></li>
                                            <li><strong>朝代：</strong> <%=poetrylist.getAuther().getDynasty() %>
                                            </li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <br>
                        <div>
                            <div class="contact-form">
                                <h6 class="mb-3 mt-4">诗词评论</h6>

                                <%
                                    Account account = (Account) request.getSession().getAttribute("LoginAccount");
                                    //Account account = new Account(1,"郅","123456","");
                                    List<Press> pressList = poetryDao.selectpress(poetry.getRid());
                                    for (Press presslist : pressList) {
                                %>
                                <div class="job-details-head row mx-0">
                                    <div class="company-logo col-auto">
                                        <img src="static/picture/yangliu3.jpg" width="70" height="70" style="border-radius: 70px">
                                    </div>
                                    <div class="salary-type col-auto order-sm-3">

                                        <span class="salary-range"><h5 style="color: red">🔥<span
                                                id="num"><%=poetry.getNumOfLike() %></span></h5></span>
                                        <span class="badge badge-danger">评论热度</span>
                                    </div>
                                    <div class="content col">
                                        <h6><%=presslist.getAccount() %>
                                        </h6><!--  -->
                                        <ul class="meta">
                                            <!--作者入口-->
                                            <li><strong class="text-primary">评论内容：</strong></li>
                                            <li>&nbsp;&nbsp;&nbsp;<%=presslist.getContent() %>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <%
                                    }
                                %>


                                <form action="PoetryServlet?type=press&PoetryId=<%=poetry.getRid() %>&AccountId=<%=account.getAcn_rid() %>"
                                      method="post">
                                    <div class="row mb-n3">
                                        <div class="col-12 mb-3"><textarea name="message" id="message"
                                                                           placeholder="写下你的对诗词的评论吧"
                                                                           rows="4"></textarea></div>
                                        <div class="col-12 mb-3" style="text-align: center"><input
                                                class="btn btn-primary px-5" type="submit" value="发布评论"></div>
                                    </div>
                                </form>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <!-- Job List Details End -->

            <!-- Job Sidebar Wrap Start -->
            <div class="col-lg-4 col-12 mb-5">
                <div class="sidebar-wrap">

                    <!-- Sidebar (Apply Buttons) End -->

                    <!-- Sidebar (Job Overview) Start -->
                    <div class="inner">
                        <h6 class="title"><%=poetry.getAuther().getName() %>
                        </h6>
                        <!--<div class="job-location-map google-map" id="job-location-map" data-lat="-37.8172835" data-long="144.9560768" data-zoom="12">

                            <span class="sr-only">Job Location Map</span>
                            <img src="static/picture/liuyuxi.png" alt="Site Logo">
                        </div>-->
                        <div>
                            <img src="static/picture/<%=poetry.getAuther().getRid() %>.png" alt="Site Logo">
                        </div>
                    </div>
                    <br>
                    <div class="sidebar-widget">
                        <div class="inner">
                            <h6 class="title">作者信息</h6>
                            <ul class="job-overview list-unstyled">
                                <li><strong>生卒年月:</strong> <%=poetry.getAuther().getBtd() %>
                                </li>
                                <li><strong>朝代:</strong> <%=poetry.getAuther().getDynasty() %>
                                </li>
                                <li><strong>作者简介:</strong> <%=poetry.getAuther().getInfo() %>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <!-- 加入收藏 -->
                    <%


                        boolean collectionis = poetryDao.collectionis(poetry.getRid(), account.getAcn_rid());
                        if (collectionis) {
                    %>
                    <div class="col-xl-auto col-lg-12 col-sm-auto col-12 p-2">
                        <a href="PoetryServlet?type=collection&PoetryId=<%=poetry.getRid() %>&userId=<%=account.getAcn_rid()%>&collectionis=<%=collectionis %>"
                           class="d-block btn btn-primary"><i class="fa fa-star-o mr-1"></i>取消收藏</a>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="col-xl-auto col-lg-12 col-sm-auto col-12 p-2">
                        <a href="PoetryServlet?type=collection&PoetryId=<%=poetry.getRid() %>&userId=<%=account.getAcn_rid()%>&collectionis=<%=collectionis %>"
                           class="d-block btn btn-primary"><i class="fa fa-star-o mr-1"></i>加入收藏</a>
                    </div>
                    <%
                        }
                    %>

                    <!-- 反馈错误 -->
                    <div class="col-xl-auto col-lg-12 col-sm-auto col-12 p-2">
                        <a href="../contact.jsp?PoetryId=<%=poetry.getRid()%>&PoetryName=<%=poetry.getTitle()%>"
                           class="d-block btn  btn-danger"><i class="fa fa-warning mr-1"></i>反馈错误 </a>
                    </div>
                    <!-- Sidebar (Job Overview) End -->

                    <!-- Sidebar (Job Location) Start -->
                    <div class="sidebar-widget">

                    </div>
                    <!-- Sidebar (Job Location) End -->
                </div>
            </div>
            <!-- Job Sidebar Wrap End -->

        </div>
    </div>
</div>
<!-- Recent Jobs End -->

<!-- 页面尾部 -->
<jsp:include page="../foot.jsp"></jsp:include>


<!-- JS============================================ -->

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