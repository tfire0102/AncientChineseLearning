<%@ page import="com.example.ancientchineselearning.domain.Feedback" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Fire016
  Date: 2022/12/28
  Time: 17:30
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
    <title>用户反馈</title>
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
                <li class="breadcrumb-item" style="color: #474137"><a href="index.html" style="color: #474137">主页</a></li>
                <li class="breadcrumb-item active" style="color: #474137">用户反馈</li>
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
                    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbacks");
                %>
                <div class="job-list-toolbar">
                    <p>此处显示<%=feedbackList.size()%>条记录</p>
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
                        if (feedbackList != null) {
                            for (Feedback feedback : feedbackList) {
                    %>
                    <!-- Job List Start -->
                    <div class="job-list col-10 row">
                        <div class="content col">
                            <h6 class="title">
                                <%=feedback.getAccount()%>【<span><%=feedback.getPoemName()%></span>】
                            </h6>
                            <textarea style="resize: none" rows="3" readonly><%=feedback.getConnect()%></textarea>

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

                <div class="loginSignupModal modal fade" id="poemShowModal" tabindex="-1" role="dialog" aria-labelledby="poemShowModal" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <div>
                                    <div class="col-12 mb-3">
                                        <strong><span id="poemTitle" style="font-size: 24px">题目</span></strong>
                                    </div>
                                    <div class="col-12 mb-3" style="margin: 0 auto">
                                        <strong><span id="poemAuther" class="text-primary">诗人</span></strong>&emsp;&emsp;
                                        <strong>朝代：</strong><span id="poemDyn">朝代</span>
                                    </div>
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="tab-content" id="poemChange">
                                    <form name="show" id="show">
                                        <div class="row mb-n3">
                                            <div class="col-12 mb-3">
                                                <table width="100%"  border="1" bordercolor="#B69E72" align="center">
                                                    <tbody>
                                                    <tr>
                                                        <td width="15%" align="right">内容：</td>
                                                        <td width="85%">
                                                            <textarea style="resize: none" rows="6" id="poemContent" value="" readonly></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">翻译：</td>
                                                        <td>
                                                            <textarea style="resize: none" rows="6" id="poemTranslate" value="" readonly></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">鉴赏：</td>
                                                        <td>
                                                            <textarea style="resize: none" rows="6" id="poemAppreciate" value="鉴赏" readonly></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">注释：</td>
                                                        <td>
                                                            <textarea style="resize: none" rows="6" id="poemNotes" value="注释" readonly></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">名句：</td>
                                                        <td>
                                                            <textarea style="resize: none" rows="2" id="poemFamSentence" value="名句" readonly></textarea>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

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
