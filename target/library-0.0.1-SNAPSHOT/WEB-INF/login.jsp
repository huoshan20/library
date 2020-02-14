<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/login.css">
    <style>
        .passcode{position:absolute;right:0;bottom:0;height:32px;margin:1px;border-left:solid 1px #ddd;text-align:center;line-height:32px;border-radius:0 4px 4px 0;}
        .aa{ display: block;
            width: 100%;
            height: 45px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;}
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="#" style="font-size:32px;">图书馆管理系统</a></div>
        </div>
    </div>
</nav>

<div class="container">
    <h4 style="color:red">${param.errorMessage}</h4>
    <form class="form-signin" role="form" id="form1" action="login" method="POST" id="loginFrom">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" name="adminid" id="loginUserName" value="${requestScope.adminid}" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" class="form-control" name="password" id="loginPassword" value="${requestScope.password}" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="aa" name="code"
                   placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
            <img src="${pageContext.request.contextPath}/authCode" alt="" width="100" height="32"
                 class="passcode" style="height:43px;cursor:pointer;"
                 onclick="this.src=this.src+'?'">
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>

    </form>
</div>
<script src="../jquery/jquery-2.1.1.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../layer/layer.js"></script>
<script>

    function dologin() {
        // 获取输入的账号和密码
        var userName = $.trim($("#loginUserName").val());
        var password = $.trim($("#loginPassword").val());
        var code=$("input[name=code]").val();
        if(userName == ""){
            //alert("账号不能为空！");
            // layer.msg(message) 就是用来提示消息的，message:需要提示的消息
            //                     time: 提示显示的时间 以ms为单位
            //                     icon: 用来表示图标的
            //                     shift: 弹窗出现的一个动作
            //                  回调函数，当弹窗结束之后会执行
            layer.msg("账号不能为空！请输入", {time:2000, icon:2, shift:6}, function(){
                //alert("回调方法执行了！");
            });
            return;
        }
        if(password == ""){
            //alert("密码不能为空！");
            layer.msg("密码不能为空！请输入", {time:2000, icon:2, shift:6}, function(){
                //alert("回调方法执行了！");
            });
            return;
        }
        if(code == ""){
            //alert("密码不能为空！");
            layer.msg("验证码不能为空！请输入", {time:2000, icon:2, shift:6}, function(){
                //alert("回调方法执行了！");
            });
            return;
        }
        // 发送请求提交表单
        //$("#loginFrom").submit();
        var loadingIndex = null;
        $.ajax({
            // type 属性： 请求的类型
            "type" : "POST",
            // url 属性： 请求的地址
            url : "doAJAXLogin",
            // data 属性 ： 请求需要传送的数据 是一个对象
            data : {
                adminid : userName,
                password : password,
                code: code,
                time : new Date()
            },
            // beforeSend 属性： 在发送ajax请求之前可以让调用这个方法
            beforeSend : function(){
                loadingIndex = layer.msg('正在登陆，请稍后', {icon: 16});
            },
            //success 属性： 表示成功之后调用的方法
            success : function(result){
                layer.close(loadingIndex);
                if(result.success){

                    if (result.data.messageCode == 1001){
                        layer.msg("验证码错误", {time:2000, icon:5, shift:6}, function(){
                            //alert("回调方法执行了！");
                        });
                        $("img").trigger("click");
                        $("input[name=code]").val("");
                    }else if (result.data.messageCode == 1002) {
                        layer.msg("用户名和密码不一致", {time: 2000, icon: 5, shift: 6}, function () {
                            //alert("回调方法执行了！");
                        });
                        $("img").trigger("click");
                        $("input[name=code]").val("");
                    }else {
                        window.location.href = "library";
                    }
                }else{
                    layer.msg("登陆失败", {time:2000, icon:5, shift:6}, function(){
                        //alert("回调方法执行了！");
                    });
                }
            }
        });

    }
</script>
</body>
</html>