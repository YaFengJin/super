    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
        <html>
        <head><base href="<%=basePath %>">
        <title>Title</title>
        <link rel="stylesheet" href="<%=basePath %>/static/layui/css/layui.css">
        <script src="<%=basePath %>/static/layui/layui.js"></script>
        </head>
        <body>
        <form class="layui-form" action="">
        <div class="layui-form-item">
        <label class="layui-form-label">会议室名称*</label>
        <div class="layui-input-block">
        <input name="mName" class="layui-input" type="text" placeholder="请输入名称" autocomplete="off" lay-verify="title">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">会议室描述*</label>
        <div class="layui-input-block">
        <input name="mDescription" class="layui-input" type="text" placeholder="请填写会议室描述" autocomplete="off"
        lay-verify="required">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">管理员*</label>
        <div class="layui-input-block">
        <input  id="adminName" class="layui-input" type="text" placeholder="请选择会议室管理员" autocomplete="off"
        lay-verify="required">
        <input type="text" name="admin" hidden id="admin">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">申请权限*</label>
        <div class="layui-input-block">
        <input  id="jurisdictionName" class="layui-input" type="text" placeholder="请填写部门申请权限" autocomplete="off"
        lay-verify="required">
        <input type="text" name="jurisdiction" hidden id="jurisdiction">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">可容纳人数</label>
        <div class="layui-input-block">
        <input name="mNumber" class="layui-input" type="text" placeholder="请填写会议室容纳人数" autocomplete="off"
        lay-verify="people">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
        <input name="mAdress" class="layui-input" type="text" placeholder="请填写会议室地址" autocomplete="off"
        lay-verify="e">
        </div>
        </div>

        <div class="layui-form-item">
        <label class="layui-form-label">可申请日期</label>
        <div class="layui-input-block" id="week">
        <input name="functional" title="星期一" type="checkbox" checked="" value="星期一">
        <input name="functional" title="星期二" type="checkbox" checked="" value="星期二">
        <input name="functional" title="星期三" type="checkbox" checked="" value="星期三">
        <input name="functional" title="星期四" type="checkbox" checked="" value="星期四">
        <input name="functional" title="星期五" type="checkbox" checked="" value="星期五">
        <input name="functional" title="星期六" type="checkbox" value="星期六">
        <input name="functional" title="星期日" type="checkbox" value="星期日">
        <input type="text" id="mTime" hidden style="width:500px">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">是否支持视频会议</label>
        <div class="layui-input-block">
        <input name="mTrueoffalse" type="checkbox" checked="" lay-filter="switchTest" lay-skin="switch"
        lay-text="支持|不支持">
        </div>
        </div>
        <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">设备情况</label>
        <div class="layui-input-block">
        <textarea class="layui-textarea" id="mCondition" placeholder="请输入内容"></textarea>
        <input type="hidden" name="mState" value="1">
        </div>
        </div>
        <div class="layui-form-item">
        <div class="layui-input-block">
        <button class="layui-btn" lay-filter="demo1" id="btn" lay-submit="demo">立即提交</button>
        <button class="layui-btn layui-btn-primary" type="reset">重置</button>
        </div>
        </div>
            </form>

            <form class="layui-form" id="treeView" style="display: none">
            <div class="layui-form-item">
            <label class="layui-form-label">选择部门</label>
            <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-form-item">
            <div class="layui-input-block" id="UserName">

            </div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="saveUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
            </div>
            </div>
            </form>

            <!--添加的时候选择部门-->
            <form class="layui-form" id="DepttreeView" style="display: none">
            <div class="layui-form-item">
            <label class="layui-form-label">选择部门</label>
            <div class="layui-input-inline">
            <div id="DeptLAY-auth-tree-index"></div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-form-item">
            <div class="layui-inline">
            <div id="LAY-auth-tree-submit"></div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-inline" id="DeptName">

            </div>
            </div>
            </div>
            <div class="layui-form-item">
            <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="saveDept" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
            </div>
            </div>
            </form>
        </body>
        </html>
        <script>

        layui.config({
        base: '../static/extends/',
        }).extend({
        authtree: 'authtree'
        });
        layui.use(['form','jquery','authtree'], function(){
        var form = layui.form,
        layer = layui.layer;
        var $ = jQuery = layui.$;
        var authtree=layui.authtree;
            //封装ajax
            function jQueryajax(url, data, type, dataType, response) {
            $(function () {
            $.ajax({
            url: url,
            type: type,
            data: data,
            dataType: dataType,
            success: function (res) {
            response(res);
            }
            });
            });
            };
        //获取多选框的内容
        $("#week").mouseout(function(){
        var groupCheckbox=$("input[name='functional']");
        var functional="";
        for(var i=0;i<groupCheckbox.length;i++){
        if(groupCheckbox[i].checked){
        var val =groupCheckbox[i].value;
        if(functional.length>0){
        functional+=","+val;
        }else{
        functional+=val;
        }
        }
        }
        $("#mTime").val(functional);
        });
        //自定义验证规则
        form.verify({
        title: function(value){
        if(value.length < 1){
        return '请填写会议室名称';
        }
        },
        people:[/^[0-9]*$/, '必须是为正的整数呀']
        });
        //监听指定开关
        form.on('switch(switchTest)', function(data){
        layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
        offset: '6px'
        });
        layer.tips('请认真核对您的选择', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(){
        $.ajax({
        url:"meetRoomController/AddMeetRoom",
        type:"post",
        data:{
        "usersurface.userid":$("#admin").val(),
        "deptid":$("#jurisdiction").val(),
        "mName":$("input[name='mName']").val(),
        "mDescription":$("input[name='mDescription']").val(),
        "mNumber":$("input[name='mNumber']").val(),
        "mTrueoffalse":$("input[name='mTrueoffalse']").val(),
        "mTime":$("#mTime").val(),
        "mCondition":$("#mCondition").val(),
        "mAdress":$("input[name='mAdress']").val(),
        "mState":$("input[name='mState']").val()
        },
        dataType:"json",
        success:function(data){
        alert(data.message);
        window.parent.location.reload();
        },
        error:function(){
        alert("添加失败");
        }
        });
        return false;
        });

            //点击文本框弹出layer
            $("#adminName").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
            //生成树形菜单
            authtree.render('#LAY-auth-tree-index', data, {
            autowidth: true,
            layfilter: 'lay-check-auth',
            });
            layer.open({
            type: 1,//类型
            title: '选择部门',//标题
            shadeClose: false,//点击遮罩层关闭
            offset: 't',
            content: $('#treeView') //打开的内容
            });
            authtree.on('change(lay-check-auth)', function () {
            var a = [];
            for (var i = 0; i < authtree.getChecked('#LAY-auth-tree-index').length; i++) {
            a[a.length] = authtree.getChecked('#LAY-auth-tree-index')[i];
            }
            //数组拆分成字符串
            var b = a.join(",");
            //查询用户
            jQueryajax("/recruit/queryDeptUser", {deptids: b}, "post", "json", function (resp) {
            var uname = "";
            for (var i = 0; i < resp.length; i++) {
            uname += "<input type='radio' name='uid' value='" + resp[i].id + "' lay-filter='filter' title='" + resp[i].name + "'><span style='display: none'>" + resp[i].name + "</span><br/>";
            }
            $("#UserName").html(uname);
            form.render();
            });
            });
            });
            });

            //点击确定的时候获取用户名字和编号
            form.on('radio(filter)', function (data) {
            $("#saveUser").click(function () {
            $("#adminName").val(data.elem.title);
            $("#admin").val(data.value);
            layer.close(layer.index);
            });
            });


            //查询部门
            $("#jurisdictionName").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (response) {
            //生成树形菜单
            authtree.render('#DeptLAY-auth-tree-index', response, {
            autowidth: true,
            layfilter: 'Deptlay-check-auth',
            });
            //获取选中的改变事件,通过id串去查询部门的名称并显示在页面上
            authtree.on('change(Deptlay-check-auth)', function (trees) {
            var a = [];
            for (var i = 0; i < authtree.getChecked('#DeptLAY-auth-tree-index').length; i++) {
            a[a.length] = authtree.getChecked('#DeptLAY-auth-tree-index')[i];
            }
            //数组拆分成字符串
            var b = a.join(",");
            jQueryajax("/recruit/queryDeptName", {"deptid": b}, "post", "json", function (resp) {
            var a = resp.join(",");
            $("#DeptName").html(a);
            });
            });
            $("#saveDept").click(function () {
            $("#jurisdictionName").val($("#DeptName").html());
            $("#jurisdiction").val(authtree.getChecked('#DeptLAY-auth-tree-index'));
            layer.close(layer.index);
            });
            });
            layer.open({
            type: 1,//类型
            title: '选择部门',//标题
            shadeClose: false,//点击遮罩层关闭
            offset: 't',
            content: $('#DepttreeView') //打开的内容
            });
            });
        });
        </script>
