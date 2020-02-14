<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
        </div>
        <div class="panel-body">
            <form class="form-inline" role="form" style="float:left;">
                <div class="form-group has-feedback">
                    <div class="input-group">
                        <div class="input-group-addon">查询条件</div>
                        <input class="form-control has-success" type="text" id="queryLikeInput"
                               placeholder="请输入id">
                    </div>
                </div>
                <button type="button" class="btn btn-warning" id="queryLikeBtn"><i
                        class="glyphicon glyphicon-search"></i> 查询
                </button>
            </form>
            <button type="button" id="email" class="btn btn-success" style="float:right;margin-left:10px;">
                <i
                        class=" glyphicon glyphicon-plus"></i> 发送邮件给逾期用户
            </button>
            <br>
            <hr style="clear:both;">
            <div class="table-responsive">
                <table class="table  table-bordered">
                    <thead>
                    <tr>
                        <th width="30">#</th>
                        <th>读者姓名</th>
                        <th>书籍名</th>
                        <th>借书日期</th>
                        <th>约定还书日期</th>

                    </tr>
                    </thead>
                    <tbody id="borrowsData">
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="6" align="center">
                            <ul class="pagination">
                            </ul>
                        </td>
                    </tr>

                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>


<script src="../../jquery/jquery-2.1.1.min.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../script/docs.min.js"></script>
<script src="../../layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $("#email").click(function () {
            $.ajax({
                type: 'POST',
                url: "${pageContext.request.contextPath}/sendemail",
                data: {
                },
                beforeSend: function () {
                    loadingIndex = layer.msg('正在发送邮件，请稍后', {icon: 16});
                },
                success: function (result) {
                    layer.close(loadingIndex);
                    if (result.success) {
                        layer.msg("发送邮件成功！", {time: 2000, icon: 5, shift: 6}, function () {
                            //alert("回调方法执行了！");
                        });
                    } else {
                        layer.msg("发送邮件失败！", {time: 2000, icon: 5, shift: 6}, function () {
                            //alert("回调方法执行了！");
                        });
                    }
                }
            });
        });
        pageQuery(1);
        console.log(new Date().format("yyyy-MM-dd"));
        $("#queryLikeBtn").click(function () {
            pageQuery(1);
        });

    });

    function pageQuery(pageNo) {
        var queryLikeStr = $("#queryLikeInput").val();
        var loadingIndex = null;
        $.ajax({
            type: 'POST',
            url: "${pageContext.request.contextPath}/overdueajaxQuery",
            data: {
                pageNo: pageNo,
                queryLikeStr: queryLikeStr,
                time: new Date()
            },
            beforeSend: function () {
                loadingIndex = layer.msg('正在加载数据，请稍后', {icon: 16});
            },
            success: function (result) {
                layer.close(loadingIndex);
                if (result.success) {
                    //console.log(result.data);
                    var borrows = result.data.list;
                    var borrowsStr = "";
                    var pageStr = "";
                    for (var i = 0; i < borrows.length; i++) {
                        var borrow = borrows[i];
                        borrowsStr += '<tr>';
                        borrowsStr += '    <td>' + (i + 1) + '</td>';
                        borrowsStr += '        <td>' + borrow.reader.readname + '</td>';
                        borrowsStr += '        <td>' + borrow.book.bookname + '</td>';
                        borrowsStr += '        <td>' + borrow.borrowdate + '</td>';
                        borrowsStr += '        <td>' + borrow.expiredate + '</td>';
                        borrowsStr += '</tr>';
                    }

                    if (pageNo > 1) {
                        pageStr += '<li><a href="#" onclick="pageQuery(' + (pageNo - 1) + ')">上一页</a></li>';
                    } else {
                        pageStr += '<li class="disabled"><a href="#">上一页</a></li>';
                    }
                    for (var i = 1; i <= result.data.totalPageNo; i++) {
                        if (pageNo == i) {
                            pageStr += '<li class="active"><a href="#">' + i + '<span class="sr-only">(current)</span></a></li>';
                        } else {
                            pageStr += '<li><a href="#" onclick="pageQuery(' + i + ')">' + i + '</a></li>';
                        }
                    }
                    if (pageNo < result.data.totalPageNo) {
                        pageStr += '<li><a href="#" onclick="pageQuery(' + (pageNo + 1) + '">下一页</a></li>';
                    } else {
                        pageStr += '<li class="disabled"><a href="#">下一页</a></li>';
                    }

                    $(".pagination").html(pageStr);
                    $("#borrowsData").html(borrowsStr);
                } else {
                    layer.msg("查询数据失败！", {time: 2000, icon: 5, shift: 6}, function () {
                        //alert("回调方法执行了！");
                    });
                }
            }
        });
    }




</script>
</body>
</html>
