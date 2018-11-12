<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-30
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>

<table class="layui-hide" id="demo" lay-filter="demo"></table>
<!--监听行工具-->
<script type="text/html" id="barDemo">
    {{#  if(d.state=="未审核"){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{#  } else { }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{#  } }}
</script>
<!--添加招聘计划-->
<form class="layui-form layui-form-pane" style="display:none;" id="inserRecruitPlan" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">计划名称</label>
        <div class="layui-input-block">
            <input type="text" name="planName" id="planName" lay-verify="required" placeholder="请输入计划名称"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">发起人</label>
        <div class="layui-input-block">
            <input type="text" name="applyUserId" value="${id}" id="applyUserId" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘渠道</label>
        <div class="layui-input-block">
            <select name="recruitTrench" lay-verify="required" id="recruitTrench">
                <option value=""></option>
                <option value="网络招聘">网络招聘</option>
                <option value="招聘会招聘" selected>招聘会招聘</option>
                <option value="人才猎头推荐">人才猎头推荐</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预算费用</label>
        <div class="layui-input-block">
            <input type="text" name="estimatedCost" id="estimatedCost" lay-verify="required" placeholder="请输入预算费用"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开始日期</label>
        <div class="layui-input-block">
            <input type="text" name="beginTime" id="beginTime" lay-verify="required" placeholder="请选择开始日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">结束日期</label>
        <div class="layui-input-block">
            <input type="text" name="endTime" id="endTime" lay-verify="required" placeholder="请选择结束日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘人数</label>
        <div class="layui-input-block">
            <input type="text" name="recruitNumber" id="recruitNumber" lay-verify="required" placeholder="请输入招聘人数"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘说明</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入招聘说明" id="recruitState" name="recruitState" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入招聘备注" id="recruitRemak" name="recruitRemak" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">附件文档</label>
        <input type="file" name="file" id="file">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">审批人</label>
        <div class="layui-input-block">
            <input type="text" id="user" lay-verify="required" placeholder="请选择审批人" autocomplete="off"
                   class="layui-input">
            <input type="text" name="userId" hidden id="userId">
        </div>
    </div>
    <div class="layui-input-block">
        <button type="button" class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>
<!--修改招聘计划-->
<form class="layui-form layui-form-pane" style="display:none;" id="updateRecruitPlan" enctype="multipart/form-data">
    <div class="layui-form-item">
        <input type="text" name="recruitPlanId" hidden id="updaterecruitPlanId">
        <label class="layui-form-label">计划名称</label>
        <div class="layui-input-block">
            <input type="text" name="planName" id="updateplanName" lay-verify="required" placeholder="请输入计划名称"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘渠道</label>
        <div class="layui-input-block">
            <select name="recruitTrench" lay-verify="required" id="updaterecruitTrench">
                <option value=""></option>
                <option value="网络招聘">网络招聘</option>
                <option value="招聘会招聘" selected>招聘会招聘</option>
                <option value="人才猎头推荐">人才猎头推荐</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预算费用</label>
        <div class="layui-input-block">
            <input type="text" name="estimatedCost" id="updateestimatedCost" lay-verify="required" placeholder="请输入预算费用"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开始日期</label>
        <div class="layui-input-block">
            <input type="text" name="beginTime" id="updatebeginTime" lay-verify="required" placeholder="请选择开始日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">结束日期</label>
        <div class="layui-input-block">
            <input type="text" name="endTime" id="updateendTime" lay-verify="required" placeholder="请选择结束日期"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘人数</label>
        <div class="layui-input-block">
            <input type="text" name="recruitNumber" id="updaterecruitNumber" lay-verify="required" placeholder="请输入招聘人数"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘说明</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入招聘说明" id="updaterecruitState" name="recruitState"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入招聘备注" id="updaterecruitRemak" name="recruitRemak"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">审批人</label>
        <div class="layui-input-block">
            <input type="text" id="updateuser" readonly="readonly" lay-verify="required" placeholder="请选择审批人"
                   autocomplete="off" class="layui-input">
            <input type="text" name="userId" hidden id="updateuserId">
        </div>
    </div>
    <div class="layui-input-block">
        <button type="button" class="layui-btn" lay-submit="" lay-filter="updatedemo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>

<!--选择部门-->
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
<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'authtree', 'layer', 'laydate', 'table'], function () {
        var authtree = layui.authtree;
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var table = layui.table;
        var $ = layui.$;

        //查询招聘计划
        table.render({
            elem: '#demo',
            url: 'queryPlanUser',
            limits: [5, 10, 15, 20],
            limit: 5,
            id: "queryPlan",
            title: '角色',
            toolbar: 'default',
            defaultToolbar: [''],
            where: {},
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', align: 'center', title: '计划编号'},
                {field: 'name', align: 'center', title: '计划名称'},
                {field: 'number', align: 'time', title: '招聘人数'},
                {field: 'begintime', align: 'center', title: '开始日期'},
                {field: 'endtime', align: 'center', title: '结束日期'},
                {field: 'state', align: 'center', title: '计划状态'},
                {field: 'trench', hide: 'true', align: 'center', title: '招聘渠道'},
                {field: 'cost', hide: 'true', align: 'center', title: '预算费用'},
                {field: 'rstate', hide: 'true', align: 'center', title: '招聘说明'},
                {field: 'remak', hide: 'true', align: 'center', title: '招聘备注'},
                {field: 'uname', hide: 'true', align: 'center', title: '审批人'},
                {field: 'uid', hide: 'true', align: 'center', title: '审批人编号'},
                {field: 'ApplyUname', hide: 'true', align: 'center', title: '发起人'},
                {field: 'Applyuid', hide: 'true', align: 'center', title: '发起人编号'},
                {fixed: 'right', align: 'center', toolbar: '#barDemo'}
            ]],
            page: true//是否显示分页
        });


        //建立日期
        laydate.render({
            elem: '#beginTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //建立修改时候日期
        laydate.render({
            elem: "#endTime",
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

        //点击文本框弹出layer
        $("#user").click(function () {
            jQueryajax("queryDept", null, "post", "json", function (data) {
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
                    jQueryajax("queryDeptUser", {deptids: b}, "post", "json", function (resp) {
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
                $("#user").val(data.elem.title);
                $("#userId").val(data.value);
                layer.close(layer.index);
            });
        });
        //添加招聘计划
        form.on('submit(demo2)', function () {
            $("#inserRecruitPlan").ajaxSubmit({
                url: "savePlan",
                type: "post",
                dataType: "json",
                success: function (response) {
                    if (response.message == "1") {
                        table.reload('queryPlan');
                        layer.close(layer.index);
                        layer.closeAll();
                        layer.msg("添加成功");
                    } else {
                        table.reload('queryPlan');
                        layer.close(layer.index);
                        layer.closeAll();
                        layer.msg("添加失败");
                    }
                }
            });
            return false;
        });

        layui.code
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
                        content: $('#inserRecruitPlan') //打开的内容
                    });
                    break;
            };
        });


        //监听工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //查看
                layer.confirm('真的删除行么', function (index) {
                    jQueryajax("deletePlan", {id: data.id}, "post", "json", function (response) {
                        if (response.message == "1") {
                            layer.msg("删除成功");
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            layer.close(index);
                        } else {
                            layer.msg("删除失败");
                        }
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                $("#updaterecruitPlanId").val(data.id);
                $("#updateplanName").val(data.name);
                $("#updaterecruitNumber").val(data.number);
                $("#updateestimatedCost").val(data.cost);
                $("#updatebeginTime").val(data.begintime);
                $("#updateendTime").val(data.endtime);
                $("#updaterecruitState").val(data.rstate);
                $("#updaterecruitRemak").val(data.remak);
                $("#updateuser").val(data.uname);
                $("#updateuserId").val(data.uid);
                layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#updateRecruitPlan') //打开的内容
                });
                form.on('submit(updatedemo2)', function () {
                    jQueryajax("updatePlan", $("#updateRecruitPlan").serialize(), "post", "json", function (responseA) {
                        if (responseA.message == "1") {
                            table.reload('queryPlan');
                            layer.close(layer.index);
                            layer.msg("修改成功");
                        } else {
                            table.reload('queryPlan');
                            layer.close(layer.index);
                            layer.msg("修改失败");
                        }
                    });
                    return false;
                });
            }
        });
    });
</script>
</body>
</html>
