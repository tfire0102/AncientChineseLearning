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
    <title>上传资源</title>
    <base href="<%=basePath%>">
    <meta name="robots" content="noindex, follow">
    <meta name="description" content="">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<div class="page-heading-section section bg-parallax"
     data-bg-image="assets/images/bg/jinju.jpg" data-overlay="20">
    <div class="container">
        <div class="page-heading-content text-center">
            <h3 class="title">上传资源</h3>
        </div>
    </div>
</div>
<!-- Page Heading Section End -->

<!-- FAQ'S Section Start -->


<div class="section section-padding">

    <div class="container">

        <div class="row">

            <div class="col-lg-10 col-12 mx-auto">

                <div class="faq-card card">
                    <div class="card-header"
                         style="margin-left: 450px; margin-top: 20px;">
                        <h4>上传信息</h4>
                    </div>
                    <div class="company-logo col-auto" align="left">

                        <div class="content col" style="margin: auto">
                            <form action="PoetryServlet?type=update" method="post">
                                <table bgcolor="#EEEEEE" width="100%">
                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">古诗题目</p></strong></th>
                                        <td><input type="text" name="pty_ttl" id="pty_ttl"
                                                   value=""></td>
                                    </tr>

                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">古诗作者</p></strong></th>
                                        <td><input type="text" name="pty_atr" id="pty_atr"
                                                   value=""></td>
                                    </tr>

                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">诗词内容</p></strong></th>
                                        <td><textarea name="pty_cot" id="pty_cot" value=""
                                                      style="resize: none"> </textarea></td>
                                    </tr>

                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">诗词翻译</p></strong></th>
                                        <td><textarea name="pty_tst" id="pty_tst" value=""
                                                      style="resize: none"> </textarea></td>
                                    </tr>

                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">诗词鉴赏</p></strong></th>
                                        <td><textarea name="pty_apt" id="pty_apt" value=""
                                                      style="resize: none"> </textarea></td>
                                    </tr>

                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">诗词注释</p></strong></th>

                                        <td><textarea name="pty_not" id="pty_not" value=""
                                                      style="resize: none"> </textarea></td>
                                    </tr>

                                    <tr>
                                        <th><strong><p
                                                style="font-size: 20px; text-align: center">名句名言</p></strong></th>
                                        <td><textarea name="pty_fam" id="pty_fam" value=""
                                                      style="resize: none"> </textarea></td>
                                    </tr>
                                </table>

                                <div style="margin-left: 400px;">


                                    <div class="btn-group mt-4 mr-2 btn-group-lg"
                                         style="text-align: center">
                                        <input class="btn btn-primary px-5" type="submit"
                                               value="上传资源">
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<jsp:include page="../foot.jsp"></jsp:include>
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