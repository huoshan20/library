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
        <li class="active">还书</li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">还书<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
        <div class="panel-body">
            <form role="form" id="form1">
                <div class="form-group">
                    <label for="readerid">用户id</label>
                    <input type="text" class="form-control" id="readerid" name="readerid" placeholder="请输入用户id">
                </div>
                <div class="form-group">
                    <label for="bookid">需要还的书籍名</label>
                    <select multiple class="form-control" id="bookid" name="bookids">

                    </select>
                </div>

                <button  id="button1" type="button" class="btn btn-success"><i class="glyphicon glyphicon-btc"></i> 还书</button>
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
    $("#readerid").blur(function () {
        var readerid=$("#readerid").val();
       $.post("${pageContext.request.contextPath}/getborrowbooks",{"readerid":readerid},function (result) {
           if (result.success) {
               layer.msg("书籍加载成功！", {time: 2000, icon: 6, shift: 5}, function () {
               });
               var books=result.data;
               for (var i=0;i<books.length;i++)
               {
                   var $book=$("<option value='"+books[i].bookid+"'>"+books[i].bookname+"</option>");
                   $("#bookid").append($book);
               }
           } else {
               layer.msg("书籍加载失败，请更换读者编号！", {time: 2000, icon: 5, shift: 6}, function () {
               });
           }
       });
    });
    $("#button1").click(function () {
        var data=   $("#form1").serialize();
        $.ajax({
                type : 'POST',
                url: "${pageContext.request.contextPath}/returnbook",
                data : data,
                success: function (result) {
                    if (result.success) {
                        layer.msg("还书成功！", {time: 2000, icon: 6, shift: 5}, function () {
                        });
                      $("#readerid").val("");
                      var data=result.data;
                      if (data!=null) {
                          var a="";
                          var b=0;
                          for (var i=0;i<data.length;i++){
                              a=data[i].name+"逾期了"+data[i].days+"天需要罚款"+data[i].money+"元钱"+"\n";
                              b=b+data[i].money;
                          }
                          a=a+"一共需要"+b+"元钱";
                          alert(a);

                      }
                        $("#readerid").val("");
                        $("#bookid").html("");
                    } else {
                        layer.msg("还书失败！", {time: 2000, icon: 5, shift: 6}, function () {
                        });
                    }
                }
            }

        )
    })
})

</script>
</body>
</html>
