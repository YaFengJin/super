<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/24
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<center>
    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal savesort">新建办公用品类</button>
    </div>
</center>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="savesort" style="display: none">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <label class="layui-form-label">库名称:*</label>
            <div class="layui-input-block">
                <input type="text" id="b_id" lay-verify="required" autocomplete="off" style="width: 250px" readonly="readonly" class="layui-input">
                <input type="hidden" id="bid" name="b_id" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">序号:*</label>
            <div class="layui-input-block">
                <input type="text" name="sort_number" lay-verify="required" style="width: 250px" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">类名称:*</label>
            <div class="layui-input-block">
                <input type="text" name="sort_style" lay-verify="required" style="width: 250px" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button" class="layui-btn" lay-submit lay-filter="save" value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div id="updatesort" style="display: none">
    <form class="layui-form" id="form1">
        <div class="layui-form-item">
            <label class="layui-form-label">类编号:</label>
            <div class="layui-input-block">
                <input type="text" id="sort_id1" name="sort_id" lay-verify="required" autocomplete="off" style="width: 250px" readonly="readonly" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">序号</label>
            <div class="layui-input-block">
                <input type="text" id="sort_number1" name="sort_number" lay-verify="required" style="width: 250px" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">类名称:</label>
            <div class="layui-input-block">
                <input type="text" id="sort_style1" name="sort_style" lay-verify="required" style="width: 250px" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" id="update" lay-submit="" lay-filter="updatesort">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-danger" lay-Event="del">删除</button>
    <button class="layui-btn layui-btn-normal" lay-Event="upd">修改</button>
</script>

</body>
</html>
<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.use(['layer','layedit'],function () {
        var layer = layui.layer,
            $=layui.jquery;
        $(".savesort").click(function(){
            var b_id=${param.b_id};
            layer.open({
                type:1,//类型
                title:'增加办公用品类',
                area:['60%','80%'],//定义宽和高
                shadeClose:false,//点击遮罩层关闭
                content: $('#savesort') //打开的内容
            });
            $.ajax({
                url:"/querybankname",
                type:"post",
                data:{
                    "b_id":b_id
                },
                dataType:"json",
                success:function(data){
                    var a = data.list[0];
                    $("#b_id").val(a.b_bankname);
                    $("#bid").val(a.b_id);
                }
            });
        });
    });


    layui.use(['table','layer','form','layedit','laydate'], function(){
        var layer= layui.layer
            ,form = layui.form
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        var kw='';
        addData(kw);

        form.on('submit(save)', function(data){
            //发送ajax
            $.ajax({
                url:"/savesort",
                type:"post",
                data:$("#form").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        form.on('submit(updatesort)', function(data){
            //发送ajax
            $.ajax({
                url:"/updatesort",
                type:"post",
                data:$("#form1").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    });
    function addData(){
        var table = layui.table;
        var b_id=${param.b_id};
        table.render({
            elem: '#test'
            ,url:'/querysort?b_id='+b_id
            ,cols: [[
                 {field:'sort_id', width:165, title: '办公用品类编号', sort: true} //sort：true页面可进行排序操作
                ,{field:'sort_number', width:165, title: '办公用品类序号'}
                ,{field:'sort_style', width:165, title: '办公用品类名称'}
                ,{fixed: 'right', width: 165,align:'center', toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
             //数据的回调用，可不写
            }
        });

        table.on('tool(tab)',function (obj) {
            var data = obj.data,LayEvent=obj.event;
            if (LayEvent ==='del'){
                var sort_id = data.sort_id;
                layer.confirm('你确定删除数据吗？', {
                    btn: ['确定','取消'] //按钮
                },function () {
                    $.ajax({
                        url:"/deletesort",
                        type:"post",
                        data:{
                            "sort_id":sort_id
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
                var sort_id = data.sort_id;
                layer.open({
                    type:1,//类型
                    title:'修改办公用品类',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#updatesort') //打开的内容
                });
                $.ajax({
                    url:"/querysort1",
                    type:"post",
                    data:{
                        "sort_id":sort_id
                    },
                    dataType:"json",
                    success:function(data){
                        var a = data.list[0];
                        $("#sort_id1").val(a.sort_id);
                        $("#sort_number1").val(a.sort_number);
                        $("#sort_style1").val(a.sort_style);
                    }
                });
            };
        });

    }
</script>