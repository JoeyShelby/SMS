<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>添加成绩</title>
  <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
  <style type="text/css">
    #footer{
      position:fixed;
      left: 700px;
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
          <li class="layui-nav-item"><a href="http://localhost:8080/SMS/pages/management/StudentManage.jsp">学生管理</a></li>
          <li class="layui-nav-item  layui-this"><a href="http://localhost:8080/SMS/pages/management/GradeManage.jsp">成绩管理<span class="layui-badge-dot"></span></a></li>
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

<%--左侧导航条和表格数据--%>
<div>
  <div class="layui-row">
    <%--左侧导航条--%>
    <div class="layui-col-md3">
      <ul class="layui-nav layui-nav-tree layui-bg-cyan" lay-filter="test" style="width: 308px;height: 650px">
        <li class="layui-nav-item">
          <a href="http://localhost:8080/SMS/index1.jsp">回到首页</a>
        </li>
        <li class="layui-nav-item">
          <a href="#">学生管理</a>
          <dl class="layui-nav-child">
            <dd><a href="http://localhost:8080/SMS/pages/management/StudentManage.jsp">查看学生信息</a></dd>
            <dd><a href="http://localhost:8080/SMS/pages/student/AddStudent.jsp">添加学生信息</a></dd>
            <dd><a href="http://localhost:8080/SMS/pages/student/EditStudent.jsp">管理学生信息</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a href="#">成绩管理</a>
          <dl class="layui-nav-child">
            <dd><a href="http://localhost:8080/SMS/pages/management/GradeManage.jsp">查看学生成绩</a></dd>
            <dd class="layui-this"><a href="http://localhost:8080/SMS/pages/grade/AddGrade.jsp">添加学生成绩</a></dd>
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
      <form class="layui-form layui-form-pane" action="#" id="form">
        <div class="layui-form-item">
          <label class="layui-form-label">学号</label>
          <div class="layui-input-block">
            <input type="text" name="num" required id="num" required lay-verify="num" placeholder="输入需要添加成绩的学号" autocomplete="off" class="layui-input" style="width: 230px">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
            <button class="layui-btn layui-bg-cyan" lay-filter="formSubmit" type="button" id="formSubmit">查询</button>
          </div>
        </div>
      </form>

      <div align="center">
        <div id="student" align="center">
          <div id="msg"></div>
          <div id="student_num"></div>
          <div id="student_name"></div>
          <div id="student_sex"></div>
          <div id="student_birth"></div>
          <div id="student_button" hidden="hidden">
            <button id="submit" class="layui-btn layui-btn-normal layui-bg-cyan" hidden="hidden" >添加成绩</button>
          </div>
        </div>

      </div>
      <script>
        //Demo
        layui.use(['form','layer','jquery'], function(){
          var form = layui.form;
          var $ = layui.jquery;
          var layer = layui.layer;

          $("#formSubmit").click(function (){
            let val = $("#num").val();
            if(!new RegExp("[0-9]").test(val)) {
              layer.msg('学号只由阿拉伯数字组成！');
              return false;
            }
          });

          /*学生学号字段验证*/
          form.verify({
            num: function(value, item){ //value：表单的值、item：表单的DOM对象
              if(!new RegExp("[0-9]").test(value)){
                return '学号只由阿拉伯数字组成！';
              }
            }
          });

          var num;
          /*ajax，请求student对象，输入学号后将学生信息显示在网页上*/
          $("#formSubmit").click(function () {
            num = $("#num").val();
            $.getJSON("http://localhost:8080/SMS/gradeServlet","action=queryStudentByNum&num=" + num,function(data){
              if(data.student != null)
              {
                if(!data.exist){
                  $("#msg").text("");
                  $("#student_num").text("");
                  $("#student_name").text("");
                  $("#student_sex").text("");
                  $("#student_birth").text("");
                  $("#student_button").attr("hidden",'hidden');
                  layer.msg("学生【"+ data.student.name +"】的成绩已经存在，不可重复添加");
                }
                else{
                  $("#msg").text("学生信息如下，可为其添加成绩！");
                  $("#student_num").text("学号：" + data.student.num);
                  $("#student_name").text("姓名：" + data.student.name);
                  $("#student_sex").text("性别：" + data.student.sex);
                  $("#student_birth").text("生日：" + data.student.birth);
                  $("#student_button").removeAttr("hidden");
                }
              }
              else{
                layer.msg("查无此人，请重新输入");
                $("#msg").text("");
                $("#student_num").text("");
                $("#student_name").text("");
                $("#student_sex").text("");
                $("#student_birth").text("");
                $("#student_button").attr("hidden",'hidden');
              }
            });
          });

          $("#submit").click(function () {
            layer.open({
              type : 2,
              title : '为学生添加成绩',
              content : "http://localhost:8080/SMS/gradeServlet?action=queryStudentByNumForAddGrade&num=" + num,
              area:['500px','400px'],
              offset:['120px','500px'],
              end:function (){
                location.href="http://localhost:8080/SMS/pages/grade/AddGrade.jsp";
              }
            });
          });
        });
      </script>
    </div>

  </div>
</div>


<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>