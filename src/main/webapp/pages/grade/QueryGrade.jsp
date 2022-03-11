<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>成绩管理</title>
    <link type="text/css" rel="stylesheet" href="http://localhost:8080/SMS/static/layui/css/layui.css" >
    <style type="text/css">
        #footer{
            position:fixed;
            left: 700px;
            bottom:0;
        }
    </style>
    <script src="http://localhost:8080/SMS/static/layui/layui.js"></script>
    <script src="http://localhost:8080/SMS/static/echarts.js"></script>
    <script>
        layui.use(['element','jquery'], function(){
            var element = layui.element;
            var $ = layui.jquery;

            let input;
            let id = "name";
            let flag = "name";
            $("#select").change(function (){
                /*选择学号查询或行姓名查询*/
                let value = $("#select").val();
                if(value == "num"){
                    id="num";
                    flag = "num";
                    $("#input").removeAttr("placeholder");
                    $("#input").attr("placeholder","请在此处输入学号...");
                }
                else{
                    id="name";
                    flag = "name";
                    $("#input").removeAttr("placeholder");
                    $("#input").attr("placeholder","请在此处输入姓名...");
                }
            });
            $("#query").click(function (){
                input = $("#input").val();
                $.getJSON("http://localhost:8080/SMS/gradeServlet","action=queryGrade&flag="+flag+"&"+id+"="+input,function(data){
                    if(data.studentGrade != null){
                        $("#error").text("");
                        $("#chart").removeAttr("hidden");
                        let num = data.student.num;
                        let name = data.student.name;
                        let dataArray=[data.studentGrade.math,data.studentGrade.java,data.studentGrade.english,data.studentGrade.PE, data.studentGrade.total, data.studentGrade.average];
                        var chartDom = document.getElementById('chart');
                        var myChart = echarts.init(chartDom);
                        var option;

                        option = {
                            title: {
                                text: '学生个人成绩',
                                left: "left",
                                subtext: '学号：'+ num +" 姓名：" + name
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            xAxis: {
                                type: 'category',
                                data: ['数学', 'Java', '英语', '体育',"总分","平均分"]
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [{
                                data: dataArray,
                                type: 'bar',
                                showBackground: true,
                                backgroundStyle: {
                                    color: 'rgba(180, 180, 180, 0.2)'
                                }
                            }],
                            color:["#1661ab"]
                        };
                        //使用制定的配置项和数据显示图表
                        option && myChart.setOption(option);
                    }
                    else{
                        $("#chart").attr("hidden",'hidden');
                        $("#error").text("查无此人或尚未录入成绩");
                    }
                });

            });
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
                        <dd><a href="http://localhost:8080/SMS/pages/grade/AddGrade.jsp">添加学生成绩</a></dd>
                        <dd  class="layui-this"><a href="http://localhost:8080/SMS/pages/grade/QueryGrade.jsp">学生成绩柱状图</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/NameSoftQuery.jsp">模糊查询学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/UpdateGrade.jsp">管理学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/GradeStatement.jsp">生成成绩报表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <%--表单和柱状图--%>
        <div class="layui-col-md9">

                <div class="layui-form-item" pane>
                    <label class="layui-form-label">查询方式:</label>
                    <div class="layui-input-block">
                        <select name="select" id="select" style="width: 80px;height: 30px;">
                            <option value="name">姓名</option>
                            <option value="num">学号</option>
                        </select>
                        <input type="text"required lay-verify="name" id="input" placeholder="在此输入姓名...." autocomplete="off" class="layui-input">
                        <button id="query" class="layui-btn  layui-bg-cyan" type="button">查询</button>
                    </div>

                    <%--柱状图--%>
                    <div class="layui-input-block">
                        <div id="chart" style="width: 600px;height:400px;" hidden="hidden"></div>
                        <div id="error" align="center"></div>
                    </div>
                </div>
        </div>

    </div>
</div>

<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>