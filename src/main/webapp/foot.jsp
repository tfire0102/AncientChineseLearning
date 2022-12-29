<%@page import="com.example.ancientchineselearning.domain.Dynasty" %>
<%@page import="com.example.ancientchineselearning.dao.dynasty1Dao" %>
<%@page import="com.example.ancientchineselearning.domain.Poetry" %>
<%@page import="java.util.List" %>
<%@page import="com.example.ancientchineselearning.dao.Shiwen1Dao" %>
<%@page import="com.example.ancientchineselearning.domain.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>底部</title>
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
<!-- Footer Top Section Start -->
<div class="footer-top-section section">
    <div class="container">
        <div class="footer-widget-wrap row">

            <!-- Footer Widget Start -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="footer-widget">
                    <div class="footer-widget-about">
                        <img src="static/picture/logo.png" alt="">
                        <p>“古文斋”，专为更方便的学习文言文而生，它将是您学习过程中的一大助力。本项目由德世洋老师指导开发</p>

                        <ul class="footer-socail">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Footer Widget End -->

            <!-- Footer Widget Start -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="footer-widget">
                    <h6 class="title">快速联系我们</h6>
                    <div class="footer-widget-link">
                        <ul>
                            <li><a href="#">郅雪文</a></li>
                            <li><a href="#">刘晨曦</a></li>
                            <li><a href="#">芦燚</a></li>
                            <li><a href="#">高尉程</a></li>
                            <li><a href="#">德世洋</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Footer Widget End -->

            <!-- Footer Widget Start -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="footer-widget">
                    <h6 class="title">项目介绍</h6>
                    <div class="footer-widget-link">
                        <ul>
                            <li><a href="#">功能开发/测试人员</a></li>
                            <li><a href="#">开发人员</a></li>
                            <li><a href="#">项目经理</a></li>
                            <li><a href="#">UI设计/开发人员</a></li>
                            <li><a href="#">指导老师</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Footer Widget End -->

            <!-- Footer Widget Start -->
            <div class="col-lg-3 col-sm-6 col-12">
                <div class="footer-widget">
                    <h6 class="title">订阅</h6>
                    <div class="footer-widget-newsletter">
                        <p>订阅我们以获取所有最近的更新消息，本网站所有文章将保持更新。</p>
                        <form id="mc-form" class="mc-form">
                            <input id="mc-email" autocomplete="off" type="email" placeholder="请填写你的邮箱">
                            <button id="mc-submit" class="btn"><i class="fa fa-envelope-o"></i></button>
                        </form>
                        <!-- mailchimp-alerts Start -->
                        <div class="mailchimp-alerts text-centre">
                            <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                            <div class="mailchimp-success text-success"></div><!-- mailchimp-success end -->
                            <div class="mailchimp-error text-danger"></div><!-- mailchimp-error end -->
                        </div><!-- mailchimp-alerts end -->
                    </div>
                </div>
            </div>
            <!-- Footer Widget End -->

        </div>
    </div>
</div>
<!-- Footer Top Section End -->

<!-- Footer Bottom Section Start -->
<div class="footer-bottom-section section">
    <div class="container">
        <div class="row">

            <!-- Footer Copyright Start -->
            <div class="col-12">
                <p class="footer-copyright text-center">本页面由芦燚、高尉程、郅雪文、刘晨曦精心为您打造！<a target="_blank" href="#"></a></p>
            </div>
            <!-- Footer Copyright End -->

        </div>
    </div>
</div>
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