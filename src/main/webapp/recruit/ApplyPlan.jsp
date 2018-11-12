<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-31
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招聘计划审批</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script type="text/html" id="barDemo">
    {{#  if(d.state=="未审核"){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">详细信息</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="apply">批准</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="notapply">不批准</a>
    {{#  } else if(d.state=="以批准"){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">详细信息</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="notapply">不批准</a>
    {{#  } else{ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">详细信息</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="apply">批准</a>
    {{#  }  }}
</script>
<!--查看详细信息-->
<form class="layui-form layui-form-pane" style="display:none;" id="ShowRecruitPlan" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">计划名称</label>
        <div class="layui-input-block">
            <input type="text" name="planName" id="planName" readonly="readonly" lay-verify="required"
                   placeholder="请输入计划名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发起人</label>
        <div class="layui-input-block">
            <input type="text" name="applyUserId" readonly="readonly" id="applyUserId" lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘渠道</label>
        <div class="layui-input-block">
            <input type="text" name="applyUserId" readonly="readonly" id="recruitTrench" lay-verify="required"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预算费用</label>
        <div class="layui-input-block">
            <input type="text" name="estimatedCost" readonly="readonly" id="estimatedCost" lay-verify="required"
                   placeholder="请输入预算费用" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">开始日期</label>
        <div class="layui-input-block">
            <input type="text" name="beginTime" readonly="readonly" id="beginTime" lay-verify="required"
                   placeholder="请选择开始日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">结束日期</label>
        <div class="layui-input-block">
            <input type="text" name="endTime" readonly="readonly" id="endTime" lay-verify="required"
                   placeholder="请选择结束日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘人数</label>
        <div class="layui-input-block">
            <input type="text" name="recruitNumber" readonly="readonly" id="recruitNumber" lay-verify="required"
                   placeholder="请输入招聘人数"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘说明</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入招聘说明" id="recruitState" readonly="readonly" name="recruitState"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">招聘备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入招聘备注" id="recruitRemak" readonly="readonly" name="recruitRemak"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">附件文档</label>
        <input type="text" name="recruitNumber" readonly="readonly" id="file" lay-verify="required"
               placeholder="请输入招聘人数"
               autocomplete="off"
               class="layui-input">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">审批人</label>
        <div class="layui-input-block">
            <input type="text" id="user" readonly="readonly" lay-verify="required" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">计划状态</label>
        <div class="layui-input-block">
            <input type="text" id="state" readonly="readonly" lay-verify="required" placeholder="请选择审批人"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-input-block">
        <button type="button" id="close" class="layui-btn layui-btn-primary">关闭</button>
    </div>
</form>
<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['layer', 'table'], function () {
        var layer = layui.layer;
        var table = layui.table;
        var $ = layui.$;
        //查询招聘计划   渲染表格并执行分页
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
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', align: 'center', title: '计划编号'},
                {field: 'name', align: 'center', title: '计划名称'},
                {field: 'number', align: 'time', title: '招聘人数'},
                {field: 'begintime', align: 'center', title: '开始日期'},
                {field: 'endtime', hide: 'true', align: 'center', title: '结束日期'},
                {field: 'state', align: 'center', title: '计划状态'},
                {field: 'trench', hide: 'true', align: 'center', title: '招聘渠道'},
                {field: 'cost', hide: 'true', align: 'center', title: '预算费用'},
                {field: 'rstate', hide: 'true', align: 'center', title: '招聘说明'},
                {field: 'remak', hide: 'true', align: 'center', title: '招聘备注'},
                {field: 'uname', hide: 'true', align: 'center', title: '审批人'},
                {field: 'uid', hide: 'true', align: 'center', title: '审批人编号'},
                {field: 'ApplyUname', hide: 'true', align: 'center', title: '发起人'},
                {field: 'Applyuid', hide: 'true', align: 'center', title: '发起人编号'},
                {field: 'access', hide: 'true', align: 'center', title: '文件'},
                {fixed: 'right', align: 'center', toolbar: '#barDemo'}
            ]],
            page: true//是否显示分页
        });


        //监听行工具条
        table.on('tool(demo)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'edit') { //查看
                $("#planName").val(data.name);
                $("#applyUserId").val(data.applyUname);
                $("#recruitTrench").val(data.trench);
                $("#estimatedCost").val(data.cost);
                $("#beginTime").val(data.begintime);
                $("#endTime").val(data.endtime);
                $("#recruitNumber").val(data.number);
                $("#recruitState").val(data.rstate);
                $("#recruitRemak").val(data.remak);
                $("#file").val(data.access);
                $("#user").val(data.uname);
                $("#state").val(data.state);
                layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#ShowRecruitPlan') //打开的内容
                });
                $("#close").click(function () {
                    layer.close(layer.index);
                });
            } else if (layEvent === 'apply') { //编辑
                layer.confirm('确定要执行这个操作吗?', function (index) {
                    $.ajax({
                        url: "ApplyPlan",
                        type: "post",
                        data: {id: data.id},
                        dataType: "json",
                        success: function (response) {
                            if (response.message == "1") {
                                table.reload('queryPlan', function () {
                                });
                                layer.msg("操作成功");
                            } else {
                                layer.msg("操作失败");
                            }
                        }
                    });
                })

            } else if (layEvent === 'notapply') {
                layer.confirm('确定要执行这个操作吗?', function (index) {
                    $.ajax({
                        url: "ApplyNotPlan",
                        type: "post",
                        data: {id: data.id},
                        dataType: "json",
                        success: function (response) {
                            if (response.message == "1") {
                                table.reload('queryPlan', function () {
                                });
                                layer.msg("操作成功");
                            } else {
                                layer.msg("操作失败");
                            }
                        }
                    });
                })
            }
        });
    });
</script>
</body>
</html>
