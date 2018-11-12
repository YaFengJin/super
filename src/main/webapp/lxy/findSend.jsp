<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>已发送【查看，查看详情，转发，删除】</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>


<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>


<body>
<%--数据的table--%>
<center>
<div class="layui-card-body" style="width: 1000px">
    <table class="layui-hide" id="test" lay-filter="bianshan">
        <h3>已发送</h3>
    </table>
</div>
</center>
<div id="motaikunag" style="display:none;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查看详情【已发送】</legend>
    </fieldset>
    <center>
    <table border="2" width="800px">
        <thead>
        <tr>
            <td><center>邮件ID</center></td>
            <td><center>标题</center></td>
            <td><center>级别</center></td>
            <td><center>收件人</center></td>
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

<div id="mokunag" style="display:none;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>转发【已发送】</legend>
    </fieldset>
    <form class="layui-form" action="">
        <input type="hidden" id="lxy">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">发件人</label>
            <div class="layui-input-block">
                <input name="b_person" value="${id}" id="bPerson" style="width: 500px" class="layui-input" type="text" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收件人</label>
            <div class="layui-input-block">
                <input name="b_recipients" id="bRecipients" style="width: 500px" class="layui-input" placeholder="请输入收件人" type="text" autocomplete="off" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">主题</label>
            <div class="layui-input-block">
                <input name="b_theme" id="bTheme" style="width: 500px" class="layui-input" placeholder="请输入邮件主题" type="text" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">级别</label>
            <div class="layui-input-block"  style="width: 200px;">
                <select id="bRank" name="b_rank">
                    <option value="一般">一般</option>
                    <option value="重要">重要</option>
                    <option value="非常重要">非常重要</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label">发送时间</label>
            <div class="layui-input-block">
                <input name="b_time" id="bTime" style="width: 500px" class="layui-input" value="<% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())); %>" type="text" autocomplete="off">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block" style="width: 500px">
                <textarea class="layui-textarea layui-hide" name="b_content" lay-verify="content" id="LAY_demo_editor"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">附件</label>
            <div class="layui-input-block">
                <input name="b_url" id="bUrl" class="layui-input" style="width: 600px" type="text" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-filter="btn" lay-submit="">立即提交</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>

</div>



</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="se">转发</a>
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
                url: '/email/findSend',
                where:{
                    "bPerson":${id}
                },
                //加载表格内容
                cols: [[//标题栏
                    {type: 'checkbox', fixed: 'left'},
                    {field: 'b_id', width: 100, title: '邮件ID'},
                    {field: 'b_recipients', width: 270, title: '收件人'},  //sort：true页面可进行排序操作
                    {field: 'b_theme', width: 200, title: '标题'},
                    {field: 'b_time', width: 250, title: '发布时间',sort: true},
                    {field: 'b_person', width: 250, title: '发布人',sort: true},
                    {field: 'b_rank', width: 250, title: '级别',sort: true},
                    {field: 'b_content', width: 250, title: '内容',sort: true},
                    {field: 'b_url', width: 250, title: '附件',sort: true},
                    {fixed: 'right', width: 180, align:'center', toolbar: '#barDemo'}
                ]],
                toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                done: function (res, curr, count) {
                    $(".layui-table-box").find("[data-field='b_person']").css("display","none");
                    $(".layui-table-box").find("[data-field='b_rank']").css("display","none");
                    $(".layui-table-box").find("[data-field='b_content']").css("display","none");
                    $(".layui-table-box").find("[data-field='b_url']").css("display","none");
                }
            });



            // 编辑 删除 操作
            table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data, //获得当前行数据
                    layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        $.ajax({
                            url:"/email/updateSend",
                            type:"post",
                            data:{
                                "bId":data.b_id
                            },
                            dataType:"json",
                            success:function(data){
                                alert(data.message);
                                obj.del(); //删除对应行（tr）的DOM结构
                                layer.close(index);//向服务端发送删除指令
                            }
                        })
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
                        url:"/email/findParticulars",
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
                                    "</center></td><td><center>"+a[i].b_recipients+
                                    "</center></td><td><center>"+a[i].b_time+
                                    "</center></td><td><center>"+a[i].b_content+
                                    "</center></td><td><center>"+a[i].b_url+
                                    "</center></td></tr>";
                            }
                            $("#list").html(b);
                        }
                    });
                }
            })
        }
    });

    /*
    * 查看详情
    * */
</script>