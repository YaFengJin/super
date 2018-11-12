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
    <title>申领记录</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="upApply" style="display:none;">
    <form class="layui-form" id="form">

        <input type="tel" name="apply_id" id="apply_id" style="display: none;">
        
        <div class="layui-form-item">
            <label class="layui-form-label">登记类型</label>
            <div class="layui-input-block" style="width: 400px">
                <select name="wj_id" id="wj_id">

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">办公用品库</label>
            <div class="layui-input-block" style="width: 400px">
                <select name="b_id" id="b_id" lay-filter="aaa">

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">办公用品类</label>
            <div class="layui-input-block" style="width: 400px">
                <select name="sort_id" id="sort_id">

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">办公用品</label>
            <div class="layui-input-block" style="width: 400px">
                <input type="tel" style="display: none" name="work_id" id="work_id" readonly autocomplete="off" class="layui-input">
                <input type="tel" name="work_name" id="work_name" readonly autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block" style="width: 400px">
                <input type="tel" name="apply_price" readonly id="apply_price" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block" style="width: 400px">
                <input type="button" id="jian" class="layui-btn" value="-">
                <input type="text" name="apply_number" id="apply_number" readonly>
                <input type="button" id="jia" class="layui-btn" value="+">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">申请时间</label>
            <div class="layui-input-block" style="width: 400px">
                <input type="date" name="apply_date" id="apply_date">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">申请人</label>
            <div class="layui-input-block" style="width: 400px">
                <input type="tel" name="UserId" id="UserId" readonly>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block" style="width: 400px">
                <textarea placeholder="请输入内容" class="layui-textarea" name="apply_comment" id="apply_comment"></textarea>
                <input type="tel" name="apply_state" id="apply_state" style="display: none" value="0" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="width: 400px">
                <input type="button" class="layui-btn" id="updateApply" value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

</body>

</html>

