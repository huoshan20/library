<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020-01-05
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">桌面</h1>

    <div class="row placeholders" style="margin: 0 0 0 15%;">
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/sky"  class="img-responsive" alt="Generic placeholder thumbnail">
            <h4>已完成借书数</h4>
            <span class="text-muted aa">${requestScope.bookecords}</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
            <h4>当前借书数</h4>
            <span class="text-muted aa">${requestScope.borrows}</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
            <h4>逾期数</h4>
            <span class="text-muted aa">${requestScope.overduo}</span>
        </div>
    </div>
</div>
</body>
<script src="../../jquery/jquery-2.1.1.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../script/docs.min.js"></script>
</html>
