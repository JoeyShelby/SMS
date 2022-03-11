<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生</title>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
    <style type="text/css">
        #footer{
            position:fixed;
            left: 700px;
            bottom:0;
        }
        #form{
            position:relative;
            left: 280px;
            top:80px;
        }
    </style>
    <script src="http://localhost:8080/SMS/static/layui/layui.js"></script>
    <script>
        //导航条组件依赖
        layui.use('element', function(){
            var element = layui.element;
        });
    </script>
</head>

<body>

<%--头部导航条--%>
<div class="layui-header" >
    <div>
        <div class="layui-col-md6 layui-bg-cyan">
            <ul class="layui-nav layui-bg-cyan">
                <li class="layui-nav-item"><a href="http://localhost:8080/SMS/index1.jsp">Joey's学生成绩管理系统</a></li>
            </ul>
        </div>
        <div class="layui-col-md6" >
            <ul class="layui-nav layui-bg-cyan">
                <div align="right">
                    <li class="layui-nav-item  layui-this"><a href="http://localhost:8080/SMS/pages/management/StudentManage.jsp">学生管理</a></li>
                    <li class="layui-nav-item "><a href="http://localhost:8080/SMS/pages/management/GradeManage.jsp">成绩管理<span class="layui-badge-dot"></span></a></li>
                    <li class="layui-nav-item">
                        <a href=""><img src="http://localhost:8080/SMS/static/img/login.png" class="layui-nav-img">我</a>
                        <dl class="layui-nav-child">
                            <dd><a href="#" style="color: black">${sessionScope.user.username}</a></dd>
                            <dd><a href="http://localhost:8080/SMS/userServlet?action=logout">注销</a></dd>
                        </dl>
                    </li>
                </div>
            </ul>
        </div>
    </div>
</div>
</div>

<%--中间--%>
<div>
    <div class="layui-row">
        <!--左侧导航条-->
        <div class="layui-col-md3">
            <ul class="layui-nav layui-nav-tree layui-bg-cyan" lay-filter="test" style="width: 308px;height: 650px">
                <li class="layui-nav-item">
                    <a href="http://localhost:8080/SMS/index1.jsp">回到首页</a>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="#">学生管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="http://localhost:8080/SMS/pages/management/StudentManage.jsp">查看学生信息</a></dd>
                        <dd class="layui-this"><a href="http://localhost:8080/SMS/pages/student/AddStudent.jsp">添加学生信息</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/student/EditStudent.jsp">管理学生信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="#">成绩管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="http://localhost:8080/SMS/pages/management/GradeManage.jsp">查看学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/AddGrade.jsp">添加学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/QueryGrade.jsp">学生成绩柱状图</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/NameSoftQuery.jsp">模糊查询学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/UpdateGrade.jsp">管理学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/GradeStatement.jsp">生成成绩报表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <!--表单模块-->
        <div class="layui-col-md9">
            <form class="layui-form layui-form-pane" action="http://localhost:8080/SMS/studentServlet" id="form">
                <input type="hidden" name="action" value="addStudent">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required  lay-verify="name" placeholder="在此输入姓名" autocomplete="off" class="layui-input" style="width: 230px">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">生日</label><input type="text" autocomplete="off" class="layui-input" name="birth" id="birth"  placeholder="yyyy-MM-dd" style="width: 230px">
                    <script>
                        layui.use('laydate', function(){
                            var laydate = layui.laydate;

                            //执行一个laydate实例
                            laydate.render({
                                elem: '#birth', //指定元素
                                trigger:'click'
                            });
                        });
                    </script>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="male" title="男" checked>
                        <input type="radio" name="sex" value="female" title="女" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-bg-cyan" lay-submit lay-filter="formSubmit" id="formSubmit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
            <script>
                //Demo
                layui.use(['form'], function(){
                    var form = layui.form;
                    let $ = layui.jquery;
                    /*学生姓名字段验证*/
                    form.verify({
                        name: function(value, item){ //value：表单的值、item：表单的DOM对象
                            if(!new RegExp("[\u4E00-\u9FA5a-zA-Z]").test(value)){
                                return '当前输入的学生姓名不合法';
                            }
                        }
                    });

                    form.on('submit(formSubmit)', function(data){
                        layer.confirm('您确认要提交吗？', {
                            btn: ['确认','取消']
                        }, function(){
                            $("#form").submit();
                        }, function(){
                        });
                        return false;
                    });
                });
            </script>
        </div>
    </div>
</div>


<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>