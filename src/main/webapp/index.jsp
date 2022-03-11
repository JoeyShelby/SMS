<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生成绩管理系统</title>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
    <style type="text/css">
        #footer{
            position:fixed;
            bottom:0;
        }
    </style>
    <script src="http://localhost:8080/SMS/static/layui/layui.js"></script>
    <script>
        layui.use('element', function(){
            var element = layui.element;

            //…
        });
    </script>
</head>
<body background="http://localhost:8080/SMS/static/img/summer.jpg">

<div class="layui-header">
    <div>
        <div class="layui-col-md6 layui-bg-cyan">
            <ul class="layui-nav layui-bg-cyan">
                <li class="layui-nav-item"><a href="http://localhost:8080/SMS/">Joey's学生成绩管理系统</a></li>
            </ul>
        </div>
        <div class="layui-col-md6" >
            <ul class="layui-nav layui-bg-cyan">
                <div align="right">
                    <li class="layui-nav-item"><a href="#">学生管理</a></li>
                    <li class="layui-nav-item"><a href="#">成绩管理<span class="layui-badge-dot"></span></a></li>
                    <li class="layui-nav-item">
                        <a href="#"><img src="http://localhost:8080/SMS/static/img/img.png" class="layui-nav-img">我</a>
                        <dl class="layui-nav-child">
                            <dd><a href="http://localhost:8080/SMS/pages/account/login.html">登录</a></dd>
                            <dd><a href="http://localhost:8080/SMS/pages/account/signUp.html">注册</a></dd>
                        </dl>
                    </li>
                </div>
            </ul>
        </div>
    </div>
</div>
</div>

<div class="layui-container layui-main">
    <div class="layui-row">
        <div class="layui-col-md-offset4">
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2021-07-04</h3>
                        <p>
                            毛泽东思想和中国特色社会主义理论体系
                            <br>开始时间：2021-07-04 14:30
                            <br>结束时间：2021-07-04 16:10
                            <br>考试地点：第五教学楼101
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2021-07-05</h3>
                        <p>
                            大学英语(4)
                            <br>开始时间：2021-07-05 10:00
                            <br>结束时间：2021-07-05 11:40
                            <br>考试地点：第五教学楼511
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2021-07-06</h3>
                        <p>
                            操作系统
                            <br>开始时间：2021-07-06 14:30
                            <br>结束时间：2021-07-06 16:10
                            <br>考试地点：第五教学楼109
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <div class="layui-timeline-title">... ...</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="layui-container" id="footer" align="center">
    <span style="color: white">JOEY.Copyright &copy;2021</span>
</div>

</body>
</html>