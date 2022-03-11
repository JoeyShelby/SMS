<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>更新学生成绩</title>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
    <style type="text/css">
        #footer{
            position:fixed;
            left: 700px;
            bottom:0;
        }
        #form{
            position:relative;
            left: 30px;
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
<form class="layui-form layui-form-pane" action="http://localhost:8080/SMS/gradeServlet" id="form">
    <input type="hidden" name="action" value="updateGrade">
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
            <input type="hidden" name="num" value="${requestScope.studentGrade.num}">
            <input value="${requestScope.studentGrade.num}" style="color: gray;width: 230px" id="num" type="text" name="num" class="layui-input" disabled>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="hidden" name="name" value="${requestScope.studentGrade.name}">
            <input value="${requestScope.studentGrade.name}" style="color: gray;width: 230px" id="name" type="text" disabled autocomplete="off" class="layui-input" style="width: 230px">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">数学成绩</label>
        <div class="layui-input-block">
            <input value="${requestScope.studentGrade.math}" id="math" name="math" type="text" autocomplete="off" class="layui-input" placeholder="yyyy-MM-dd" style="width: 230px">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">java成绩</label>
        <div class="layui-input-block">
            <input value="${requestScope.studentGrade.java}" id="java" name="java" type="text" autocomplete="off" class="layui-input" placeholder="yyyy-MM-dd" style="width: 230px">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">英语成绩</label>
        <div class="layui-input-block">
            <input value="${requestScope.studentGrade.english}" id="english" name="english" type="text" autocomplete="off" class="layui-input" placeholder="yyyy-MM-dd" style="width: 230px">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">体育成绩</label>
        <div class="layui-input-block">
            <input value="${requestScope.studentGrade.PE}" id="PE" name="PE" type="text" autocomplete="off" class="layui-input" placeholder="yyyy-MM-dd" style="width: 230px">
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
    layui.use(['form','layer'], function(){
        var form = layui.form;
        let $ = layui.jquery;
        let layer = layui.layer;

        $("#formSubmit").click(function (){
            let val = $("#math").val();
            if(val>100||val<0){
                layer.msg("成绩只在0到100之间");
                return false;
            }
        });

        $("#formSubmit").click(function (){
            let val = $("#java").val();
            if(val>100||val<0){
                layer.msg("成绩只在0到100之间");
                return false;
            }
        });
        $("#formSubmit").click(function (){
            let val = $("#english").val();
            if(val>100||val<0){
                layer.msg("成绩只在0到100之间");
                return false;
            }
        });
        $("#formSubmit").click(function (){
            let val = $("#PE").val();
            if(val>100||val<0){
                layer.msg("成绩只在0到100之间");
                return false;
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

<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>