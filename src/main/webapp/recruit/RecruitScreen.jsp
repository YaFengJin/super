<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-11-03
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招聘筛选</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script type="text/html" id="barDemo">
    {{#  if(d.state=="待筛选"){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">详细信息</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="apply">通过</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="notapply">不通过</a>
    {{#  } else{ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">详细信息</a>
    {{#  }  }}
</script>
<!--添加招聘筛选-->
<form class="layui-form" id="saveTalents" style="display: none" >
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="talentsName" lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="talentsId" hidden  id="talentsId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text"  id="recruitPlanName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="recruitPlanId">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">应聘岗位</label>
            <div class="layui-input-inline">
                <input type="text"  id="talentsWork" lay-verify="required"
                        autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">所学专业</label>
            <div class="layui-input-inline">
                <input type="text"  id="talentsDiction" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="text" id="talentsPhone" readonly="readonly" lay-verify="required|phone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">发起人</label>
            <div class="layui-input-inline">
                <input type="text" name="recruitScreeName" id="recruitScreeName" value="${name}"  readonly="readonly"lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">下一次筛选办理人</label>
            <div class="layui-input-inline">
                <input type="text" id="ScreenuserName"  lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="userId" hidden id="userId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">下一次筛选时间</label>
            <div class="layui-input-inline">
                <input type="text" name="screenTime" placeholder="yyyy-MM-dd"  id="screenTime"  lay-verify="required|date" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<!--修改招聘筛选-->
<form class="layui-form" id="updateTalents" style="display: none" >
    <div class="layui-form-item">
        <div class="layui-inline">
            <input type="text" hidden name="recruitScreenId" id="recruitScreenId">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="updatetalentsName" lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="talentsId" hidden  id="updatetalentsId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text"  id="updaterecruitPlanName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="updaterecruitPlanId">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">应聘岗位</label>
            <div class="layui-input-inline">
                <input type="text"  id="updatetalentsWork" lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">所学专业</label>
            <div class="layui-input-inline">
                <input type="text"  id="updatetalentsDiction" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="text" id="updatetalentsPhone" readonly="readonly" lay-verify="required|phone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">发起人</label>
            <div class="layui-input-inline">
                <input type="text" name="recruitScreeName" id="updaterecruitScreeName" value="${name}"  readonly="readonly"lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">下一次筛选办理人</label>
            <div class="layui-input-inline">
                <input type="text" id="updateScreenuserName"  lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="userId" hidden id="updateuserId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">下一次筛选时间</label>
            <div class="layui-input-inline">
                <input type="text" name="screenTime" placeholder="yyyy-MM-dd"  id="updatescreenTime"  lay-verify="required|date" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn" lay-submit="" lay-filter="updatedemo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<!--获取人才库-->
<form class="layui-form" id="chooseTalentName" style="display: none">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <div id="TalentsNametoId"></div>
        </div>
    </div>
</form>
<!--选择下一步骤办理人员-->
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

<!--修改的时候获取人才库-->
<form class="layui-form" id="updatechooseTalentName" style="display: none">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <div id="updateTalentsNametoId"></div>
        </div>
    </div>
</form>
<!--修改的时候选择下一步骤办理人员-->
<form class="layui-form" id="updatetreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="updateLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="updateUserName">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="updatesaveUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>
<!--查看详细信息-->
<form class="layui-form" id="showTalents" style="display: none" >
    <div class="layui-form-item">
        <div class="layui-inline">
            <input type="text" hidden name="recruitScreenId" readonly="readonly" id="showrecruitScreenId">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="showtalentsName" lay-verify="required" readonly="readonly" autocomplete="off" class="layui-input">
                <input type="text" name="talentsId" hidden  readonly="readonly" id="showtalentsId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text"  id="showrecruitPlanName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="showrecruitPlanId">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">应聘岗位</label>
            <div class="layui-input-inline">
                <input type="text"  id="showtalentsWork" lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">所学专业</label>
            <div class="layui-input-inline">
                <input type="text"  id="showtalentsDiction" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="text" id="showtalentsPhone" readonly="readonly" lay-verify="required|phone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">发起人</label>
            <div class="layui-input-inline">
                <input type="text" name="recruitScreeName" id="showrecruitScreeName" value="${name}"  readonly="readonly"lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">下一次筛选办理人</label>
            <div class="layui-input-inline">
                <input type="text" id="showScreenuserName" readonly="readonly"  lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="userId" hidden readonly="readonly" id="showuserId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">下一次筛选时间</label>
            <div class="layui-input-inline">
                <input type="text" name="screenTime" placeholder="yyyy-MM-dd" readonly="readonly"  id="showscreenTime"  lay-verify="required|date" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" id="close" class="layui-btn" lay-submit="" >关闭</button>
        </div>
    </div>
</form>


<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'layer', 'laydate', 'table','authtree'], function () {
        var $=layui.$;
        var form=layui.form;
        var layer=layui.layer;
        var laydate=layui.laydate;
        var table=layui.table;
        var authtree=layui.authtree;
        //声明全局变量接受layer
        var saveLayer="";
        var updateLayer="";
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
        //执行分页并渲染表格
        table.render({
            elem: '#demo',
            url: 'queryScreen',
            limits: [5, 10, 15, 20],
            limit: 5,
            id: "queryScreen",
            title: '招聘筛选',
            toolbar: 'default',
            defaultToolbar: [''],
            where: {begintime: "", endtime: ""},
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', hide: 'true', align: 'center', title: '编号'},
                {field: 'tname', align: 'center', title: '应聘人姓名'},
                {field: 'name2', align: 'center', title: '应聘岗位'},
                {field: 'name1', align: 'center', title: '所学专业'},
                {field: 'phone', align: 'center', title: '联系方式'},
                {field: 'name', hide: 'true', align: 'center', title: '发起人'},
                {field: 'state', align: 'center', title: '筛选状态'},
                {field: 'time',hide:'true', align: 'time', title: '下一次筛选时间'},
                {field: 'tid',hide:'true', align: 'center', title: '人才库编号'},
                {field: 'pid', hide: 'true', align: 'center', title: '计划编号'},
                {field: 'pname', hide: 'true', align: 'center', title: '计划名称'},
                {field: 'uid', hide: 'true', align: 'center', title: '下次筛选办理人编号'},
                {field: 'uname', hide: 'true', align: 'center', title: '下次筛选办理人名字'},
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
                    saveLayer=layer.open({
                        type: 1,//类型
                        title: '选择部门',//标题
                        shadeClose: false,//点击遮罩层关闭
                        offset: 't',
                        content: $('#saveTalents') //打开的内容
                    });
                    break;
                case 'update':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        $("#recruitScreenId").val(data[0].id);
                        $("#updatetalentsName").val(data[0].tname);
                        $("#updatetalentsId").val(data[0].tid);
                        $("#updaterecruitPlanName").val(data[0].pname);
                        $("#updaterecruitPlanId").val(data[0].pid);
                        $("#updatetalentsWork").val(data[0].name2);
                        $("#updatetalentsDiction").val(data[0].name1);
                        $("#updatetalentsPhone").val(data[0].phone);
                        $("#updaterecruitScreeName").val(data[0].name);
                        $("#updateScreenuserName").val(data[0].uname);
                        $("#updateuserId").val(data[0].uid);
                        $("#updatescreenTime").val(data[0].time);
                        updateLayer=layer.open({
                            type: 1,//类型
                            area: ['60%', '80%'],
                            title: '修改照片需求',//标题
                            shadeClose: false,//点击遮罩层关闭
                            offset: 't',
                            content: $('#updateTalents') //打开的内容
                        });
                    }
                    break;
                case 'delete':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除行么', function (index) {
                            jQueryajax("deleteScreen",{id:data[0].id},"post","json",function (response) {
                                if (response.message=="1"){
                                    layer.msg("删除成功");
                                    table.reload('queryScreen');
                                    obj.del();
                                } else {
                                    table.reload('queryScreen');
                                    layer.msg("删除失败");
                                }
                            })
                        });
                    }
                    break;
            };
        });
        //监听行工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'edit') { //查看
                $("#showrecruitScreenId").val(data.id);
                $("#showtalentsName").val(data.tname);
                $("#showtalentsId").val(data.tid);
                $("#showrecruitPlanName").val(data.pname);
                $("#showrecruitPlanId").val(data.pid);
                $("#showtalentsWork").val(data.name2);
                $("#showtalentsDiction").val(data.name1);
                $("#showtalentsPhone").val(data.phone);
                $("#showrecruitScreeName").val(data.name);
                $("#showScreenuserName").val(data.uname);
                $("#showuserId").val(data.uid);
                $("#showscreenTime").val(data.time);
                layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#showTalents') //打开的内容
                });
                $("#close").click(function () {
                    layer.close(layer.index);
                });
            } else if (layEvent === 'apply') { //编辑
                layer.confirm('确定要执行这个操作吗?', function (index) {
                    $.ajax({
                        url:"updateScreenStateSuccess",
                        type:"post",
                        data:{id:data.id},
                        dataType:"json",
                        success:function (response) {
                            if(response.message=="1"){
                                table.reload('queryScreen');
                                layer.msg("操作成功");
                            }else{
                                layer.msg("操作失败");
                            }
                        }
                    });
                })
            } else if (layEvent === 'notapply') {
                layer.msg(data.id);
                layer.confirm('确定要执行这个操作吗?', function (index) {
                    $.ajax({
                        url:"updateScreenStateFile",
                        type:"post",
                        data:{id:data.id},
                        dataType:"json",
                        success:function (response) {
                            if(response.message=="1"){
                                table.reload('queryScreen');
                                layer.msg("操作成功");
                            }else{
                                layer.msg("操作失败");
                            }
                        }
                    });
                })
            }
        });


        //添加日期
        laydate.render({
            elem: '#screenTime',
            format: 'yyyy-MM-dd',
            min:0
        });
        //点击文本框弹出layer
        $("#ScreenuserName").click(function () {
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
        //修改的时候点击文本框弹出layer
        $("#updateScreenuserName").click(function () {
            jQueryajax("queryDept", null, "post", "json", function (data) {
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
                    jQueryajax("queryDeptUser", {deptids: b}, "post", "json", function (resp) {
                        var uname = "";
                        for (var i = 0; i < resp.length; i++) {
                            uname += "<input type='radio' name='uid' value='" + resp[i].id + "' lay-filter='updatefilter' title='" + resp[i].name + "'><span style='display: none'>" + resp[i].name + "</span><br/>";
                        }
                        $("#updateUserName").html(uname);
                        form.render();
                    });
                });
            });
        });

        //点击确定的时候获取用户名字和编号
        form.on('radio(filter)', function (data) {
            $("#saveUser").click(function () {
                $("#ScreenuserName").val(data.elem.title);
                $("#userId").val(data.value);
                layer.close(layer.index);
            });
        });
        //修改 点击确定的时候获取用户名字和编号
        form.on('radio(updatefilter)', function (data) {
            $("#updatesaveUser").click(function () {
                $("#updateScreenuserName").val(data.elem.title);
                $("#updateuserId").val(data.value);
                layer.close(layer.index);
            });
        });

        //获取人才库
        $("#talentsName").click(function () {
            jQueryajax("queryTalentsName", null, "post", "json", function (data) {
                var talentsName = "";
                for (var i = 0; i < data.length; i++) {
                    talentsName += "<div class='TalentName'><p style='display: none'>" + data[i].id + "</p><p>" + data[i].name + "</p></div>";
                }
                $("#TalentsNametoId").html(talentsName);
                form.render();
                layer.open({
                    type: 1,//类型
                    title: '请选择招聘计划',//标题
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#chooseTalentName') //打开的内容
                });
            });
        });
        //修改的时候获取人才库
        $("#updatetalentsName").click(function () {
            jQueryajax("queryTalentsName", null, "post", "json", function (data) {
                var talentsName = "";
                for (var i = 0; i < data.length; i++) {
                    talentsName += "<div class='updateTalentName'><p style='display: none'>" + data[i].id + "</p><p>" + data[i].name + "</p></div>";
                }
                $("#updateTalentsNametoId").html(talentsName);
                form.render();
                layer.open({
                    type: 1,//类型
                    title: '请选择招聘计划',//标题
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#updatechooseTalentName') //打开的内容
                });
            });
        });
        //选择计划名称
        $("body").on('click', '.TalentName', function () {
            var id = $(this).children().eq(0).html();
            var name = $(this).children().eq(1).html();
            jQueryajax("queryTalents",{id:id},"post","json",function (data) {
                $("#talentsName").val(name);
                $("#talentsId").val(id);
                $("#recruitPlanName").val(data[0].pname);
                $("#recruitPlanId").val(data[0].pid);
                $("#talentsWork").val(data[0].name2);
                $("#talentsDiction").val(data[0].name1);
                $("#talentsPhone").val(data[0].phone);
            });
            layer.close(layer.index);
        });
        //修改的时候选择计划名称
        $("body").on('click', '.updateTalentName', function () {
            var id = $(this).children().eq(0).html();
            var name = $(this).children().eq(1).html();
            jQueryajax("queryTalents",{id:id},"post","json",function (data) {
                $("#updatetalentsName").val(name);
                $("#updatetalentsId").val(id);
                $("#updaterecruitPlanName").val(data[0].pname);
                $("#updaterecruitPlanId").val(data[0].pid);
                $("#updatetalentsWork").val(data[0].name2);
                $("#updatetalentsDiction").val(data[0].name1);
                $("#updatetalentsPhone").val(data[0].phone);
            });
            layer.close(layer.index);
        });
        //添加招聘筛选
        form.on('submit(demo1)',function () {
            jQueryajax("saveScreen",$("#saveTalents").serialize(),"post","json",function (data) {
                if(data.message=="1"){
                    table.reload('queryScreen');
                    layer.close(saveLayer);
                    layer.msg("添加成功");
                }else{
                    table.reload('queryScreen');
                    layer.close(saveLayer);
                    layer.msg("添加失败");
                }
            });
            return false;
        });
        //修改招聘筛选
        form.on('submit(updatedemo1)',function () {
            jQueryajax("updateScreen",$("#updateTalents").serialize(),"post","json",function (data) {
                if(data.message=="1"){
                    table.reload('queryScreen');
                    layer.close(updateLayer);
                    layer.msg("修改成功");
                }else{
                    table.reload('queryScreen');
                    layer.close(updateLayer);
                    layer.msg("修改失败");
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
