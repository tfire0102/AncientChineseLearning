<%@page language="java" import="java.util.*"%>
<%@page import="com.example.ancientchineselearning.domain.Poetry"%>
<%@page import="com.example.ancientchineselearning.dao.Poetry3Dao"%>
<%@page import="com.example.ancientchineselearning.domain.Auther"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ancientchineselearning.dao.Auther3Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>诗人列表</title>
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
		data-bg-image="assets/images/bg/bg-1.jpg" data-overlay="50">
		<div class="container">
			<div class="page-heading-content text-center">
				<h3 class="title">作者展示</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">主页</a></li>

				</ol>
			</div>
		</div>
	</div>
	<!-- Page Heading Section End -->

	<!-- Company List Start -->
	<div class="section section-padding">
		<div class="container">
			<div class="row mb-n5">

				<div class="col-lg-8 col-12 mb-5 pr-lg-5">

					<!-- Company List Wrap Start -->
					<div class="company-list-wrap row">
						<%
						
                    Auther3Dao dao = new Auther3Dao();
                  				List<Auther> autherList = dao.getAutherList();
                  				if (autherList != null) {
                  					for(Auther auther : autherList){
                    %>
						<!-- Company List Start -->
						<div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-12">
							<a href="AutherServlet?type=xiangqing&ID=<%=auther.getRid() %>"
								class="company-list"> <span class="company-logo"><img
									src="static/picture/company-1.png" alt="company-1"></span>
								<h6 class="title"><%=auther.getName()%></h6> <span
								class="open-job"><%=auther.getDynasty()%></span> <span
								class="location"><i class="fa fa-moon-o"></i>查看</span>
							</a>
						</div>
						<%
								}
							}
						%>
						<!-- <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>
						模态框（Modal） -->


						<%-- <!-- Company List Start -->
                        <div class="col-xl-4 col-lg-6 col-md-4 col-sm-6 col-12">
                            <a href="company-single.html" class="company-list">
                                <span class="company-logo"><img src="static/picture/company-2.png" alt="company-1"></span>
                                <h6 class="title"><%=auther.getName()%></h6>
                                <span class="open-job">1 open positions</span>
                                <span class="location"><i class="fa fa-map-o"></i>Dhaka, Bangladesh</span>
                            </a>
                        </div> --%>
						<!-- Company List Wrap Start -->
					</div>
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
				</div>


				<!-- Company Sidebar Wrap Start -->
				<div class="col-lg-4 col-12 mb-5">
					<div class="sidebar-wrap">
						<!-- Sidebar (Search) Start -->
						<div class="sidebar-widget">
							<div class="inner">
								<h6 class="title">搜索</h6>
								<form action="#">
									<div class="row">
										<div class="col-12 mb-3">
											<input type="text" placeholder="输入内容">
										</div>
										<div class="col-12 mb-3">
											<label>按朝代搜索</label> <select>
												<option value="1">唐</option>
												<option value="2">宋</option>
												<option value="3">元</option>
												<option value="4">明</option>
												<option value="5">清</option>

											</select>
										</div>


										<div class="col-12 mb-3">
											<input class="btn btn-primary w-100" type="submit" value="搜索">
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- Sidebar (Search) End -->


						<!-- Sidebar (Search) End -->
					</div>
				</div>
				<!-- Company Sidebar Wrap End -->

			</div>
		</div>
	</div>
	<!-- Company List End -->

	<!-- Footer Top Section Start -->
	<jsp:include page="foot.jsp"></jsp:include>
	<!-- Footer Top Section End -->

	<!-- Footer Bottom Section Start -->
	
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