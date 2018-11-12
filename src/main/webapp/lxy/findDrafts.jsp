<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>草稿箱查询,编辑,删除</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">

</head>
<%--模态框--%>
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">



<script type="text/javascript" src="../static/layui/layui.js"></script>

<body>
<%--数据的table--%>
<center>
<div class="layui-card-body" style="width: 1180px">
    <table class="layui-hide" id="test" lay-filter="bianshan">
        <h3>草稿箱</h3>
    </table>
</div>
</center>


<div id="motaikunag" style="display:none;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>撰写邮件</legend>
    </fieldset>
    <form class="layui-form" action="">
        <input type="hidden" id="lxy">
        <div class="layui-form-item">
            <label class="layui-form-label">发件人</label>
            <div class="layui-input-block">
                <input name="b_person" id="bPerson" style="width: 800px" class="layui-input" type="text" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收件人</label>
            <div class="layui-input-block">
                <input name="b_recipients" id="bRecipients" style="width: 800px" class="layui-input" placeholder="请输入收件人" type="text" autocomplete="off" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">主题</label>
            <div class="layui-input-block">
                <input name="b_theme" id="bTheme" style="width: 800px" class="layui-input" placeholder="请输入邮件主题" type="text" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">级别</label>
            <div class="layui-input-block"  style="width: 200px;">
                <%--<input name="b_rank" id="bRank" class="layui-input" placeholder="请输入收件人" type="text" autocomplete="off" lay-verify="title">--%>
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
                <input name="b_time" id="bTime" style="width: 800px" class="layui-input" value="<% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())); %>" type="text" autocomplete="off">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block" style="width: 800px">
                <textarea class="layui-textarea layui-hide" name="b_content" lay-verify="content" id="LAY_demo_editor"></textarea>
                <%--<input name="b_content" id="bContent" style="width: 800px" class="layui-input" type="text" autocomplete="off" lay-verify="title">--%>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">附件</label>
            <div class="layui-input-block">
                <input name="b_url" id="bUrl" class="layui-input" style="width: 800px" type="text" autocomplete="off" lay-verify="title">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input name="b_state" id="bState" class="layui-input" style="width: 800px" type="text" autocomplete="off" lay-verify="title">
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
    <a class="layui-btn layui-btn-xs" lay-event="edit">立即发送</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/javascript">
    layui.use(['form','table','laydate','jquery','layedit'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery,
            layedit=layui.layedit;
        var editIndex = layedit.build('LAY_demo_editor');
        fall();
        form.on('submit(btn)', function(){
            $.ajax({
                url:"/email/updateEmailBody",
                type:"post",
                data:{
                    "bPerson":$("#bPerson").val(),
                    "bRecipients":$("#bRecipients").val(),
                    "bTheme":$("#bTheme").val(),
                    "bRank":$("#bRank").val(),
                    "bTime":$("#bTime").val(),
                    "bContent":layedit.getContent(editIndex),
                    "bUrl":$("#bUrl").val(),
                    "bState":$("#bState").val(),
                    "bId":$("#lxy").val()
                },
                dataType:"json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            });
            return false;
        });


    function fall() {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            url: '/email/findEmailBody',
            where:{
                "bPerson":1
            },
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', fixed: 'left'},
                {field: 'b_id', width: 80, title: '邮件ID'},
                {field: 'b_recipients', width: 80, title: '收件人'},  //sort：true页面可进行排序操作
                {field: 'b_theme', width: 100, title: '标题'},
                {field: 'b_rank', width: 150, title: '级别', sort: true},
                {field: 'b_time', width: 180, title: '发布时间',sort: true},
                {field: 'b_content', width: 200, title: '内容',sort: true},
                {field: 'b_url', width: 160, title: '附件', sort: true},
                {field: 'b_person', width: 80, title: '发件人'},
                {field: 'b_state', width: 80, title: '状态', sort: true},
                {fixed: 'right', width: 150, align:'center', toolbar: '#barDemo'}
            ]],
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                $(".layui-table-box").find("[data-field='b_person']").css("display","none");
                $(".layui-table-box").find("[data-field='b_state']").css("display","none");
            }
        });



        // 编辑 删除 操作
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url:"/email/deleteEmailBody",
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
            } else if(layEvent === 'edit'){
                $("#lxy").val(data.b_id);
                $("input[name='b_person']").val(data.b_person);
                $("input[name='b_recipients']").val(data.b_recipients);
                $("input[name='b_theme']").val(data.b_theme);
                $("select[name='b_rank']").val(data.b_rank);
                $("textarea[name='b_content']").val(data.b_content);
                $("input[name='b_url']").val(data.b_url);
                $("input[name='b_state']").val(data.b_state);
                    layer.open({
                        type:1,//类型
                        area:['60%','80%'],//定义宽和高
                        shadeClose:false,//点击遮罩层关闭
                        content: $('#motaikunag') //打开的内容
                    });

            }
        })
    }
    });

</script>