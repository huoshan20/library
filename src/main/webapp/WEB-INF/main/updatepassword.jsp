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
                <label for="oldpassword">原始密码</label>
                <input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="请输入原始密码">
            </div>
                <div class="form-group">
                    <label for="password1">新密码</label>
                    <input type="password" class="form-control" id="password1" name="password1" placeholder="请输入新密码 ">
                </div>
                <div class="form-group">
                    <label for="password2">确认新密码</label>
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="请输入新密码">
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
            if ($("#password1").val()!=$("#password2").val()) {
                layer.msg("两次新密码不一致！", {time:2000, icon:5, shift:6}, function(){
                    //alert("回调方法执行了！");
                });
                return;
            }
            var data =$("#form1").serialize();
            var loadingIndex = null;
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/updatepassword",
                data : data,
                beforeSend : function(){
                    loadingIndex = layer.msg('正在修改，请稍后', {icon: 16});
                },
                success : function(result){
                    layer.close(loadingIndex);
                    if(result.success){
                     if (result.data==0) {
                         layer.msg("原密码错误！", {time:2000, icon:5, shift:6}, function(){
                             //alert("回调方法执行了！");
                         });
                     }else {
                         history.go(-1);
                     }

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
