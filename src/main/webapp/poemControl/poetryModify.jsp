<%@ page import="java.util.List" %>
<%@ page import="com.example.ancientchineselearning.domain.Dynasty" %>
<%@ page import="com.example.ancientchineselearning.domain.Poetry" %><%--
  Created by IntelliJ IDEA.
  User: Fire016
  Date: 2022/12/26
  Time: 23:53
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
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>资源搜索修改</title>
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


<div class="loginSignupModal modal fade" id="poemChangeModal" tabindex="-1" role="dialog" aria-labelledby="poemChangeModal" aria-hidden="true">
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
                    <form name="show" id="show" action="poemControlServlet?type=update" method="post">
                        <div class="row mb-n3">
                            <div class="col-12 mb-3">
                                <input class="hidden" id="poemID" name="poemID" value="">
                                <table width="100%"  border="1" bordercolor="#B69E72" align="center">
                                <tbody>
                                <tr>
                                    <td width="15%" align="right">内容：</td>
                                    <td width="85%">
                                        <textarea style="resize: none" rows="6" id="poemContent" name="poemContent" value=""></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">翻译：</td>
                                    <td>
                                        <textarea style="resize: none" rows="6" id="poemTranslate" name="poemTranslate" value=""></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">鉴赏：</td>
                                    <td>
                                        <textarea style="resize: none" rows="6" id="poemAppreciate" name="poemAppreciate" value="鉴赏"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">注释：</td>
                                    <td>
                                        <textarea style="resize: none" rows="6" id="poemNotes" name="poemNotes" value="注释"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">名句：</td>
                                    <td>
                                        <textarea style="resize: none" rows="2" id="poemFamSentence" name="poemFamSentence" value="名句"></textarea>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            </div>
                            <div class="col-12 mb-3">
                                <div class="col-sm-12 col-sm-offset-3">
                                    <div align="center">
                                        <input type="submit" class="btn btn-primary" style="border-radius: 5px; border-color: black" value="提交">
                                        <input type="button" class="btn btn-link" style="border-radius: 5px; border-color: black" value="取消" aria-hidden="true" >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Page Heading Section Start -->
<div class="page-heading-section section bg-parallax"
     data-bg-image="assets/images/slider/slider-2.jpg" data-overlay="15">
    <div class="container">
        <div class="page-heading-content text-center">
            <%--      <h3 class="title">用户上传资源审核界面</h3>--%>
            <h2 class="title" style="font-size: 80px;color: #4A3904;font-family: 华文行楷">传承中华传统文化</h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item" style="color: #474137"><a href="index.jsp" style="color: #474137">主页</a>
                </li>
                <li class="breadcrumb-item active" style="color: #474137">资源修改</li>
            </ol>
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
                <form action="#">
                    <div class="row mb-n4">

                        <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                            <input id="poemName" type="text" placeholder="通过诗文题目查询">
                        </div>

                        <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                            <input id="autherName" type="text" placeholder="通过作者查询">
                        </div>

                        <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                            <select id="dynastyID">
                                <option disabled="disabled" style="display: none" value="-1" selected>通过朝代查询</option>
                                <%
                                    List<Dynasty> dynastyList = (List<Dynasty>) request.getAttribute("dynastyList");
                                    if (dynastyList != null) {
                                        for (Dynasty dynasty : dynastyList) {
                                %>
                                <option value="<%=dynasty.getRid()%>"><%=dynasty.getContent()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>

                        <div class="col-lg-auto col-sm-6 col-12 flex-grow-1 mb-4">
                            <a href="javascript:search()" class="btn btn-primary" style="background-color: #B69E72;border-color: #B69E72">搜索</a>
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

                <%
                    int num = 0;
                    List<Poetry> poetryList = (List<Poetry>) request.getAttribute("poetryList");
                    if (poetryList != null) num = poetryList.size();
                %>
                <!-- Job List Toolbar Start -->
                <div class="job-list-toolbar">
                    <p>在库中搜索到&emsp;<%=num%>&emsp;条数据</p>
                </div>
                <!-- Job List Toolbar End -->

                <!-- Job List Wrap Start -->
                <div class="job-list-wrap">

                    <%
                        if (num != 0) {
                            for (Poetry poetry : poetryList) {
                    %>
                    <a class="job-list" data-toggle="modal" data-target="#poemChangeModal"
                       data-target-sub="#poemChange" onclick="ajaxProcess(<%=poetry.getRid()%>)">
                        <div class="company-logo col-auto">
                            <img src="static/picture/company-6.png" alt="Company Logo">
                        </div>
                        <div class="salary-type col-auto order-sm-3">
                            <button class="badge btn-info" style="border-radius : 30px">修改</button>
                        </div>
                        <div class="content col">
                            <h6 class="title"><%=poetry.getTitle()%></h6>
                            <ul class="meta">
                                <li><strong class="text-primary">作者：<%=poetry.getAuther().getName()%></strong></li>
                                <li><strong>朝代：<%=poetry.getAuther().getDynasty()%></strong></li>
                                <li><span class="salary-range">喜欢：<%=poetry.getNumOfLike()%></span></li>
                            </ul>
                        </div>
                    </a>
                    <%
                            }
                        } else {
                    %>
                    <div style="margin: 0 auto">
                        <p style="font-size: 20px;text-align: center">当前未查到任何数据</p>
                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- Job List Wrap Start -->

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
<script>
    var xhr = false;
    function creatXHR() {
        try {
            xhr = new XMLHttpRequest();
        } catch (e) {
            try {
                xhr = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                xhr = false;
            }
        }
        if (!xhr) {
            alert("初始化XMLHttpRequest对象失败")
        }
    }
    function ajaxProcess(obj) {
        creatXHR();
        var url = "AjaxServlet?poemID=" + obj;
        xhr.open("GET", url);
        xhr.send();

        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var responseData = xhr.responseText.split("&");
                document.getElementById("poemID").value = responseData[0];
                document.getElementById("poemTitle").innerText = responseData[1];
                document.getElementById("poemAuther").innerText = responseData[2];
                document.getElementById("poemDyn").innerText = responseData[3];
                document.getElementById("poemContent").innerHTML = responseData[4];
                document.getElementById("poemTranslate").value = responseData[5];
                document.getElementById("poemAppreciate").value = responseData[6];
                document.getElementById("poemNotes").value = responseData[7];
                document.getElementById("poemFamSentence").value = responseData[8];
            }
        }
    }
    function search() {
        var poemName = document.getElementById("poemName").value;
        var autherName = document.getElementById("autherName").value;
        var dynasty = document.getElementById("dynastyID");
        var dynastyIndex = dynasty.selectedIndex;
        var dynastyID = dynasty.options[dynastyIndex].value;
        window.location.href = "poemControlServlet?type=change&poemName=" + poemName +
            "&autherName=" + autherName + "&dynastyID=" + dynastyID;
    }

</script>
</body>

</html>
