<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-27
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招聘需求</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<form class="layui-form layui-form-pane" hidden id="inserRecruitNeed" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">需求岗位</label>
        <div class="layui-input-block">
            <input type="text" name="needPost" id="needPost" lay-verify="required" placeholder="请输入需求岗位"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用工日期</label>
        <div class="layui-input-block">
            <input type="text" name="laborTime" id="laborTime" lay-verify="required" placeholder="请输入用工日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">需求人数</label>
        <div class="layui-input-block">
            <input type="text" name="needNumber" id="needNumber" lay-verify="required" placeholder="请输入需求人数"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">需求部门</label>
        <div class="layui-input-block">
            <input type="text" id="selectdDept" lay-verify="required" placeholder="请选择需求部门" autocomplete="off"
                   class="layui-input">
            <input type="text" name="needDept" hidden  id="selectDeptid">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" id="recruitNRemak" name="recruitNRemak" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择文件</label>
        <input type="file" name="file" id="file">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">岗位要求</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" id="postAsk" lay-verify="article_desc" name="postAsk"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-input-block">
        <button type="button" class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<!--修改的模态框-->
<form class="layui-form layui-form-pane" hidden id="updateRecruitNeed" enctype="multipart/form-data">
    <div class="layui-form-item">
        <input type="text" name="recruitNeedId" hidden  id="recruitNeedId">
        <label class="layui-form-label">需求岗位</label>
        <div class="layui-input-block">
            <input type="text" name="needPost" id="updateneedPost" lay-verify="required" placeholder="请输入需求岗位"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用工日期</label>
        <div class="layui-input-block">
            <input type="text" name="laborTime" id="updatelaborTime" lay-verify="required" placeholder="请输入用工日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">需求人数</label>
        <div class="layui-input-block">
            <input type="text" name="needNumber" id="updateneedNumber" lay-verify="required" placeholder="请输入需求人数"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">需求部门</label>
        <div class="layui-input-block">
            <input type="text" id="updateselectdDept" lay-verify="required"
                   placeholder="请选择需求部门" autocomplete="off"
                   class="layui-input">
            <input type="text" name="needDept" hidden  id="updateselectDeptid">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" id="updaterecruitNRemak" name="recruitNRemak"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择文件</label>
        <input type="text" id="updatefile1">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择文件</label>
        <input type="file" name="file" id="updatefile">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">岗位要求</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" id="updatepostAsk" lay-verify="article_desc" name="postAsk"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-input-block">
        <button type="button" class="layui-btn" lay-submit="" lay-filter="updatedemo">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<!--添加的时候选择部门-->
<form class="layui-form" id="treeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
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

<!--修改的时候选择部门-->
<form class="layui-form" id="updateQueryDpetName" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="LAY-auth-tree-index-update"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div id="LAY-auth-tree-submit-update"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline" id="updateRecruit">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="updateDpet" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>

