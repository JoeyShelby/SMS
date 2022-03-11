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
    body{
      width: 600px;
      height: 500px;
    }
    #form{
      position:relative;
      top:30px;
      left: 50px;
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
  <form style="width: 600px" class="layui-form layui-form-pane" action="http://localhost:8080/SMS/studentServlet" id="form">
    <input type="hidden" name="action" value="updateStudent">
    <div class="layui-form-item">
      <label class="layui-form-label">学号</label>
      <div class="layui-input-block">
        <input type="hidden" name="num" value="${requestScope.student.num}">
        <input value="${requestScope.student.num}" disabled style="color: gray;width: 230px" id="num" type="text" class="layui-input" >
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">姓名</label>
      <div class="layui-input-block">
        <input value="${requestScope.student.name}" id="name" type="text" name="name" required  lay-verify="name" placeholder="在此输入姓名" autocomplete="off" class="layui-input" style="width: 230px">
      </div>
    </div>

    <div class="layui-form-item">
      <label class="layui-form-label">生日</label> <input value="${requestScope.student.birth}" id="birth" type="text" autocomplete="off" class="layui-input" name="birth" id="birth"  placeholder="yyyy-MM-dd" style="width: 230px">
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
        <input id="sex_male" type="radio" name="sex" value="male" title="男" checked="checked">
        <input id="sex_female" type="radio" name="sex" value="female" title="女" >
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
          if(!new RegExp("[\u4e00-\u9fa5a-zA-Z]").test(value)){
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

<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>