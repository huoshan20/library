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
        <li class="active">新增</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
        <div class="panel-body">
            <form role="form" id="form1">
                <div class="form-group">
                    <label for="readername">读者姓名</label>
                    <input type="text" class="form-control" id="readername" name="readname" placeholder="请输入角色名称">
                </div>
                <div class="form-group">
                    <label for="sex">读者性别</label>
                    <select id="sex" class="form-control" name="sex">
                        <option value="0">女</option>
                        <option value="1">男</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="readertype">读者类型</label>
                    <select id="readertype" class="form-control" name="readertype">
                        <option value="学生">学生</option>
                        <option id="option1" value="老师">老师</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="readertel">电话</label>
                    <input type="text" class="form-control" id="readertel" name="readertel" placeholder="请输入电话">
                </div>
                <div class="form-group">
                    <label for="qq">qq</label>
                    <input type="text" class="form-control" id="qq" name="qq" placeholder="请输入qq">
                </div>
                <div class="form-group">
                    <label for="sfz">身份证</label>
                    <input type="text" class="form-control" id="sfz" name="sfz" placeholder="请输入身份证">
                </div>
                <div class="form-group" id="div2">
                    <label for="department">学院</label>
                    <input type="text" class="form-control" id="department" name="department" placeholder="请输入学院">
                </div>
                <div class="form-group" id="div1">
                    <label for="readerclass">班级</label>
                    <input type="text" class="form-control" id="readerclass" name="readerclass" placeholder="请输入班级">
                </div>
                <div class="form-group">
                    <label for="readeraddress">地址</label>
                    <input type="text" class="form-control" id="readeraddress" name="readeradress" placeholder="请输入地址">
                </div>

                <button type="button" id="saveBtn" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                <button type="reset" id="resetBtn" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
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
        $("#saveBtn").click(function(){
            var data =$("#form1").serialize();

           
            var loadingIndex = null;
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/readeradd",
                data : data,
                beforeSend : function(){
                    loadingIndex = layer.msg('正在保存，请稍后', {icon: 16});
                },
                success : function(result){
                    layer.close(loadingIndex);
                    if(result.success){
                        // 保存成功   跳转页面
                        location.href = "${pageContext.request.contextPath}/reader";
                    }else{
                        // 保存失败  提示
                        layer.msg("保存失败！", {time:2000, icon:5, shift:6}, function(){
                            //alert("回调方法执行了！");
                        });
                    }
                }
            });
         });
$("#readertype").change(function () {
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
