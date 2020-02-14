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
    <ol class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">数据列表</a></li>
        <li class="active">修改</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
        <div class="panel-body">
            <form role="form" id="form1">
                <input type="hidden" name="bookshelfid" value="${requestScope.bookshelf.bookshelfid}"/>
                <div class="form-group">
                    <label for="bookshelfname">书架名</label>
                    <input type="text" class="form-control" id="bookshelfname" name="bookshelfname" placeholder="请输入书架名" value="${bookshelf.bookshelfname}">
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
                url : "${pageContext.request.contextPath}/bookshelfupdate",
                data : data,
                beforeSend : function(){
                    loadingIndex = layer.msg('正在修改，请稍后', {icon: 16});
                },
                success : function(result){
                    layer.close(loadingIndex);
                    if(result.success){
                        // 保存成功   跳转页面
                        location.href = "${pageContext.request.contextPath}/bookshelf";
                    }else{
                        // 保存失败  提示
                        layer.msg("修改失败！", {time:2000, icon:5, shift:6}, function(){
                            //alert("回调方法执行了！");
                        });
                    }
                }
            });
    });
        if ($("#option1").prop("selected")) {
            $("#div1").css("display","none");
            $("#div2").css("display","none");
        }else{
            $("#div1").css("display","inline");
            $("#div2").css("display","inline");
        }
        $("#bookshelftype").change(function () {
            if ($("#option1").prop("selected")) {
                $("#div1").css("display","none");
                $("#div2").css("display","none");
            }else{
                $("#div1").css("display","inline");
                $("#div2").css("display","inline");
            }
        })
    })


</script>
</body>
</html>
