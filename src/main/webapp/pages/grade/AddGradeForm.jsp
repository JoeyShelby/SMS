<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生成绩的表单</title>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
    <script src="http://localhost:8080/SMS/static/layui/layui.js"></script>
    <script>
        layui.use('element', function(){
            var element = layui.element;

            //…
        });
    </script>
</head>
<body>
    <form class="layui-form layui-form-pane" action="http://localhost:8080/SMS/gradeServlet" id="form">
        <input type="hidden" name="action" value="addGrade">
        <input type="hidden" name="num" value="${requestScope.num}">
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-block">
                <input value="${requestScope.num}" disabled type="text" class="layui-input" style="width: 230px">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数学</label>
            <div class="layui-input-block">
                <input type="text" id="math" name="math" required  lay-verify="grade" placeholder="在此输入数学成绩" autocomplete="off" class="layui-input" style="width: 230px">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">java</label>
            <div class="layui-input-block">
                <input type="text" id="java" name="java" required  lay-verify="grade" placeholder="在此输入Java成绩" autocomplete="off" class="layui-input" style="width: 230px">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">英语</label>
            <div class="layui-input-block">
                <input type="text" id="english" name="english" required  lay-verify="grade" placeholder="在此输入英语成绩" autocomplete="off" class="layui-input" style="width: 230px">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">体育</label>
            <div class="layui-input-block">
                <input type="text" id="PE" name="PE" required  lay-verify="grade" placeholder="在此输入体育成绩" autocomplete="off" class="layui-input" style="width: 230px">
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
            /*学生姓名字段验证*/
            form.verify({
                grade: function(value, item){ //value：表单的值、item：表单的DOM对象
                    if(!new RegExp("^\\d+(\\.\\d+)?$").test(value)){
                        return '成绩格式不合法';
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

</body>
</html>