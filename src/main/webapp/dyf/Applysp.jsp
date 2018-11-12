<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品审批</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div class="layui-card-body" id="aaa" style="display: none">
    <span id="UserName"></span>的<span id="wj_name"></span>申领&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申领日期:<span id="apply_date"></span>
    <table class="layui-hide" id="test1" lay-filter="tab"></table>
    <center>
    <button class="layui-btn layui-btn-lg layui-btn-normal" id="sptg">批准</button>
    <button class="layui-btn layui-btn-lg layui-btn-danger" id="spbtg">不批准</button>
    <button class="layui-btn layui-btn-lg layui-btn-normal" id="ghtg">归还通过</button>
    <button class="layui-btn layui-btn-lg layui-btn-danger" id="ghbtg">归还不通过</button>
    </center>
</div>

<div style="display: none" id="spyj">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                    <input type="tel"id="apply_id" hidden>
                    <textarea class="layui-textarea" lay-verify="required" id="sply" name="spyj" placeholder="请输入不给予通过审核的理由！"></textarea>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button" class="layui-btn" lay-submit lay-filter="saveApply" value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div style="display: none" id="ghyj">
    <form class="layui-form" id="form1">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                    <input type="tel"id="apply_id1" hidden>
                    <input type="tel"id="work_id1" hidden>
                    <textarea class="layui-textarea" lay-verify="required" id="sply1" name="spyj" placeholder="请输入不给予通过审核的理由！"></textarea>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button" class="layui-btn" lay-submit lay-filter="upApplyGHBTG" value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

</body>

</html>

