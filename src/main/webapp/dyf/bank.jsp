<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-18
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品库</title>
    <%--${pageContext.request.contextPath}--%>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2 id="sp">办公用品库</h2>
<center>
<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
    <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新建库</button>
</div>
</center>

<div style="margin-top: 17px;margin-left: 1103px;">
    <span>办公用品库搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入库名称进行模糊查询"/>
</div>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="savezhezhao" style="display: none">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <label class="layui-form-label">库名称:*</label>
            <div class="layui-input-block">
                <input type="tel" name="b_bankname" lay-verify="required" autocomplete="off" style="width: 250px" placeholder="请输入办公用品库名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">部门权限:*</label>
            <div class="layui-input-block">
                <input type="tel" id="deptName" lay-verify="required" style="width: 250px" autocomplete="off" class="layui-input">
                <input type="text" id="deptid" hidden name="deptid">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">库管理员:*</label>
            <div class="layui-input-block">
                <input type="tel" id="username" lay-verify="required" style="width: 250px" autocomplete="off" class="layui-input">
                <input type="text" name="userid" hidden id="userid">
            </div>
        </div>

        <input type="hidden" checked name="bstate" id="bstate" value="0">

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit  lay-filter="save">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div id="upzhezhao" style="display: none;">
    <form class="layui-form" id="updatebankfrom">
        <div class="layui-form-item" hidden>
            <label class="layui-form-label">办公用品库编号:</label>
            <div class="layui-input-block">
                <input type="text" id="bId"  name="b_id" lay-verify="required" readonly="readonly"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">办公用品库名称:</label>
            <div class="layui-input-block">
                <input type="text" id="bBankname" name="b_bankname" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">部门权限</label>
            <div class="layui-input-block">
                <input type="text" id="updatedeptname" lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" id="updatedeptid" hidden name="deptid">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">库管理员</label>
            <div class="layui-input-block">
                <input type="text" id="updateusername" lay-verify="title" autocomplete="off" class="layui-input">
                <input type="text" id="updateuserid" hidden name="userid">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="update" lay-submit="" lay-filter="updatebank">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<form class="layui-form" id="treeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="UserNames">

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
            <div class="layui-inline" id="DeptNames">

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


<form class="layui-form" id="updatetreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="updateLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="updateUserNames">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="updateUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>

<!--添加的时候选择部门-->
<form class="layui-form" id="updateDepttreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="updateDeptLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div id="updateLAY-auth-tree-submit"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline" id="updateDeptNames">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="updateDept" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>
</body>

</html>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-danger" lay-Event="del">删除</button>
    <button class="layui-btn layui-btn-normal" lay-Event="upd">修改</button>
    <button class="layui-btn layui-btn-normal" lay-Event="qi">查看</button>
</script>

