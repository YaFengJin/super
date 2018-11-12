<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-11-01
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人才库</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="demo"></table>


<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看详细信息</a>
</script>
<form class="layui-form" id="saveTalents" style="display: none">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text" id="PlanName" lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="PlanId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsName" id="talentsName" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <select name="talentsGender">
                    <option value="男" selected>男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsBrithday" id="talentsBrithday" lay-verify="date|required"
                       placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsPhone" id="talentsPhone" lay-verify="required|phone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电子邮件</label>
            <div class="layui-input-inline">
                <input type="tel" name="talentsEmali" id="talentsEmali" lay-verify="email|required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">期望工作性质</label>
            <div class="layui-input-inline">
                <select name="expectWork">
                    <option value="全职">全职</option>
                    <option value="兼职">兼职</option>
                    <option value="临时">临时</option>
                    <option value="实习">实习</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">期望薪水</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" id="expectWage" lay-verify="required|number" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">期望岗位</label>
            <div class="layui-input-inline">
                <select name="dictionariesId" id="dictionariesId">

                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">所学专业</label>
            <div class="layui-input-inline">
                <select name="dicDictionariesId" id="dicDictionariesId">

                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">学历</label>
            <div class="layui-input-inline">
                <select name="dicDictionariesId2" id="dicDictionariesId2">

                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工作经验</label>
            <div class="layui-input-inline">
                <select name="WorkExper" id="WorkExper">
                    <option value="无">无</option>
                    <option value="一年">一年</option>
                    <option value="两年">两年</option>
                    <option value="三年">三年</option>
                    <option value="五年">五年</option>
                    <option value="五年及以上">五年及以上</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-block">
            <label class="layui-form-label">简历</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="talentsResume" class="layui-textarea"></textarea>
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
<!--获取计划名称-->
<form class="layui-form" id="choosePlanName" style="display: none">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <div id="PlanNameto"></div>
        </div>
    </div>
</form>
<!--查看详细信息-->
<form class="layui-form" id="showTalents" style="display: none">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text" id="showPlanName" readonly="readonly" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsName" id="showtalentsName" readonly="readonly" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="text" id="showtalentsGender" readonly="readonly" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsBrithday" readonly="readonly" id="showtalentsBrithday"
                       placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsPhone" readonly="readonly" id="showtalentsPhone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电子邮件</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsEmali" readonly="readonly" id="showtalentsEmali" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">期望工作性质</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsEmali" readonly="readonly" id="showexpectWork" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">期望薪水</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" readonly="readonly" id="showexpectWage"
                       lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">期望岗位</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" readonly="readonly" id="showdictionariesId"
                       lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">所学专业</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" readonly="readonly" id="showdicDictionariesId"
                       lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">学历</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" readonly="readonly" id="showdicDictionariesId2"
                       lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工作经验</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" readonly="readonly" id="showWorkExper" lay-verify="required|number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-block">
            <label class="layui-form-label">简历</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" id="showTalentsResume" name="talentsResume"
                          class="layui-textarea"></textarea>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-block">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="closeshow">关闭</button>
            </div>
        </div>
    </div>
</form>

<!--修改人才库信息-->
<form class="layui-form" id="updateTalents" style="display: none">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">计划名称</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsId" hidden id="updatetalentsId">
                <input type="text" id="updatePlanName" lay-verify="required" autocomplete="off" class="layui-input">
                <input type="text" name="recruitPlanId" hidden id="updatePlanId">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">应聘者姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsName" id="updatetalentsName" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <select name="talentsGender">
                    <option value="男" selected>男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsBrithday" id="updatetalentsBrithday" lay-verify="date|required"
                       placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="text" name="talentsPhone" id="updatetalentsPhone" lay-verify="required|phone"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电子邮件</label>
            <div class="layui-input-inline">
                <input type="tel" name="talentsEmali" id="updatetalentsEmali" lay-verify="email|required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">期望工作性质</label>
            <div class="layui-input-inline">
                <select name="expectWork">
                    <option value="全职">全职</option>
                    <option value="兼职">兼职</option>
                    <option value="临时">临时</option>
                    <option value="实习">实习</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">期望薪水</label>
            <div class="layui-input-inline">
                <input type="text" name="expectWage" id="updateexpectWage" lay-verify="required|number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">期望岗位</label>
            <div class="layui-input-inline">
                <select name="dictionariesId" id="updatedictionariesId">

                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">所学专业</label>
            <div class="layui-input-inline">
                <select name="dicDictionariesId" id="updatedicDictionariesId">

                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">学历</label>
            <div class="layui-input-inline">
                <select name="dicDictionariesId2" id="updatedicDictionariesId2">

                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工作经验</label>
            <div class="layui-input-inline">
                <select name="workExper" id="updateWorkExper">
                    <option value="无">无</option>
                    <option value="一年">一年</option>
                    <option value="两年">两年</option>
                    <option value="三年">三年</option>
                    <option value="五年">五年</option>
                    <option value="五年及以上">五年及以上</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-block">
            <label class="layui-form-label">简历</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" id="updateTalentsResume" name="talentsResume"
                          class="layui-textarea"></textarea>
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

