<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            cursor: pointer;
        }

        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #C00;
        }
    </style>
</head>

<body>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <ol class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">数据列表</a></li>
        <li class="active">修改</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
        <div class="panel-body">
            <form role="form" id="form1">
                <input type="hidden" name="readid" value="${requestScope.book.bookid}"/>
                <div class="form-group">
                    <label for="booktypeid">书籍类型</label>
                    <select id="booktypeid" class="form-control" name="booktypeid">
                        <c:forEach var="booktype" items="${requestScope.booktypes}">
                            <option value="${booktype.booktypeid}" ${booktype.booktypeid==book.booktypeid?"'selected'":""}>${booktype.booktypename}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bookshelfid">所在书架</label>
                    <select id="bookshelfid" class="form-control" name="bookshelfid">
                        <c:forEach var="bookshelf" items="${bookshelfs}">
                            <option value="${bookshelf.bookshelfid}"${bookshelf.bookshelfid==book.bookshelfid?"selected":""}>${bookshelf.bookshelfname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bookname">书籍名</label>
                    <input type="text" class="form-control" id="bookname" name="bookname" value="${book.bookname}" placeholder="请输入书籍名">
                </div>
                <div class="form-group">
                    <label for="author">作者</label>
                    <input type="text" class="form-control" id="author" name="author" value="${book.author}" placeholder="请输入作者">
                </div>
                <div class="form-group">
                    <label for="publishdate">出版日期</label>

                    <input type="text" class="form-control" id="publishdate" name="publishdate" value="<fmt:formatDate value="${book.publishdate}" pattern="yyyy-MM-dd"></fmt:formatDate>" placeholder="请输入出版日期">
                </div>
                <div class="form-group" id="div2">
                    <label for="content">内容简介</label>
                    <input type="text" class="form-control" id="content" name="content" value="${book.content}" placeholder="请输入内容简介">
                </div>
                <div class="form-group" id="div1">
                    <label for="price">价格</label>
                    <input type="text" class="form-control" id="price" name="price" value="${book.price}" placeholder="请输入价格">
                </div>
                <div class="form-group">
                    <label for="isbn">isbn码</label>
                    <input type="text" class="form-control" id="isbn" name="isbn" value="${book.isbn}" placeholder="请输入isbn码">
                </div>
                <div class="form-group">
                    <label for="translator">译者</label>
                    <input type="text" class="form-control" id="translator" name="translator" value="${book.translator}" placeholder="请输入译者">
                </div>
                <div class="form-group">
                    <label for="publisher">出版社</label>
                    <input type="text" class="form-control" id="publisher" name="publisher" value="${book.publisher}" placeholder="请输入出版社">
                </div>

                <button type="button" id="updateBtn" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
                <button type="reset" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
            </form>
        </div>
    </div>
</div>


<script src="../../jquery/jquery-2.1.1.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../script/docs.min.js"></script>
<script src="../../layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $("#updateBtn").click(function(){
            var data =$("#form1").serialize();


            var loadingIndex = null;
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/bookupdate",
                data : data,
                beforeSend : function(){
                    loadingIndex = layer.msg('正在修改，请稍后', {icon: 16});
                },
                success : function(result){
                    layer.close(loadingIndex);
                    if(result.success){
                        // 保存成功   跳转页面
                        location.href = "${pageContext.request.contextPath}/book";
                    }else{
                        // 保存失败  提示
                        layer.msg("修改失败！", {time:2000, icon:5, shift:6}, function(){
                            //alert("回调方法执行了！");
                        });
                    }
                }
            });
    });

    })


</script>
</body>
</html>
