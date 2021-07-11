<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <title>Lucian管理系统</title>
    <link rel="stylesheet" href="layui/css/style.css">
</head>

<body>
<div class="dowebok">
    <div class="container">
        <div class="left">
            <div class="login">登陆</div>
            <div class="eula">欢迎光临，请输入您的用户名和密码以登录！</div>
        </div>
        <div class="right">
            <svg viewBox="0 0 320 300">
                <defs>
                    <linearGradient inkscape:collect="always" id="linearGradient" x1="13" y1="193.49992" x2="307"
                                    y2="193.49992" gradientUnits="userSpaceOnUse">
                        <stop style="stop-color:#ff00ff;" offset="0" id="stop876" />
                        <stop style="stop-color:#ff0000;" offset="1" id="stop878" />
                    </linearGradient>
                </defs>
                <path d="m 40,120.00016 239.99984,-3.2e-4 c 0,0 24.99263,0.79932 25.00016,35.00016 0.008,34.20084 -25.00016,35 -25.00016,35 h -239.99984 c 0,-0.0205 -25,4.01348 -25,38.5 0,34.48652 25,38.5 25,38.5 h 215 c 0,0 20,-0.99604 20,-25 0,-24.00396 -20,-25 -20,-25 h -190 c 0,0 -20,1.71033 -20,25 0,24.00396 20,25 20,25 h 168.57143" />
            </svg>
            <div class="form">
                <label for="username">用户名</label>
                <input type="text" id="username" name="username">
                <label for="password">密码</label>
                <input type="password" id="password" name="userpass">
                <input type="submit" id="submit" value="登陆">
            </div>
        </div>
    </div>
</div>
<script src="js/anime.min.js"></script>
<script src="js/index.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="layui/layui.all.js"></script>
<script>
    layui.use('layer', function() {//使用layui加载
        var layer = layui.layer ;
        $('#submit').on('click',function () {
            $.ajax({//通过ajax想后台发送请求
                type:"POST",//POST请求方式
                url:"user_login",//后台登录映射路径
                data:"username="+$("input[name='username']").val()+"&userpass="+$("input[name='userpass']").val(),
                success:function (res) {
                    if(res.code==200){
                        layer.msg(res.msg);
                        window.location.href="admins";
                    }else if(res.code==100){
                        layer.msg(res.msg);
                    }else if (res.code==404){
                        layer.msg(res.msg);
                    }
                },
                error:function (){console.log("数据加载失败！");}
            });
        })
    });
</script>
</body>

</html>