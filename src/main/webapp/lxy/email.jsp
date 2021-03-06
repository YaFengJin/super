
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

    <title>添加邮寄及保存草稿箱</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>

</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>撰写邮件</legend>
</fieldset>
<form class="layui-form" action="">
    <div class="layui-form-item" hidden>
        <label class="layui-form-label">发件人</label>
        <div class="layui-input-block">
            <input name="b_person" value="${name}" style="width: 800px" class="layui-input" type="text" autocomplete="off" lay-verify="title">
            <input type="text" id="bPerson" value="${id}">
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
            <select id="bRank">
                <option value="一般">一般</option>
                <option value="重要">重要</option>
                <option value="非常重要">非常重要</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
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
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input name="b_state" id="bState"  class="layui-input" style="width: 800px" type="text" autocomplete="off" lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">状态1</label>
        <div class="layui-input-block">
            <input name="b_state1" id="bState1" value="0" class="layui-input" style="width: 800px" type="text" autocomplete="off" lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">状态2</label>
        <div class="layui-input-block">
            <input name="b_status" id="bStatus" value="2" class="layui-input" style="width: 800px" type="text" autocomplete="off" lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn" lay-filter="btn" lay-submit="">立即提交</button>
            <button type="button" class="layui-btn" lay-filter="demo" lay-submit="">保存至草稿箱</button>
            <button class="layui-btn layui-btn-primary" type="reset">重置</button>
        </div>
    </div>
</form>
</body>
</html>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript">
    layui.use(['form', 'layedit', 'jquery',], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit,
            $=layui.jquery;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //监听提交
        /*
        * 提交
        * */
        form.on('submit(btn)', function(){
            $.ajax({
                url:"/email/saveEmailBody",
                type:"post",
                data:{
                    "bPerson":$("#bPerson").val(),
                    "bRecipients":$("#bRecipients").val(),
                    "bTheme":$("#bTheme").val(),
                    "bRank":$("#bRank").val(),
                    "bTime":$("#bTime").val(),
                    "bContent":layedit.getContent(editIndex),
                    "bUrl":$("#bUrl").val(),
                    "bState":0,
                    "bState1":0,
                    "bStatus":2
                },
                dataType:"json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            });
            return false;
        });
        /*
        * 保存至草稿箱
        * */
        form.on('submit(demo)', function(){
            $.ajax({
                url:"/email/saveDrafts",
                type:"post",
                data:{
                    "bPerson":$("#bPerson").val(),
                    "bRecipients":$("#bRecipients").val(),
                    "bTheme":$("#bTheme").val(),
                    "bRank":$("#bRank").val(),
                    "bTime":$("#bTime").val(),
                    "bContent":layedit.getContent(editIndex),
                    "bUrl":$("#bUrl").val(),
                    "bState":1,
                    "bState1":0,
                    "bStatus":2
                },
                dataType:"json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            });
            return false;
        });
        /*var a="";
        fall(a);*/
    });
</script>