<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use('layer', function(){
        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type:1,//类型
                    title:'添加办公用品库',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#savezhezhao') //打开的内容
                });
            },

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
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

    layui.use(['table','layer','form','layedit', 'laydate','authtree'], function(){
        var layer= layui.layer
            ,form = layui.form
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,authtree=layui.authtree;
        var kw='';
        addData(kw);

        form.on('submit(save)', function(data){
            //发送ajax
            $.ajax({
                url:"/savebank",
                type:"post",
                data:$("#form").serialize(),
                async : false,
                dataType:"json",
                success:function(data){
                    layer.msg(data.message);
                    layer.closeAll();
                    location.reload();
                }
            })
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        form.on('submit(updatebank)', function(data){
            //发送ajax
            $.ajax({
                url:"/updatebank",
                type:"post",
                data:$("#updatebankfrom").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //点击文本框弹出layer
        $("#username").click(function () {
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
                        $("#UserNames").html(uname);
                        form.render();
                    });
                });
            });
        });
        //点击确定的时候获取用户名字和编号
        form.on('radio(filter)', function (data) {
            $("#saveUser").click(function () {
                $("#username").val(data.elem.title);
                $("#userid").val(data.value);
                layer.close(layer.index);
            });
        });
        //查询部门
        $("#deptName").click(function () {
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
                        $("#DeptNames").html(a);
                    });
                });
                $("#saveDept").click(function () {
                    $("#deptName").val($("#DeptNames").html());
                    $("#deptid").val(authtree.getChecked('#DeptLAY-auth-tree-index'));
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




        //点击文本框弹出layer
        $("#updateusername").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#updateLAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'updatelay-check-auth',
                });
                layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#updatetreeView') //打开的内容
                });
                authtree.on('change(updatelay-check-auth)', function () {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#updateLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#updateLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    //查询用户
                    jQueryajax("/recruit/queryDeptUser", {deptids: b}, "post", "json", function (resp) {
                        var uname = "";
                        for (var i = 0; i < resp.length; i++) {
                            uname += "<input type='radio' name='uid' value='" + resp[i].id + "' lay-filter='updatefilter' title='" + resp[i].name + "'><span style='display: none'>" + resp[i].name + "</span><br/>";
                        }
                        $("#updateUserNames").html(uname);
                        form.render();
                    });
                });
            });
        });
        //点击确定的时候获取用户名字和编号
        form.on('radio(updatefilter)', function (data) {
            $("#updateUser").click(function () {
                $("#updateusername").val(data.elem.title);
                $("#updateuserid").val(data.value);
                layer.close(layer.index);
            });
        });
        //查询部门
        $("#updatedeptname").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (response) {
                //生成树形菜单
                authtree.render('#updateDeptLAY-auth-tree-index', response, {
                    autowidth: true,
                    layfilter: 'updateDeptlay-check-auth',
                });
                //获取选中的改变事件,通过id串去查询部门的名称并显示在页面上
                authtree.on('change(updateDeptlay-check-auth)', function (trees) {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#updateDeptLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#updateDeptLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    jQueryajax("/recruit/queryDeptName", {"deptid": b}, "post", "json", function (resp) {
                        var a = resp.join(",");
                        $("#updateDeptNames").html(a);
                    });
                });
                $("#updateDept").click(function () {
                    $("#updatedeptname").val($("#updateDeptNames").html());
                    $("#updatedeptid").val(authtree.getChecked('#updateDeptLAY-auth-tree-index'));
                    layer.close(layer.index);
                });
            });
            layer.open({
                type: 1,//类型
                title: '选择部门',//标题
                shadeClose: false,//点击遮罩层关闭
                offset: 't',
                content: $('#updateDepttreeView') //打开的内容
            });
        });
    });
    function addData(kwx){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/showData?keyWord='+kwx
            ,limit:2 //默认为10
            ,page: true
            ,cols: [[
                 {field:'b_id', width:340, title: '序号', sort: true} //sort：true页面可进行排序操作
                ,{field:'b_bankname', width:338, title: '办公用品库'}
                ,{field:'DeptName', width:330, title: '所属部门'}
                ,{field:'UserName', width:330, title: '仓库管理员'}
                ,{fixed: 'right', width: 330,align:'center', toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
                //数据的回调用，可不写

            }
        });

        table.on('tool(tab)',function (obj) {
            var data = obj.data,LayEvent=obj.event;
            if (LayEvent ==='del'){
                var b_id = data.b_id;
                layer.confirm('你确定删除数据吗？', {
                    btn: ['确定','取消'] //按钮
                },function () {
                    $.ajax({
                        url:"/deletebank",
                        type:"post",
                        data:{
                            "b_id":b_id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            location.reload();
                        }
                    });

                });
            };
            if (LayEvent ==='upd'){
                var b_id = data.b_id;
                layer.open({
                    type:1,//类型
                    title:'修改办公用品库',
                    area:['40%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#upzhezhao') //打开的内容
                });
                $.ajax({
                    url:"/updatequerybank",
                    type:"post",
                    data:{
                        "b_id":b_id
                    },
                    dataType:"json",
                    success:function(data){
                        var a = data.list[0];
                        $("#bId").val(a.b_id);
                        $("#bBankname").val(a.b_bankname);
                        $("#updatedeptname").val(a.DeptName);
                        $("#updatedeptid").val(a.deptid);
                        $("#updateusername").val(a.UserName);
                        $("#updateuserid").val(a.userid);
                    }
                });

            };
            if (LayEvent ==='qi'){
                var b_id = data.b_id;
                layer.open({
                    type:2,//类型
                    title:'办公用品类',
                    area:['40%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: '/dyf/sort.jsp?b_id='+b_id
                });
            };
        });

    }
    $("#sear1").keyup(function(event){
        if(event.keyCode ==13){
            var keyWord=$("#sear1").val();
            addData(keyWord);
        }
    });
</script>