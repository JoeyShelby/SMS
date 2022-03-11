<%--
  Created by IntelliJ IDEA.
  User: ohio
  Date: 2021/6/17
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息更新完成</title>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
    <script src="http://localhost:8080/SMS/static/layui/layui.js"></script>
</head>
<body>

<div align="center">
    <div id="back"><h3>X回到主页</h3></div>
    <i class="layui-icon-release layui-icon layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 100px;left:100px;"></i>
    <br><br><br><br>

    <h2 class="layui-bg-cyan">欢迎【${sessionScope.user.username}】注册本网站，请点击右上方X关闭该页面</h2>

    <script>
        layui.use('jquery',function (){
            let $ = layui.jquery;

            $("#back").click(function (){
                location.href="http://localhost:8080/SMS/index1.jsp";
            });
        });
    </script>
</div>
</body>
</html>