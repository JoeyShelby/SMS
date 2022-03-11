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
                        <dd><a href="http://localhost:8080/SMS/pages/grade/AddGrade.jsp">添加学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/QueryGrade.jsp">学生成绩柱状图</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/NameSoftQuery.jsp">模糊查询学生成绩</a></dd>
                        <dd class="layui-this"><a href="http://localhost:8080/SMS/pages/grade/UpdateGrade.jsp">管理学生成绩</a></dd>
                        <dd><a href="http://localhost:8080/SMS/pages/grade/GradeStatement.jsp">生成成绩报表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>

        <%--表格数据--%>
        <div class="layui-col-md9">
            <table id="table" lay-filter="table_filter" lay-size="sm">
            </table>
            <script >
                layui.use(["table",'layer'],function(){
                    var table = layui.table;

                    //绑定当前行事件
                    table.on('tool(table_filter)',function(obj){
                        console.log(obj.event);
                        if(obj.event==='delete'){
                            //删除学生信息
                            layer.confirm("您确认要删除"+ obj.data.name+ "的成绩吗？(不可恢复)", {
                                btn: ['确认','取消'] //按钮
                            }, function(){
                                location.href="http://localhost:8080/SMS/gradeServlet?action=deleteStudentGrade&num="+obj.data.num;
                            }, function(){
                                layer.msg("已撤销删除！")
                            });
                        }
                        else if(obj.event==='update'){
                            layer.open({
                                type : 2,
                                title : '修改学生成绩',
                                content : "http://localhost:8080/SMS/gradeServlet?action=queryStudentGradeByNumForUpdate&num="+obj.data.num,
                                area:['500px','600px'],
                                offset:['40px','500px'],
                                end:function (){
                                    //刷新数据表格
                                    table.reload('tableId');
                                }
                            });
                        }
                    });

                    table.render({
                        elem:"#table",
                        id:"tableId",
                        url:"http://localhost:8080/SMS/gradeServlet?action=queryStudentGradesAsJson",
                        height : 'full-100',
                        cols: [[
                            {field: 'num', title: '学号',sort: true,width: 60},
                            {field: 'name', title: '姓名'},
                            {field: 'math', title: '数学',sort: true,},
                            {field: 'java', title: 'Java',sort: true,},
                            {field: 'english', title: '英语',sort: true,},
                            {field: 'PE', title: '体育',sort: true,},
                            {field: 'total', title: '总成绩',sort: true,},
                            {field: 'average', title: '平均成绩',sort: true,width:100},
                            {
                                title:'操作',
                                align:'center',
                                templet : function (){
                                    var str = "<button lay-event='update' type=\"button\" class=\"layui-btn layui-btn-xs layui-bg-cyan\">更新</button>";
                                    str += "<button lay-event='delete' type=\"button\" class=\"layui-btn layui-btn-xs layui-bg-black\">删除</button>";
                                    return str;
                                }
                            }
                        ]]
                    });
                });
            </script>
        </div>
    </div>
</div>


<div style="color: black" id="footer">JOEY.Copyright &copy;2021</div>

</body>
</html>