<script type="text/html" id="barDemo">
    {{#  if(d.apply_state == 0){ }}
    <button class="layui-btn layui-btn-danger" lay-Event="del">删除</button>
    <button class="layui-btn layui-btn-normal" lay-Event="upd">修改</button>
    {{#  } }}
    {{#  if(d.apply_state == 1){ }}

    {{#  } }}
    {{#  if(d.apply_state == 2){ }}
    <button class="layui-btn layui-btn-danger" lay-Event="del">删除</button>
    {{#  } }}
    {{#  if(d.apply_state == 3){ }}
    <button class="layui-btn layui-btn-normal" lay-Event="gh">归还</button>
    {{#  } }}
    {{#  if(d.apply_state == 4){ }}

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
    });
    function addData(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/showApply'
            ,limit:3 //默认为10
            ,page: true
            ,cols: [[
                 {field:'apply_id', width:160, title: '编号',sort:true}
                ,{field:'work_name', width:200, title: '办公用品'}
                ,{field:'work_id'}
                ,{field:'wj_name', width:200, title: '登记类型'}
                ,{field:'apply_number', width:158, title: '数量'}
                ,{field:'apply_date', width:200, title: '申请时间'}
                ,{field:'name', width:200, title: '部门审批人'}
                ,{field:'apply_comment', width:200, title: '备注'}
                ,{field:'apply_state', width:200, title: '状态'}
                ,{field:'spyj', width:200, title: '备注'}
                ,{fixed: 'right', width: 150,align:'center', toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
                //数据的回调用，可不写
                $("[data-field='work_id']").css('display','none');
                $("[data-field='apply_state']").children().each(function () {
                    if ($(this).text()=="0"){
                        $(this).text("待审批");
                    }else if($(this).text()=="1"){
                        $(this).text("审批通过 待发放");
                    }
                    else if($(this).text()=="2"){
                        $(this).text("审批未通过");
                    }
                    else if($(this).text()=="3"){
                        $(this).text("已发放 待归还");
                    }
                    else if($(this).text()=="4"){
                        $(this).text("归还申请中 待审批");
                    }
                    else if($(this).text()=="5"){
                        $(this).text("归还申请未通过");
                    }
                    else if($(this).text()=="6"){
                        $(this).text("归还申请通过 已归还");
                    }
                })
            }
        });

        table.on('tool(tab)',function (obj) {
            var data = obj.data,LayEvent=obj.event;
            if (LayEvent ==='del'){
                var apply_id = data.apply_id;
                layer.confirm('你确定删除数据吗？', {
                    btn: ['确定','取消'] //按钮
                },function () {
                    $.ajax({
                        url:"/deleteApply",
                        type:"post",
                        data:{
                            "apply_id":apply_id
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
                var apply_id = data.apply_id;
                layer.open({
                    type:1,//类型
                    title:'修改申领信息',
                    area:['40%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#upApply') //打开的内容
                });
                layui.use(['form','util'], function() {
                    var form = layui.form;
                    $.ajax({
                        url: "/queryApplyup",
                        type: "post",
                        data: {
                            "apply_id": apply_id
                        },
                        dataType: "json",
                        success: function (data) {
                            var a = data.list1[0];
                            var b = data.list2;
                            var c = data.list3;
                            $("#apply_id").val(a.apply_id);
                            $("#work_id").val(a.work_id);
                            $("#apply_price").val(a.apply_price);
                            $("#apply_number").val(a.apply_number);
                            $("#work_name").val(a.work_name + "/库存" +a.work_repertory);
                            $("#apply_date").val(a.apply_date);
                            $("#UserId").val(a.UserName);
                            $("#apply_comment").val(a.apply_comment);

                            for (var i = 0; i < c.length; i++) {
                                $("#sort_id").append("<option value='" + a.sort_id + "' selected='selected'>" + a.sort_style + "</option>");
                                if (a.wj_id == c[i].wj_id) {
                                    $("#wj_id").append("<option value='" + a.wj_id + "' selected='selected'>" + a.wj_name + "</option>");
                                } else {
                                    $("#wj_id").append("<option value='" + c[i].wj_id + "'>" + c[i].wj_name + "</option>");
                                }
                                form.render('select');
                            }

                            for (var i = 0; i < b.length; i++) {
                                if (a.b_id == b[i].b_id) {
                                    $("#b_id").append("<option value='" + a.b_id + "' selected='selected'>" + a.b_bankname + "</option>");
                                } else {
                                    $("#b_id").append("<option value='" + b[i].b_id + "'>" + b[i].b_bankname + "</option>");
                                }
                                form.render('select');
                            }


                        }
                    });

                    form.on('select(aaa)', function (data) {
                        var b_id = data.value;
                        $(function () {
                            $("#sort_id").html("");
                            $.ajax({
                                url: "/querysortjin",
                                type: "post",
                                data: {
                                    "b_id": b_id
                                },
                                dataType: "json",
                                success: function (data) {
                                    var a = data.list;
                                    for (var i = 0; i < a.length; i++) {
                                        $("#sort_id").append("<option value='" + a[i].sort_id + "'>" + a[i].sort_style + "</option>");
                                    }
                                    form.render('select');
                                }
                            });
                        });
                    });

                });

            };
            if (LayEvent ==='gh'){
                var apply_id = data.apply_id;
                layer.confirm('你确定归还物品吗？', {
                    btn: ['确定','取消'] //按钮
                },function () {
                    $.ajax({
                        url: "/ApplyGHSQ",
                        type: "post",
                        data: {
                            "apply_id": apply_id,
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

    $("#updateApply").click(function() {
        $.ajax({
            url:"/updateApply",
            type:"post",
            data:$("#form").serialize(),
            dataType:"json",
            success:function(data){
                alert(data.message);
                layer.closeAll();
                location.reload();
            }
        });
    });

    $("#jian").click(function() {
        if ($("#apply_number").val()>1){
            $("#apply_number").val(parseInt($("#apply_number").val())-1);
        }else {
            alert("数量不可以小于1！");
        }
    });

    $("#jia").click(function() {
        var work_id = $("#work_id").val();
        $.ajax({
            url:"/queryworksurface",
            type:"post",
            data:{
                "work_id":work_id
            },
            dataType:"json",
            success:function(data){
                var a = data.list[0];
                if ($("#apply_number").val()<a.work_repertory){
                    $("#apply_number").val(parseInt($("#apply_number").val())+1);
                }else{
                    alert("数量不可以大于所选物品的当前库存！")
                }
            }
        });

    });

</script>