<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'authtree', 'layer', 'layedit', 'laydate', 'table'], function () {
        var authtree = layui.authtree;
        var form = layui.form;
        var layer = layui.layer;
        var layedit = layui.layedit;
        var laydate = layui.laydate;
        var table = layui.table;
        var $ = layui.$;


        var postAsk = layedit.build('postAsk'); //建立编辑器
        var updatepostAsk = layedit.build('updatepostAsk');
        //建立日期
        laydate.render({
            elem: '#laborTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //建立修改时候日期
        laydate.render({
            elem: "#updatelaborTime",
            format: 'yyyy-MM-dd',
            min: 0
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
        }

        //查询部门
        $("#selectdDept").click(function () {
            jQueryajax("queryDept", null, "post", "json", function (response) {
                //生成树形菜单
                authtree.render('#LAY-auth-tree-index', response, {
                    autowidth: true,
                    layfilter: 'lay-check-auth',
                });
                //获取选中的改变事件,通过id串去查询部门的名称并显示在页面上
                authtree.on('change(lay-check-auth)', function (trees) {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#LAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#LAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    jQueryajax("queryDeptName", {"deptid": b}, "post", "json", function (resp) {
                        var a = resp.join(",");
                        $("#DeptName").html(a);
                    });
                });
                $("#saveDept").click(function () {
                    $("#selectdDept").val($("#DeptName").html());
                    $("#selectDeptid").val(authtree.getChecked('#LAY-auth-tree-index'));
                    layer.close(layer.index);
                });
            });
            layer.open({
                type: 1,//类型
                title: '选择部门',//标题
                shadeClose: false,//点击遮罩层关闭
                offset: 't',
                content: $('#treeView') //打开的内容
                /*content: 'index.jsp'//打开的内容 type为2*/
            });
        });
        //添加招聘需求
        form.on('submit(demo2)', function () {
            layedit.sync(postAsk);
            var options = {
                url: "saveRecruit_Need",
                type: "post",
                dataType: "json",
                success: function (response) {
                    if (response.message=="1"){
                        table.reload('saveRole',{
                            where: {begintime: "", endtime: ""}
                        });
                        alert("添加成功");
                        parent.layer.close(layer.index);
                    } else{
                        alert("添加失败");
                    }
                }
            };
            $("#inserRecruitNeed").ajaxSubmit(options);
            return false;
        });

        //修改招聘需求
        form.on('submit(updatedemo)', function () {
            layedit.sync(updatepostAsk);
            var options = {
                url: "updateRecruit_Need",
                type: "post",
                dataType: "json",
                success: function (response) {
                    if (response.message=="1"){
                        table.reload('saveRole',{
                            where: {begintime: "", endtime: ""}
                        });
                        alert("修改成功");
                        layer.close(layer.index);
                    } else{
                        alert("修改失败");
                    }
                }
            };
            $("#updateRecruitNeed").ajaxSubmit(options);
            return false;
        });

        //执行分页并渲染表格
        table.render({
            elem: '#demo',
            url: 'queryRecruit_Need',
            limits: [5, 10, 15, 20],
            limit: 5,
            id: "saveRole",
            title: '角色',
            toolbar: 'default',
            defaultToolbar: [''],
            where: {begintime: "", endtime: ""},
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', align: 'center', title: '需求编号'},
                {field: 'post', align: 'center', title: '需求岗位'},
                {field: 'time', align: 'time', title: '用工日期'},
                {field: 'number', align: 'center', title: '需求数量'},
                {field: 'dept', align: 'center', title: '需求部门'},
                {field: 'nremark', align: 'center', title: '备注'},
                {field: 'naccess', hide: 'true', align: 'center', title: '文件'},
                {field: 'postask', hide: 'true', align: 'center', title: '岗位要求'},
                {field: 'deptids', hide: 'true', align: 'center', title: '岗位编号'},
                {fixed: 'right', align: 'center', toolbar: '#barDemo'}
            ]],
            page: true//是否显示分页
        });
        //监听头工具栏事件
        table.on('toolbar(demo)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type: 1,//类型
                        title: '选择部门',//标题
                        shadeClose: false,//点击遮罩层关闭
                        offset: 't',
                        content: $('#inserRecruitNeed') //打开的内容
                    });
                    break;
                case 'update':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        $("#recruitNeedId").val(data[0].id);
                        $("#updateneedPost").val(data[0].post);
                        $("#updatelaborTime").val(data[0].time);
                        $("#updatefile").val(data[0].nacess);
                        $("#updateneedNumber").val(data[0].number);
                        $("#updateselectdDept").val(data[0].dept);
                        $("#updateselectDeptid").val(data[0].deptids);
                        $("#updaterecruitNRemak").val(data[0].nremark);
                        $("#updatepostAsk").val(data[0].postask);
                        $("#updatefile1").val(data[0].naccess);
                        layer.open({
                            type: 1,//类型
                            area: ['60%', '80%'],
                            title: '修改照片需求',//标题
                            shadeClose: false,//点击遮罩层关闭
                            offset: 't',
                            content: $('#updateRecruitNeed') //打开的内容
                        });
                        $("#updateRecruit").html($("#updateselectdDept").val());
                    }
                    break;
                case 'delete':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除行么', function (index) {
                            jQueryajax("deleteRecruit_Need",{id:data[0].id},"post","json",function (response) {
                                if (response.message=="1"){
                                    layer.msg("删除成功");
                                    table.reload('saveRole',{
                                        where: {begintime: "", endtime: ""}
                                    });
                                    obj.del();
                                } else {
                                    layer.msg("删除失败");
                                }
                            })
                        });
                    }
                    break;
            };
        });
        //获取文件路径
        $("#updatefile").change(function () {
            for (var i = 0; i < $(this).get(0).files.length; ++i) {
                //方式一：
                var filePath = $(this).val();
                $("#updatefile1").val(filePath);
            }
        });

        $("#updateselectdDept").click(function () {

            jQueryajax("updateQueryDeptName", {id: $("#recruitNeedId").val()}, "post", "json", function (response) {
                authtree.render("#LAY-auth-tree-index-update", response, {
                    autowidth: true,
                    layfilter: 'lay-check-convert-auth'
                });
                //获取选中的改变事件,通过id串去查询部门的名称并显示在页面上
                authtree.on('change(lay-check-convert-auth)', function (trees) {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#LAY-auth-tree-index-update').length; i++) {
                        a[a.length] = authtree.getChecked('#LAY-auth-tree-index-update')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    jQueryajax("queryDeptName", {"deptid": b}, "post", "json", function (resp) {
                        var a = resp.join(",");
                        $("#updateRecruit").html(a);
                    });
                });
                layer.open({
                    type: 1,//类型
                    title: '修改照片需求',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#updateQueryDpetName') //打开的内容
                });
                $("#updateDpet").click(function () {
                    $("#updateselectdDept").val($("#updateRecruit").html());
                    $("#updateselectDeptid").val(authtree.getChecked('#LAY-auth-tree-index-update'));
                    layer.close(layer.index);
                });
            });
        });
});
</script>
</body>
</html>
