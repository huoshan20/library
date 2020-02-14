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
                               placeholder="请输入类型名">
                    </div>
                </div>
                <button type="button" class="btn btn-warning" id="queryLikeBtn"><i
                        class="glyphicon glyphicon-search"></i> 查询
                </button>
            </form>

            <br>
            <hr style="clear:both;">
            <div class="table-responsive">
                <table class="table  table-bordered">
                    <thead>
                    <tr>
                        <th width="30">#</th>
                        <th>id</th>
                        <th>读者姓名</th>
                        <th>书籍名</th>
                        <th>借书日期</th>
                        <th>约定还书日期</th>
                        <th>还书日期</th>
                        <th>罚款金额</th>
                    </tr>
                    </thead>
                    <tbody id="borrowecordsData">
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="9" align="center">
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
        pageQuery(1);

        $("#queryLikeBtn").click(function () {
            pageQuery(1);
        });

    });

    function pageQuery(pageNo) {
        var queryLikeStr = $("#queryLikeInput").val();
        var loadingIndex = null;
        $.ajax({
            type: 'POST',
            url: "${pageContext.request.contextPath}/borrowecordajaxQuery",
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
                    var borrowecords = result.data.list;
                    var borrowecordsStr = "";
                    var pageStr = "";
                    for (var i = 0; i < borrowecords.length; i++) {
                        var borrowecord = borrowecords[i];
                        borrowecordsStr += '<tr>';
                        borrowecordsStr += '    <td>' + (i + 1) + '</td>';
                        borrowecordsStr += '        <td>' + borrowecord.borrowecordid + '</td>';
                        borrowecordsStr += '        <td>' + borrowecord.reader.readname + '</td>';
                        borrowecordsStr += '        <td>' + borrowecord.book.bookname + '</td>';
                        borrowecordsStr += '        <td>' + borrowecord.borrowdate + '</td>';
                        borrowecordsStr += '        <td>' + borrowecord.expiredate + '</td>';
                        borrowecordsStr += '        <td>' + borrowecord.returndate + '</td>';
                        if (borrowecord.fine==null){
                            borrowecordsStr += '        <td>' +'无' + '</td>';
                        }else {
                            borrowecordsStr += '        <td>' + borrowecord.fine.overduemoney + '</td>';
                        }
                        borrowecordsStr += '</tr>';
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
                    $("#borrowecordsData").html(borrowecordsStr);
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
