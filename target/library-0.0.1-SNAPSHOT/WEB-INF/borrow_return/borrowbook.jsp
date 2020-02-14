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
        <li><a href="main">桌面</a></li>
        <li class="active">借书</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">借书<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
        <div class="panel-body">
            <form role="form" id="form1">
                <div class="form-group">
                    <label for="readerid">读者id</label>
                    <input type="text" class="form-control" id="readerid" name="readerid" placeholder="请输入读者id">
                </div>
                <div class="form-group">
                    <label for="bookid">书籍id</label>
                    <input type="text" class="form-control" id="bookid" name="bookid" placeholder="请输入书籍id">
                </div>
                <div class="form-group">
                    <label for="borrowdates">借书时间</label>
                    <select id="borrowdates" name="borrowdates" class="form-control">
                        <option id="option1" value="30" selected>一个月</option>
                        <option  value="45">45天</option>
                        <option  value="60">两个月</option>
                        <option  value="90">三个月</option>
                    </select>
                </div>

                <button type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 借书</button>
                <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
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
        $(".btn-success").click(function () {
         var data=   $("#form1").serialize();
            $.ajax({
                type : 'POST',
                url: "${pageContext.request.contextPath}/borrowbook",
                data : data,
                success: function (result) {
                    if (result.success) {
                        layer.msg("借书成功！", {time: 2000, icon: 6, shift: 5}, function () {
                        });
                        $("#bookid").val("");
                        $("#readerid").val("");
                        $("option").prop("selected",false);
                        $("#option1").prop("selected",true);
                    } else {
                        layer.msg("借书失败！", {time: 2000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
                }

            )
        });
    })


</script>
</body>
</html>