<script type="text/html" id="barDemo">
    {{#  if(d.apply_state == 0 || d.apply_state==4){ }}
    <button class="layui-btn layui-btn-normal" lay-Event="queryApplyid">审批</button>
    {{#  } }}
    {{#  if(d.apply_state == 1){ }}
    <button class="layui-btn layui-btn-normal" lay-Event="ff">发放</button>
    {{#  } }}
</script>

<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.use(['table','layer','form'], function(){
        var layer= layui.layer,
            form = layui.form;
        var kw='';
        addData(kw);

        form.on('submit(saveApply)', function(data){
            var spyj=$("#sply").val();
            var apply_id=$("#apply_id").val();
            layer.confirm('你确定提交意见吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "/updateApplyState1",
                    type: "post",
                    data: {
                        "spyj":spyj,
                        "apply_id": apply_id
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        layer.closeAll();
                        location.reload();
                    }
                });
            });
        });

        form.on('submit(upApplyGHBTG)', function(data){
            var spyj=$("#sply1").val();
            var apply_id=$("#apply_id1").val();
            layer.confirm('你确定提交意见吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "/ApplyGHBTG",
                    type: "post",
                    data: {
                        "apply_id": apply_id,
                        "spyj":spyj
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        layer.closeAll();
                        location.reload();
                    }
                });
            });
        });

    });
    function addData(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/showApply1'
            ,cols: [[
                {field:'apply_id', width:200, title: '编号',sort:true,hide:true}
                ,{field:'b_bankname', width:200, title: '办公用品库'}
                ,{field:'work_id'}
                ,{field:'apply_state'}
                ,{field:'work_name', width:200, title: '办公用品名称'}
                ,{field:'wj_name', width:200, title: '登记类型'}
                ,{field:'UserName', width:200, title: '申请人'}
                ,{field:'apply_number', width:200, title: '数量'}
                ,{field:'apply_date', width:200, title: '申请日期'}
                ,{fixed: 'right', width: 267,align:'center', toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
                //数据的回调用，可不写
                $("[data-field='work_id']").css('display','none');
                $("[data-field='apply_state']").css('display','none');
                $("#UserName").html(data.UserName);
            }
        });

        table.on('tool(tab)',function (obj) {
            var data = obj.data,LayEvent=obj.event;
            if (LayEvent ==='queryApplyid'){
                var apply_id = data.apply_id;
                if (data.apply_state==4){
                    $("#sptg").css('display','none');
                    $("#spbtg").css('display','none');
                    $("#ghtg").css('display','block');
                    $("#ghbtg").css('display','block');
                }else{
                    $("#sptg").css('display','block');
                    $("#spbtg").css('display','block');
                    $("#ghtg").css('display','none');
                    $("#ghbtg").css('display','none');
                }
                layer.open({
                    type:1,//类型
                    title:'审批',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#aaa') //打开的内容
                });
                table.render({
                    elem: '#test1'
                    ,url:'/queryApplyid?apply_id='+apply_id
                    ,cols: [[
                         {field:'apply_id', width:115, title: '编号',sort:true}
                        ,{field:'work_id'}
                        ,{field:'b_bankname', width:150, title: '办公用品库'}
                        ,{field:'work_name', width:150, title: '办公用品名称'}
                        ,{field:'wj_name', width:150, title: '登记类型'}
                        ,{field:'UserName', width:150, title: '申请人'}
                        ,{field:'apply_number', width:120, title: '数量'}
                        ,{field:'apply_date', width:150, title: '申请日期'}
                    ]]
                    ,done:function(res, curr, count){
                        //数据的回调用，可不写
                        $("[data-field='work_id']").css('display','none');
                        $("[data-field='apply_state']").children().each(function () {
                            if ($(this).text()=="0"){
                                $(this).text("待审批");
                            }
                        })
                        $("[data-field='UserName']").children().each(function () {
                            $("#UserName").html($(this).text());
                        })
                        $("[data-field='wj_name']").children().each(function () {
                            $("#wj_name").html($(this).text());
                        })
                        $("[data-field='apply_date']").children().each(function () {
                            $("#apply_date").html($(this).text());
                        })

                    }

                });

            };
            if (LayEvent ==='ff'){
                var apply_id = data.apply_id;
                var apply_number = data.apply_number;
                var work_id = data.work_id;
                layer.confirm('你确定发放办公物品吗？', {
                    btn: ['确定','取消'] //按钮
                },function () {
                    $.ajax({
                        url: "/Applyff",
                        type: "post",
                        data: {
                            "apply_id": apply_id,
                            "work_id": work_id,
                            "apply_number": apply_number
                        },
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            location.reload();
                        }
                    });
                })
            }

        });

    }

    $("#sptg").click(function() {
        var apply_id = $(this).parent().parent().find("table").find("tbody").find("div").html();
        layer.confirm('你确定通过这个申请吗？', {
            btn: ['确定','取消'] //按钮
        },function () {
            $.ajax({
                url: "/updateApplyState",
                type: "post",
                data: {
                    "apply_id": apply_id
                },
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
        });
    });

    $("#spbtg").click(function() {
        var apply_id = $(this).parent().parent().find("table").find("tbody").find("div").html();
        $("#apply_id").val(apply_id);
            layer.open({
                type: 1
                ,closeBtn: true
                ,area:['50%','50%']//定义宽和高
                ,shade: 0.8
                ,btnAlign: 'c'
                ,content: $('#spyj')
            });
    });

    $("#ghbtg").click(function() {
        var apply_id = $(this).parent().parent().find("table").find("tbody").find("div").eq(0).html();
        var work_id = $(this).parent().parent().find("table").find("tbody").find("div").eq(1).html();
        $("#apply_id1").val(apply_id);
        $("#work_id1").val(work_id);
        layer.open({
            type: 1
            ,closeBtn: true
            ,area:['50%','50%']//定义宽和高
            ,shade: 0.8
            ,btnAlign: 'c'
            ,content: $('#ghyj')
        });
    });

    $("#ghtg").click(function() {
        var apply_id = $(this).parent().parent().find("table").find("tbody").find("div").eq(0).html();
        var work_id = $(this).parent().parent().find("table").find("tbody").find("div").eq(1).html();
        var apply_number = $(this).parent().parent().find("table").find("tbody").find("div").eq(6).html();
        layer.confirm('你确定通过这个申请吗？', {
            btn: ['确定','取消'] //按钮
        },function () {
            $.ajax({
                url: "/ApplyGHTG",
                type: "post",
                data: {
                    "apply_id": apply_id,
                    "work_id": work_id,
                    "apply_number": apply_number

                },
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
        });
    });

</script>