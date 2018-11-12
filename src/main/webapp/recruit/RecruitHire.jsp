<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-11-01
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招聘录用</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<form class="layui-form" id="saveHire" style="display: none">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="talentsName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="talentsId" hidden id="talentsId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text" id="recruitPlanName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="recruitPlanId">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">招聘岗位</label>
            <div class="layui-input-inline">
                <input type="text" id="dictionariesName" lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
                <input type="text" name="dictionariesId" hidden id="dictionariesId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">oa中用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="oaName" id="oaName" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">录用负责人</label>
            <div class="layui-input-inline">
                <input type="text" id="userIdName" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="userId" hidden id="userId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">录入日期</label>
            <div class="layui-input-inline">
                <input type="text" name="hireTime" id="hireTime" placeholder="yyyy-MM-dd" lay-verify="required|date"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">招聘部门</label>
            <div class="layui-input-inline">
                <input type="text" id="deptName" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="deptId" hidden id="deptId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">员工类型</label>
            <div class="layui-input-inline">
                <select id="empTypeName" name="empTypeName">

                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">职务</label>
            <div class="layui-input-inline">
                <input type="text" name="duty" id="duty" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">行政等级</label>
            <div class="layui-input-inline">
                <input type="text" name="adminClass" id="adminClass" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">正式入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="officialEntryTime" placeholder="yyyy-MM-dd" id="officialEntryTime"
                           lay-verify="required|date" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">正式起薪时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="officialWorkTime" id="officialWorkTime" lay-verify="required|date"
                           autocomplete="off" placeholder="yyyy-MM-dd"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-block">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="recruitHireRemark" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="Hiredemo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<!--修改招聘录用-->
<form class="layui-form" id="updateHire" style="display: none">
    <input type="text" id="updatehireid" hidden name="recruitHireId">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="updatetalentsName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="talentsId" hidden id="updatetalentsId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text" id="updaterecruitPlanName" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="updaterecruitPlanId">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">招聘岗位</label>
            <div class="layui-input-inline">
                <input type="text" id="updatedictionariesName" lay-verify="required"
                       autocomplete="off" class="layui-input" readonly="readonly">
                <input type="text" name="dictionariesId" hidden id="updatedictionariesId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">oa中用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="oaName" id="updateoaName" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">录用负责人</label>
            <div class="layui-input-inline">
                <input type="text" id="updateuserIdName" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="userId" hidden id="updateuserId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">录入日期</label>
            <div class="layui-input-inline">
                <input type="text" name="hireTime" id="updatehireTime" placeholder="yyyy-MM-dd" lay-verify="required|date"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">招聘部门</label>
            <div class="layui-input-inline">
                <input type="text" id="updatedeptName" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="deptId" hidden id="updatedeptId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">员工类型</label>
            <div class="layui-input-inline">
                <select id="updateempTypeName" name="empTypeName">

                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">职务</label>
            <div class="layui-input-inline">
                <input type="text" name="duty" id="updateduty" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">行政等级</label>
            <div class="layui-input-inline">
                <input type="text" name="adminClass" id="updateadminClass" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">正式入职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="officialEntryTime" placeholder="yyyy-MM-dd" id="updateofficialEntryTime"
                           lay-verify="required|date" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">正式起薪时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="officialWorkTime" id="updateofficialWorkTime" lay-verify="required|date"
                           autocomplete="off" placeholder="yyyy-MM-dd"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-block">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="recruitHireRemark" id="updateremark" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="updatedemo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
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
<!--选择录用负责人-->
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

<!--选择录用部门-->
<form class="layui-form" id="DepttreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="DeptLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="DeptUserName">

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


<!--获取人才库-->
<form class="layui-form" id="updatechooseTalentName" style="display: none">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <div id="updateTalentsNametoId"></div>
        </div>
    </div>
</form>
<!--选择录用负责人-->
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
            <button class="layui-btn" type="button" id="updateUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>

