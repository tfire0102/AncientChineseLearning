<%@ page import="java.util.List" %>
<%@ page import="com.example.ancientchineselearning.domain.Poetry" %><%--
  Created by IntelliJ IDEA.
  User: Fire016
  Date: 2022/12/25
  Time: 16:43
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
  <title>用户上传资源审核</title>
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
        <li class="breadcrumb-item active" style="color: #474137">资源审核</li>
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
          List<Poetry> poetries = (List<Poetry>) request.getAttribute("poetrys");
        %>
        <div class="job-list-toolbar">
          <p>此处显示<%=poetries.size()%>条记录</p>
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
            if (poetries != null) {
              for (Poetry poetry : poetries) {
          %>
          <!-- Job List Start -->
          <div class="job-list">
            <div class="company-logo col-auto">
              <img src="static/picture/company-1.png" alt="Company Logo">
            </div>
            <div class="salary-type col-auto order-sm-3">
              <a href="poemOperationServlet?type=agree&rid=<%=poetry.getRid()%>" class="badge btn-success" style="border-radius: 5px">发布</a>
              <a href="poemOperationServlet?type=refuse&rid=<%=poetry.getRid()%>" class="badge btn-danger" style="border-radius: 5px">违规</a>
            </div>
            <div class="content col">

              <h6 class="title">
                <a data-toggle="modal" data-target="#poemShowModal" data-target-sub="#poemShow"
                   onclick="ajaxProcess(<%=poetry.getRid()%>)"><%=poetry.getTitle()%></a>
              </h6>

              <ul class="meta">
                <li><strong class="text-primary"><%=poetry.getAuther().getName()%></strong></li>
                <li><strong>朝代：</strong><%=poetry.getAuther().getDynasty()%></li>
              </ul>
            </div>
          </div>
          <!-- Job List Start -->
          <%
              }
            } else {
          %>
          <span>当前还没有需要审核的资源</span>
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
  function changePoem(num) {
    <%--var index = document.getElementById("show");--%>
    <%--index.value = num;--%>
    <%--<%--%>
    <%--int index = Integer.parseInt(request.getParameter("index"));--%>
    <%--p = poetries.get(index);--%>
    <%--%>--%>
  }
  function ajaxProcess(obj) {
    creatXHR();
    var url = "AjaxServlet?poemID=" + obj;
    xhr.open("GET", url);
    xhr.send();

    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        var responseData = xhr.responseText.split("&");
        document.getElementById("poemTitle").innerText = responseData[1];
        document.getElementById("poemAuther").innerText = responseData[2];
        document.getElementById("poemDyn").innerText = responseData[3];
        document.getElementById("poemContent").value = responseData[4];
        document.getElementById("poemTranslate").value = responseData[5];
        document.getElementById("poemAppreciate").value = responseData[6];
        document.getElementById("poemNotes").value = responseData[7];
        document.getElementById("poemFamSentence").value = responseData[8];
      }
    }
  }

</script>
</body>

</html>