<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>废纸篓</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>


<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>


<body>
<%--数据的table--%>
<center>
    <div class="layui-card-body" style="width: 900px">
        <table class="layui-hide" id="test" lay-filter="bianshan">
            <h3>废纸篓</h3>
        </table>
    </div>
</center>
<div id="motaikunag" style="display:none;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查看详情【废纸篓】</legend>
    </fieldset>
    <center>
        <table border="2" width="800px">
            <thead>
            <tr>
                <td><center>邮件ID</center></td>
                <td><center>标题</center></td>
                <td><center>级别</center></td>
                <td><center>发件人</center></td>
                <td><center>发件时间</center></td>
                <td><center>内容</center></td>
                <td><center>附件</center></td>
            </tr>
            </thead>
            <tbody id="list">
            </tbody>
        </table>
    </center>
</div>
</center>
</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">销毁</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="upd">恢复</a>
</script>

<script>
    layui.use(['form','table','laydate','jquery','layedit'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery,
            layedit=layui.layedit;
        var editIndex = layedit.build('LAY_demo_editor');
        fall();


        function fall() {
            var table = layui.table //表格
            //执行渲染
            table.render({
                elem: '#test',//制定原始表格元素选择器（id或者class）
                url: '/email/findWastebasket',
                where:{
                    "bPerson":${id}
                },
                //加载表格内容
                cols: [[//标题栏
                    {type: 'checkbox', fixed: 'left'},
                    {field: 'b_id', width: 100, title: '邮件ID'},
                    {field: 'b_person', width: 200, title: '发件人'},  //sort：true页面可进行排序操作
                    {field: 'b_theme', width: 200, title: '标题'},
                    {field: 'b_time', width: 200, title: '发布时间',sort: true},
                    {fixed: 'right', width: 180, align:'center', toolbar: '#barDemo'}
                ]],
                toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                done: function (res, curr, count) {
                }
            });



            //删除 操作
            table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data, //获得当前行数据
                    layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'del'){
                    $.ajax({
                        url:"/email/deleteWastebasket",
                        type:"post",
                        data:{
                            "bId":data.b_id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            window.location.reload();
                        }
                    });
                }else if(layEvent === 'edit'){
                    layer.open({
                        type:1,//类型
                        title:'已发送【查看详情】',
                        area:['60%','60%'],//定义宽和高
                        shadeClose:false,//点击遮罩层关闭
                        content: $('#motaikunag') //打开的内容
                    });
                    $.ajax({
                        url:"/email/findInbox1",
                        type:"post",
                        data:{"bId":data.b_id},
                        dataType:"json",
                        success:function(data){
                            var a=data;
                            var b="";
                            for(var i=0;i<a.length;i++){
                                b+="<tr><td><center>"+a[i].b_id+
                                    "</center></td><td><center>"+a[i].b_theme+
                                    "</center></td><td><center>"+a[i].b_rank+
                                    "</center></td><td><center>"+a[i].b_person+
                                    "</center></td><td><center>"+a[i].b_time+
                                    "</center></td><td><center>"+a[i].b_content+
                                    "</center></td><td><center>"+a[i].b_url+
                                    "</center></td></tr>";
                            }
                            $("#list").html(b);
                        }
                    });
                }else if (layEvent === 'upd'){
                    $.ajax({
                        url:"/email/updateWastebasket",
                        type:"post",
                        data:{
                            "bId":data.b_id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            window.location.reload();
                        }
                    });
                }

            })
        }
    });

</script>