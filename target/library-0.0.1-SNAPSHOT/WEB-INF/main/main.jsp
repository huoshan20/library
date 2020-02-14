<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        .tree-closed {
            height : 40px;
        }
        .tree-expanded {
            height : auto;
        }
        .aa{
            color: #CC0000;
            size: 20px;
        }

    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">桌面</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${sessionScope.adminInfo.adminname} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="toupdatepassword" target="right"><i class="glyphicon glyphicon-cog"></i> 修改密码</a></li>
                            <li><a href="toupdateinfo" target="right"><i class="glyphicon glyphicon-cog"></i> 修改个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="logout"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
               <!-- 右侧菜单 -->
                <%--<%@ include file="/WEB-INF/commons/menu.jsp"%>--%>
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="${pageContext.request.contextPath}/main" target="right"><i class="glyphicon glyphicon-dashboard"></i> 桌面</a>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 借还书籍 <span class="badge" style="float:right">2</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/borrow" target="right"><i class="glyphicon glyphicon-user"></i> 借书</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/return" target="right"><i class="glyphicon glyphicon-king"></i> 还书</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <a href="${pageContext.request.contextPath}/reader" target="right"><i class="glyphicon glyphicon-dashboard"></i> 读者管理</a>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 图书管理 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/book" target="right"><i class="glyphicon glyphicon-picture"></i> 图书信息管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/bookshelf" target="right"><i class="glyphicon glyphicon-apple"></i> 书架管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/booktype" target="right"><i class="glyphicon glyphicon-asterisk"></i> 分类管理</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-search"></i> 信息查询 <span class="badge" style="float:right">2</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/borrowecord" target="right"><i class="glyphicon glyphicon-bishop"></i> 借还历史查询</a>
                            </li>
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/overdue" target="right"><i class="glyphicon glyphicon-book"></i> 逾期查询</a>
                            </li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.admin eq 'superadmin'}">
                    <li class="list-group-item tree-closed" >
                        <a href="${pageContext.request.contextPath}/admin" target="right"><i class="glyphicon glyphicon-adjust"></i> 管理员管理</a>
                    </li>
                    </c:if>
                </ul>
            </div>

        </div>

        <div>
            <iframe src="${pageContext.request.contextPath}/main" name="right" scrolling="auto" frameborder="0" width="100%" height="700px"></iframe>
        </div>
    </div>
</div>
<script src="../../jquery/jquery-2.1.1.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../script/docs.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
        $("li a").click(function () {
            $(this).css("color","red");
        })
    });
</script>
</body>
</html>
