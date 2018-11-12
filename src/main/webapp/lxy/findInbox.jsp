<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收件箱【查看，查看详情，转发，删除】</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>


<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>


<body>
<%--数据的table--%>
<center>
    <div class="layui-card-body" style="width: 1200px">
        <table class="layui-hide" id="test" lay-filter="bianshan">
            <h3>收件箱</h3>
        </table>
    </div>
</center>
<div id="motaikunag" style="display:none;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查看详情【收件箱】</legend>
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
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <input type="button" id="btn" value="关闭" style="width: 70px;height: 35px;">
    </center>
</div>
</center>

<div id="mokunag" style="display:none;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>转发【收件箱】</legend>
    </fieldset>

</div>



</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="se">回复</a>
</script>

<script type="text/javascript">
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
                url: '/email/findInbox',
                where:{
                    "bPerson":${id}
                },
                //加载表格内容
                cols: [[//标题栏
                    {type: 'checkbox', fixed: 'left'},
                    {field: 'b_id', width: 100, title: '邮件ID'},
                    {field: 'b_person', width: 270, title: '发件人'},  //sort：true页面可进行排序操作
                    {field: 'b_theme', width: 200, title: '标题'},
                    {field: 'b_time', width: 200, title: '发布时间',sort: true},
                    {field: 'b_state1', width: 150,style:"color: #2446A7",title: '读取状态',sort: true},
                    {fixed: 'right', width: 230, align:'center', toolbar: '#barDemo'}
                ]],
                toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                done: function (res, curr, count) {
                    $("[data-field='b_state1']").children().each(function () {
                        if($(this).text()=='0'){
                            $(this).text("未读");
                        }else if($(this).text()=='1'){
                            $(this).text("已读");
                        }
                    })
                }
            });



            //删除 操作
            table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data, //获得当前行数据
                    layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'del'){
                        $.ajax({
                            url:"/email/updateInbox",
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
                    $("#btn").click(function () {
                        $.ajax({
                            url:"/email/updateInbox1",
                            type:"post",
                            data:{"bId":data.b_id},
                            dataType:"json",
                            success:function(data){
                                /*alert(data.message);*/
                                window.location.reload();
                            }
                        });
                    });
                }

            })
        }
    });

</script>