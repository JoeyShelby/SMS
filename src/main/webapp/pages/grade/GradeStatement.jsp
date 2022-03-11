<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>综合成绩报表</title>
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

            $.getJSON("http://localhost:8080/SMS/gradeServlet","action=queryGradeALL",function(data){
                    if(data.grade != null){
                        $("#error").text("");
                        $("#chart").removeAttr("hidden");
                        let PEAverage = data.grade.PE_average;
                        let PETotal = data.grade.PE_total;
                        let englishAverage = data.grade.english_average;
                        let englishTotal = data.grade.english_total;
                        let javaAverage = data.grade.java_average;
                        let javaTotal = data.grade.java_total;
                        let mathAverage = data.grade.math_average;
                        let mathTotal = data.grade.math_total;
                        let total = data.grade.total;
                        let totalAverage = data.grade.total_average;
                        let dataArray=[mathTotal,mathAverage,javaTotal,javaAverage,englishTotal,englishAverage,PETotal,PEAverage,total,totalAverage];
                        var chartDom = document.getElementById('chart');
                        var myChart = echarts.init(chartDom);
                        var option;

                        option = {
                            title: {
                                text: '综合成绩报表',
                                left: "center",
                               // subtext: '学号：'+ num +" 姓名：" + name
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                                }
                            },
                            xAxis: {
                                type: 'category',
                                data: ['数学总分', '数学平均', 'Java总分', 'Java平均分',"英语总分","英语平均分",'体育总分', '体育平均分', '总分', '总分平均分']
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
                        $("#error").text("尚未生成综合成绩表,请联系管理员");
                    }
                });
            $("#download").click(function(){
                location.href="http://localhost:8080/SMS/gradeServlet?action=gradeStatement";
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
                        <dd><a href="http://localhost:8080/SMS/pages/grade/QueryGrade.jsp">学生成绩柱状图</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/NameSoftQuery.jsp">模糊查询学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/UpdateGrade.jsp">管理学生成绩</a></dd>
                        <dd class="layui-this"><a href="http://localhost:8080/SMS/pages/grade/GradeStatement.jsp">生成成绩报表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <%--表单和柱状图--%>
        <div class="layui-col-md9">
                <%--柱状图--%>
            <div>
                <div id="chart" style="width: 900px;height:500px;"></div>
                <div id="error" align="center"></div>
            </div>
                    <%--下载excel文件--%>
            <div id="download" align="center">
                <h3>是否需要将综合成绩报表下载至本地？</h3>
                <button type="button" class="layui-btn layui-btn-lg layui-btn-normal layui-bg-cyan"><i class="layui-icon layui-icon-download-circle"></i></button>
            </div>
        </div>
    </div>
</div>

<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>