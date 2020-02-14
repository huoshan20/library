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
            <button type="button" id="deletebooktypes" class="btn btn-danger" style="float:right;margin-left:10px;">
                <i
                        class=" glyphicon glyphicon-remove"></i> 删除
            </button>
            <button type="button" class="btn btn-primary" style="float:right;"
                    onclick="window.location.href='${pageContext.request.contextPath}/booktypetoadd'"><i
                    class="glyphicon glyphicon-plus"></i> 新增
            </button>
            <br>
            <hr style="clear:both;">
            <div class="table-responsive">
                <table class="table  table-bordered">
                    <thead>
                    <tr>
                        <th width="30">#</th>
                        <th width="30"><input type="checkbox" id="booktypeCheckBox"></th>
                        <th>id</th>
                        <th>名字</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody id="booktypesData">
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="4" align="center">
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

        $("#booktypeCheckBox").click(function () {
            var flag = this.checked;
            var $checkedBoxs = $("#booktypesData input:checkbox");
            $.each($checkedBoxs, function (i, box) {
                box.checked = flag;
            });
        });

        $("#deletebooktypes").click(function () {

            // 获取到选中用户的所有 id
            var data = $("input[name='booktypeIds']:checked").serialize();

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/deletebooktypes",
                data: data,
                success: function (result) {
                    if (result.success) {
                        layer.msg("批量删除成功！", {time: 2000, icon: 6, shift: 5}, function () {
                            //alert("回调方法执行了！");
                            pageQuery(1);
                        });
                    } else {
                        layer.msg("批量删除失败！", {time: 2000, icon: 5, shift: 6}, function () {
                            //alert("回调方法执行了！");
                        });
                    }
                }
            });

        });
    })

    $("tbody .btn-primary").click(function () {
        alert("aa");
        window.location.href = "${pageContext.request.contextPath}/booktypetoadd";
    });

    function pageQuery(pageNo) {
        var queryLikeStr = $("#queryLikeInput").val();
        var loadingIndex = null;
        $.ajax({
            type: 'POST',
            url: "${pageContext.request.contextPath}/booktypeajaxQuery",
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
                    var booktypes = result.data.list;
                    var booktypesStr = "";
                    var pageStr = "";
                    for (var i = 0; i < booktypes.length; i++) {
                        var booktype = booktypes[i];
                        booktypesStr += '<tr>';
                        booktypesStr += '    <td>' + (i + 1) + '</td>';
                        booktypesStr += '    <td><input type="checkbox" name="booktypeIds" value="' + booktype.booktypeid + '"></td>';
                        booktypesStr += '        <td>' + booktype.booktypeid + '</td>';
                        booktypesStr += '        <td>' + booktype.booktypename + '</td>';
                        booktypesStr += '        <td>';
                        booktypesStr += '    <button type="button" onclick="toUpdate(' + booktype.booktypeid + ')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                        booktypesStr += '    <button type="button" onclick="deletebooktype(' + booktype.booktypeid + ',\'' + booktype.booktypename + '\')"   class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                        booktypesStr += '    </td>';
                        booktypesStr += '</tr>';
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
                    $("#booktypesData").html(booktypesStr);
                } else {
                    layer.msg("查询数据失败！", {time: 2000, icon: 5, shift: 6}, function () {
                        //alert("回调方法执行了！");
                    });
                }
            }
        });
    }

    $("#queryLikeBtn").click(function () {
        pageQuery(1);
    });

    function toUpdate(id) {
        location.href = "${pageContext.request.contextPath}/booktypetoUpdate?booktypeid=" + id;
    }

    function deletebooktype(id, booktypeName) {

        layer.confirm("您确定是否要删除" + booktypeName + "信息吗?", {icon: 3, title: '提示'}, function (cindex) {
            var loadingIndex = null;
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/deletebooktype",
                data: {
                    id: id

                },
                beforeSend: function () {
                    loadingIndex = layer.msg('正在刪除数据，请稍后', {icon: 16});
                },
                success: function (result) {
                    layer.close(loadingIndex);
                    if (result.success) {
                        // 提示刪除成功
                        layer.msg("刪除成功！", {time: 2000, icon: 6}, function () {
                            //alert("回调方法执行了！");
                        });
                        pageQuery(1);
                    } else {
                        layer.msg("刪除失败！", {time: 2000, icon: 5, shift: 3}, function () {
                            //alert("回调方法执行了！");
                        });
                    }
                }
            });
            layer.close(cindex);
        }, function (cindex) {
            layer.close(cindex);
        });
    }



</script>
</body>
</html>