<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layer', 'laydate', 'table'], function () {
        var $ = layui.$;
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var table = layui.table;

        //添加日期
        laydate.render({
            elem: '#talentsBrithday',
            format: 'yyyy-MM-dd'
        });
        //修改日期
        laydate.render({
            elem: '#updatetalentsBrithday',
            format: 'yyyy-MM-dd'
        });

        //数据分页
        table.render({
            elem: '#demo',
            url: 'queryTalents',
            limits: [5, 10, 15, 20],
            limit: 5,
            id: "queryTalents",
            title: '角色',
            toolbar: 'default',
            defaultToolbar: [''],
            where: {},
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', align: 'center', title: '编号'},
                {field: 'pid', hide: 'true', align: 'center', title: '计划编号'},
                {field: 'pname', align: 'time', title: '计划名称'},
                {field: 'name', align: 'center', title: '应聘者姓名'},
                {field: 'gender', align: 'center', title: '性别'},
                {field: 'birthday', align: 'center', title: '出生日期'},
                {field: 'phone', align: 'center', title: '联系电话'},
                {field: 'email', hide: 'true', align: 'center', title: '电子邮件'},
                {field: 'wage', hide: 'true', align: 'center', title: '期望薪水'},
                {field: 'work', hide: 'true', align: 'center', title: '期望工作性质'},
                {field: 'exper', hide: 'true', align: 'center', title: '工作经验'},
                {field: 'resume', hide: 'true', align: 'center', title: '简历'},
                {field: 'id1', hide: 'true', align: 'center', title: '所学专业编号'},
                {field: 'name1', align: 'center', title: '所学专业'},
                {field: 'id2', hide: 'true', align: 'center', title: '期望岗位编号'},
                {field: 'name2', align: 'center', title: '期望岗位'},
                {field: 'id3', hide: 'true', align: 'center', title: '学历编号'},
                {field: 'name3', align: 'center', title: '学历'},
                {fixed: 'right', align: 'center', toolbar: '#barDemo'}
            ]],
            page: true//是否显示分页
        });
        var save = "";
        var update = "";
        //头部工具栏
        table.on('toolbar(demo)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据;
            switch (obj.event) {
                case 'add':
                    save = layer.open({
                        type: 1,//类型
                        title: '添加人才库',//标题
                        area: ["80%", "80%"],
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#saveTalents') //打开的内容
                    });
                    break;
                case 'delete':
                    layer.confirm('真的删除行么', function () {
                        jQueryajax("deleteTalents", {id: data[0].id}, "post", "json", function (response) {
                            if (response.message == "1") {
                                layer.msg("删除成功");
                                table.reload('queryTalents');
                            } else {
                                layer.msg("删除失败");
                                table.reload('queryTalents');
                            }
                        });
                    });
                    break;
                case 'update':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    }else {
                        $("#updatetalentsId").val(data[0].id);
                        $("#updatePlanName").val(data[0].pname);
                        $("#updatePlanId").val(data[0].pid);
                        $("#updatetalentsName").val(data[0].name);
                        $("#updatetalentsBrithday").val(data[0].birthday);
                        $("#updatetalentsGender").val(data[0].gender);
                        $("#updatetalentsPhone").val(data[0].phone);
                        $("#updatetalentsEmali").val(data[0].email);
                        $("#updateexpectWage").val(data[0].wage);
                        $("#updateexpectWork").val(data[0].work);
                        $("#updateWorkExper").val(data[0].exper);
                        $("#updateTalentsResume").val(data[0].resume);
                        $("#updatedicDictionariesId2").val(data[0].name3);
                        $("#updatedicDictionariesId").val(data[0].name2);
                        $("#updatedictionariesId").val(data[0].name1);
                        $("#updatedicDictionariesId2 option[value='" + data[0].id3 + "']").attr("selected", "selected");
                        $("#updatedicDictionariesId option[value='" + data[0].id2 + "']").attr("selected", "selected");
                        $("#updatedictionariesId option[value='" + data[0].id1 + "']").attr("selected", "selected");
                        form.render();
                        update = layer.open({
                            type: 1,//类型
                            title: '添加人才库',//标题
                            area: ["80%", "80%"],
                            shadeClose: false,//点击遮罩层关闭
                            content: $('#updateTalents') //打开的内容
                        });
                    }
                    break;
            }
            ;
        });

        //监听行工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event;
            if (layEvent === 'detail') { //查看
                $("#showPlanName").val(data.pname);
                $("#showtalentsName").val(data.name);
                $("#showtalentsBrithday").val(data.birthday);
                $("#showtalentsGender").val(data.gender);
                $("#showtalentsPhone").val(data.phone);
                $("#showtalentsEmali").val(data.email);
                $("#showexpectWage").val(data.wage);
                $("#showexpectWork").val(data.work);
                $("#showWorkExper").val(data.exper);
                $("#showTalentsResume").val(data.resume);
                $("#showdicDictionariesId2").val(data.name3);
                $("#showdicDictionariesId").val(data.name2);
                $("#showdictionariesId").val(data.name1);
                var a = layer.open({
                    type: 1,//类型
                    title: '添加人才库',//标题
                    area: ["80%", "80%"],
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#showTalents') //打开的内容
                });
                $("#closeshow").click(function () {
                    layer.close(a);
                })
            }
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
        //查询基础数据字典
        jQueryajax("queryDictionariesName", null, "post", "json", function (data) {
            var name1 = "";//学历
            var name2 = "";//期望岗位
            var name3 = "";//所学专业
            for (var i = 0; i < data.Name1.length; i++) {
                name1 += "<option value='" + data.Name1[i].id + "'>" + data.Name1[i].name + "</option>";
            }
            for (var i = 0; i < data.Name2.length; i++) {
                name2 += "<option value='" + data.Name2[i].id + "'>" + data.Name2[i].name + "</option>";
            }
            for (var i = 0; i < data.Name3.length; i++) {
                name3 += "<option value='" + data.Name3[i].id + "'>" + data.Name3[i].name + "</option>";
            }
            $("#dicDictionariesId2").html(name1);
            $("#dictionariesId").html(name2);
            $("#dicDictionariesId").html(name3);
            $("#updatedicDictionariesId2").html(name1);
            $("#updatedictionariesId").html(name2);
            $("#updatedicDictionariesId").html(name3);
            form.render();
        });
        //查询计划名称
        $("#PlanName").click(function () {
            jQueryajax("queryPlanName", null, "post", "json", function (data) {
                var planName = "";
                for (var i = 0; i < data.length; i++) {
                    planName += "<div class='planName'><p style='display: none'>" + data[i].id + "</p><p>" + data[i].name + "</p></div>";
                }
                $("#PlanNameto").html(planName);
                form.render();
                layer.open({
                    type: 1,//类型
                    title: '请选择招聘计划',//标题
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#choosePlanName') //打开的内容
                });
            });
        });
        //选择计划名称
        $("body").on('click', '.planName', function () {
            var id = $(this).children().eq(0).html();
            var name = $(this).children().eq(1).html();
            $("#PlanName").val(name);
            $("#PlanId").val(id);
            layer.close(layer.index);
        });
        //查询计划名称
        $("#updatePlanName").click(function () {
            jQueryajax("queryPlanName", null, "post", "json", function (data) {
                var planName = "";
                for (var i = 0; i < data.length; i++) {
                    planName += "<div class='updateplanName'><p style='display: none'>" + data[i].id + "</p><p>" + data[i].name + "</p></div>";
                }
                $("#PlanNameto").html(planName);
                form.render();
                layer.open({
                    type: 1,//类型
                    title: '请选择招聘计划',//标题
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#choosePlanName') //打开的内容
                });
            });
        });
        //选择计划名称
        $("body").on('click', '.updateplanName', function () {
            var id = $(this).children().eq(0).html();
            var name = $(this).children().eq(1).html();
            $("#updatePlanName").val(name);
            $("#updatePlanId").val(id);
            layer.close(layer.index);
        });

        //添加人才库
        form.on('submit(demo1)', function () {
            jQueryajax("saveTalents", $("#saveTalents").serialize(), "post", "json", function (data) {
                if (data.message == "1") {
                    table.reload('queryTalents');
                    layer.close(save);
                    layer.msg("添加成功");
                } else {
                    table.reload('queryTalents');
                    layer.close(save);
                    layer.msg("添加失败");
                }
            });
        });
        //修改人才库
        form.on('submit(updatedemo1)', function () {
            jQueryajax("updateTalents", $("#updateTalents").serialize(), "post", "json", function (data) {
                if (data.message == "1") {
                    table.reload('queryTalents');
                    layer.close(update);
                    layer.msg("修改成功");
                } else {
                    table.reload('queryTalents');
                    layer.close(update);
                    layer.msg("修改失败");
                }
            })
        })
    });
</script>
</body>
</html>