<!--选择录用部门-->
<form class="layui-form" id="updateDepttreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="updateDeptLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="updateDeptUserName">

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
<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'layer', 'laydate', 'table', 'authtree'], function () {
        var $ = layui.$,
            form = layui.form,
            table = layui.table,
            laydate = layui.laydate,
            layer = layui.layer,
            authtree = layui.authtree;
       var savelayer="";
       var updatelayer="";
       var showlayer="";
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
        //添加日期
        laydate.render({
            elem: '#hireTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //添加日期
        laydate.render({
            elem: '#officialEntryTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //添加日期
        laydate.render({
            elem: '#officialWorkTime',
            format: 'yyyy-MM-dd',
            min: 0
        });

        //添加update日期
        laydate.render({
            elem: '#updatehireTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //添加update日期
        laydate.render({
            elem: '#updateofficialEntryTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //添加update日期
        laydate.render({
            elem: '#updateofficialWorkTime',
            format: 'yyyy-MM-dd',
            min: 0
        });
        //页面加载的时候查询员工类型
        jQueryajax("queryEmpType", null, "post", "json", function (data) {
            var empType = "";
            for (var i = 0; i < data.length; i++) {
                empType += "<option value='" + data[i].id + "'>" + data[i].name + "</option>";
            }
            $("#empTypeName").html(empType);
            form.render();
            $("#updateempTypeName").html(empType);
            form.render();
        })
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
        //点击确定的时候获取用户名字和编号
        form.on('radio(filter)', function (data) {
            $("#saveUser").click(function () {
                $("#ScreenuserName").val(data.elem.title);
                $("#userId").val(data.value);
                layer.close(layer.index);
            });
        });
        //选择计划名称
        $("body").on('click', '.TalentName', function () {
            var id = $(this).children().eq(0).html();
            var name = $(this).children().eq(1).html();
            jQueryajax("queryTalents", {id: id}, "post", "json", function (data) {
                $("#talentsName").val(name);
                $("#talentsId").val(id);
                $("#recruitPlanName").val(data[0].pname);
                $("#recruitPlanId").val(data[0].pid);
                $("#dictionariesName").val(data[0].name2);
                $("#dictionariesId").val(data[0].id2);
            });
            layer.close(layer.index);
        });
        //点击文本框弹出layer
        $("#userIdName").click(function () {
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
                $("#userIdName").val(data.elem.title);
                $("#userId").val(data.value);
                layer.close(layer.index);
            });
        });

        //查询部门
        $("#deptName").click(function () {
            jQueryajax("queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#DeptLAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'Deptlay-check-auth',
                });
                layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#DepttreeView') //打开的内容
                });
                authtree.on('change(Deptlay-check-auth)', function () {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#DeptLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#DeptLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    //查询用户
                    jQueryajax("queryDeptOne", {deptids: b}, "post", "json", function (resp) {
                        var uname = "";
                        for (var i = 0; i < resp.length; i++) {
                            uname += "<input type='radio' name='deptid' value='" + resp[i].id + "' lay-filter='Deptfilter' title='" + resp[i].name + "'><span style='display: none'>" + resp[i].name + "</span><br/>";
                        }
                        $("#DeptUserName").html(uname);
                        form.render();
                    });
                });
            });
        });
        //点击确定的时候把部门的值赋给文本框
        form.on('radio(Deptfilter)', function (data) {
            $("#saveDept").click(function () {
                $("#deptName").val(data.elem.title);
                $("#deptId").val(data.value);
                layer.close(layer.index);
            });
        });









        //获取人才库
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
        //点击确定的时候获取用户名字和编号
        form.on('radio(updatefilter)', function (data) {
            $("#updateUser").click(function () {
                $("#updateScreenuserName").val(data.elem.title);
                $("#updateuserId").val(data.value);
                layer.close(layer.index);
            });
        });
        //选择计划名称
        $("body").on('click', '.updateTalentName', function () {
            var id = $(this).children().eq(0).html();
            var name = $(this).children().eq(1).html();
            jQueryajax("queryTalents", {id: id}, "post", "json", function (data) {
                $("#updatetalentsName").val(name);
                $("#updatetalentsId").val(id);
                $("#updaterecruitPlanName").val(data[0].pname);
                $("#updaterecruitPlanId").val(data[0].pid);
                $("#updatedictionariesName").val(data[0].name2);
                $("#updatedictionariesId").val(data[0].id2);
            });
            layer.close(layer.index);
        });
        //点击文本框弹出layer
        $("#updateuserIdName").click(function () {
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
        form.on('radio(updatefilter)', function (data) {
            $("#updateUser").click(function () {
                $("#updateuserIdName").val(data.elem.title);
                $("#updateuserId").val(data.value);
                layer.close(layer.index);
            });
        });

        //查询部门
        $("#updatedeptName").click(function () {
            jQueryajax("queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#updateDeptLAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'updateDeptlay-check-auth',
                });
                layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#updateDepttreeView') //打开的内容
                });
                authtree.on('change(updateDeptlay-check-auth)', function () {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#updateDeptLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#updateDeptLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    //查询用户
                    jQueryajax("queryDeptOne", {deptids: b}, "post", "json", function (resp) {
                        var uname = "";
                        for (var i = 0; i < resp.length; i++) {
                            uname += "<input type='radio' name='deptid' value='" + resp[i].id + "' lay-filter='updateDeptfilter' title='" + resp[i].name + "'><span style='display: none'>" + resp[i].name + "</span><br/>";
                        }
                        $("#updateDeptUserName").html(uname);
                        form.render();
                    });
                });
            });
        });
        //点击确定的时候把部门的值赋给文本框
        form.on('radio(updateDeptfilter)', function (data) {
            $("#updateDept").click(function () {
                $("#updatedeptName").val(data.elem.title);
                $("#updatedeptId").val(data.value);
                layer.close(layer.index);
            });
        });
        //新增招聘录用
        form.on('submit(Hiredemo1)', function () {
            jQueryajax("saveRecruitHire", $("#saveHire").serialize(), "post", "json", function (data) {
                if (data.message == "1") {
                    table.reload('queryHire');
                    layer.close(savelayer);
                    layer.msg("添加成功");
                } else {
                    table.reload('queryHire');
                    layer.close(savelayer);
                    layer.msg("添加失败");
                }
            });
        });

        //分页查询s
        table.render({
            elem: '#demo',
            url: 'queryRecruitHire',
            limits: [5, 10, 15, 20],
            limit: 5,
            id: "queryHire",
            title: '角色',
            toolbar: 'default',
            defaultToolbar: [''],
            where: {},
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', align: 'center', title: '录用编号'},
                {field: 'tid', hide: 'true', align: 'center', title: '人才库编号'},
                {field: 'tname', align: 'center', title: '应聘者姓名'},
                {field: 'pid', hide: 'true', align: 'center', title: '计划编号'},
                {field: 'pname', hide: 'true', align: 'center', title: '计划名称'},
                {field: 'did', hide: 'true', align: 'center', title: '应聘岗位编号'},
                {field: 'dname', align: 'center', title: '应聘岗位名称'},
                {field: 'deptid', hide: 'true', align: 'center', title: '部门编号'},
                {field: 'deptname', align: 'center', title: '部门名称'},
                {field: 'uid', hide: 'true', align: 'center', title: '录用负责人编号'},
                {field: 'uname', align: 'center', title: '录用负责人姓名'},
                {field: 'oaname', hide: 'true', align: 'center', title: 'oa用户名'},
                {field: 'hireTime', hide: 'true', align: 'center', title: '录入时间'},
                {field: 'typeid', hide: 'true', align: 'center', title: '员工类型编号'},
                {field: 'typename', hide: 'true', align: 'center', title: '员工类型名称'},
                {field: 'adminClass', hide: 'true', align: 'center', title: '行政等级'},
                {field: 'duty', hide: 'true', align: 'center', title: '职务'},
                {field: 'begintime', hide: 'true', align: 'center', title: '正式入职时间'},
                {field: 'endtime', hide: 'true', align: 'center', title: '正式起薪时间'},
                {field: 'remark', hide: 'true', align: 'center', title: '备注'},
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
                    savelayer=layer.open({
                        type: 1,//类型
                        title: '添加招聘录用',//标题
                        shadeClose: false,//点击遮罩层关闭
                        offset: 't',
                        content: $('#saveHire') //打开的内容
                    });
                    break;
                case 'update':
                    $("#updatehireid").val(data[0].id);
                    $("#updatetalentsName").val(data[0].tname);
                    $("#updatetalentsId").val(data[0].tid);
                    $("#updaterecruitPlanName").val(data[0].pname);
                    $("#updaterecruitPlanId").val(data[0].pid);
                    $("#updatedictionariesName").val(data[0].dname);
                    $("#updatedictionariesId").val(data[0].did);
                    $("#updateoaName").val(data[0].oaname);
                    $("#updateuserIdName").val(data[0].uname);
                    $("#updateuserId").val(data[0].uid);
                    $("#updatehireTime").val(data[0].hireTime);
                    $("#updatedeptName").val(data[0].deptname);
                    $("#updatedeptId").val(data[0].deptid);
                    $("#updateempTypeName option[value='" + data[0].typeid + "']").attr("selected", "selected");
                    $("#updateduty").val(data[0].duty);
                    $("#updateadminClass").val(data[0].adminClass);
                    $("#updateofficialEntryTime").val(data[0].begintime);
                    $("#updateofficialWorkTime").val(data[0].endtime);
                    $("#updateremark").val(data[0].remark);
                    updatelayer=layer.open({
                        type: 1,//类型
                        title: '修改招聘录用',//标题
                        shadeClose: false,//点击遮罩层关闭
                        offset: 't',
                        content: $('#updateHire') //打开的内容
                    });
                    break;
            };
        });
        
        form.on('submit(updatedemo1)',function () {
            jQueryajax("updateRecruitHire",$("#updateHire").serialize(),"post","json",function (data) {
                if (data.message == "1") {
                    table.reload('queryHire');
                    layer.close(updatelayer);
                    layer.msg("修改成功");
                } else {
                    table.reload('queryHire');
                    layer.close(updatelayer);
                    layer.msg("修改失败");
                }
            })
        })
    });
</script>
</body>
</html>
