<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-28
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<style>
    #bxtable input {
        text-align: right;
    }
</style>
<body>
<button class="layui-btn layui-btn-primary dingyi">薪酬项目定义</button>
<button class="layui-btn layui-btn-primary baoxian">保险系数设置</button>
<script>
    $(".dingyi").click(function () {
        $("#xinchouxiangmu").css("display","block");
        $("#baoxianxishu").css("display","none");
    })
    $(".baoxian").click(function () {
        $("#xinchouxiangmu").css("display","none");
        $("#baoxianxishu").css("display","block");
    })
</script>
<%--保险系数设置--%>
<div id="baoxianxishu" class="layui-form" style="margin-left: 30%;display: none; width: 30%;">
    <form id="form">
    <input type="text" name="compantPersonagId" value="" class="CompantPersonagId" style="display: none;">
    <table id="bxtable" class="layui-table">
        <thead><tr><th class="">养老保险系数： </th></tr></thead>
        <tr><td>个人支付：<input type="text" name="yanglaogr" class="bxtable0" value=""> %</td></tr>
        <tr><td>单位支付：<input type="text" name="yanglaodw" class="bxtable1" value=""> %</td></tr>
        <thead><tr><th class="">医疗保险系数：</th></tr></thead>
        <tr><td>个人支付：<input type="text" name="yiliaogr" class="bxtable2" value=""> %</td></tr>
        <tr><td>单位支付：<input type="text" name="yiliaodw" class="bxtable3" value=""> %</td></tr>
        <thead><tr><th class="">失业保险系数：</th></tr></thead>
        <tr><td>个人支付：<input type="text" name="shiyege" class="bxtable4" value=""> %</td></tr>
        <tr><td>单位支付：<input type="text" name="shiyedw" class="bxtable5" value=""> %</td></tr>
        <thead><tr><th class="">住房公积金系数：</th></tr></thead>
        <tr><td>个人支付：<input type="text" name="zhufangge" class="bxtable6" value=""> %</td></tr>
        <tr><td>单位支付：<input type="text" name="zhufangdw" class="bxtable7" value=""> %</td></tr>
        <thead><tr><th class="">工伤保险系数：</th></tr></thead>
        <tr><td>单位支付：<input type="text" name="gongshangdw" class="bxtable8" value=""> %</td></tr>
        <thead><tr><th class="">生育保险系数：</th></tr></thead>
        <tr><td>单位支付：<input type="text" name="shengyudw" class="bxtable9" value=""> %</td></tr>
        <tr><td><button class="layui-btn layui-btn-normal bxtj" value="">提交</button></td></tr>
    </table>
    </form>
</div>
<%--添加 薪酬项目定义--%>
<div id="xinchouxiangmu" >
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>添加薪酬项目</legend>
</fieldset>
    <div style="margin-left: 30%;">
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">项目编号</label>
        <div class="layui-input-block" style="width: 15%;">
            <input type="text" name="title" lay-verify="required"  autocomplete="off" placeholder="请输入"
                   class="layui-input xmbh">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">薪酬项目名称</label>
        <div class="layui-input-block" style="width: 15%;">
            <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                   class="layui-input xcxmmc">
        </div>
    </div>
    <%--下拉框--%>
    <div class="layui-form-item">
        <label class="layui-form-label">项目类型</label>
        <div class="layui-input-block" style="width: 15%;">
            <select name="modules" id="tjxmlx" class="xmlx" lay-search="">
                <%--<option value="">搜索</option>--%>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn tj" lay-submit="" value="1" lay-filter="demo1">添加</button>
        </div>
    </div>
</form>
    </div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>已定义薪酬项目</legend>
</fieldset>
    <div style="margin-left: 30%;">
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
</div>
<%--编辑--%>
<div id="bianji" style="display: none;">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">薪酬项目名称</label>
            <div class="layui-input-block" style="width: 50%;">
                <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input bianjixcxmmc">
            </div>
        </div>
        <%--下拉框--%>
        <div class="layui-form-item">
            <label class="layui-form-label">项目类型</label>
            <div class="layui-input-block" style="width: 50%;">
                <select name="modules" id="bjxmlx" class="xmlx" lay-search="">
                    <%--<option value="">搜索</option>--%>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn bianjibc" lay-submit="" value="2" lay-filter="demo1">保存</button>
            </div>
        </div>
    </form>
</div>
</div>
</body>
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-xs" value="1" lay-event="pz">批准</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
   <%-- {{#  if(d.length == 3){ }}--%>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
   <%-- {{#  } }}--%>
</script>
<script>
    layui.use(['form', 'table', 'laydate', 'layer'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            $ = layui.jquery,
            table=layui.table;

        //异步提交添加
        form.on('submit(demo1)',function () {
            var projectTypeId = "";
            var projectName ="";
            if($(this).val()==1){
                projectTypeId = $("#tjxmlx").val();
                projectName = $(".xcxmmc").val();
            }else if($(this).val()==2){
                projectTypeId = $("#bjxmlx").val();
                projectName = $(".bianjixcxmmc").val();
            }
            $.ajax({
                url:"xxWageprojectInsert",
                type:"post",
                data:{
                    "projectTypeId":projectTypeId,
                    "projectName":projectName,
                    "projectId":$(".xmbh").val(),
                    "wid":$(this).val(),//获取编辑保存按钮的val
                    "id": $(".bianjibc").attr("id")//获取编辑时的id
                },
                dataType:"json",
                success:function(all){
                    alert(all.message);
                    layer.close(layer.index);
                    table.reload(['weiyi'], function () {
                    })
                }
            })
            return false;
        })
        $(".bxtj").click(function () {
            $.ajax({
                url:"xxCompantpersonageUpdate",
                type:"post",
                data:$("#form").serialize(),
                dataType:"json",
                success:function (all) {
                    alert(all.message);
                    baoxianjishu();
                }
            })
            return false;
        })
        baoxianjishu();
        cxxcxmdy();
        fall();
    })
    function cxxcxmdy() {
        var form = layui.form
        //查询薪酬项目定义类型
        $.ajax({
            url:"xxProjecttypeSelect",
            data:"",
            type:"post",
            dataType:"json",
            success:function (all) {
                var option = "";
                for (i=0;i<all.list.length;i++){
                    var obj = all.list;
                    option += "<option value='"+obj[i].ProjectTypeId+"'>"+obj[i].ProjectTypeName+"</option>";
                }
                $(".xmlx").html(option);
                form.render();
            }
        })
    }
    //查询数据的分页
    function fall(kwx) {
        var table = layui.table, //表格
        form = layui.form
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            /*where: {"schedulingName": kwx},*/
            url: 'xxWageprojectSelect',
            id: 'weiyi',
            width:'600',
            limits: [1, 3, 7, 10, 50, 100],
            limit: 10,  //默认为10
            title: '已定义薪酬项目',
            //加载表格内容
            cols: [[//标题栏
                {field: 'WageProjectId', width: 100, title: '编号'},  //sort：true页面可进行排序操作
                {field: 'ProjectName', width: 100, title: '名称'},
                {field: 'ProjectId', width: 100, title: '名称编号', sort: true},
                {field: 'ProjectTypeName', width: 130, title: '项目类型', sort: true},
                {fixed: 'right', width: 160, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示分页
            /*toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档*/
            done: function (res, curr, count) {
                //数据的回调用，可不写
            },

        })
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit') {
                $(".bianjixcxmmc").val(data.ProjectName);
                $(".xmlx option[value ='"+data.ProjectTypeId+"']").attr("selected","selected");
                form.render();
                $(".bianjibc").attr("id",data.WageProjectId);
                layer.open({
                    type: 1,//类型
                    area: ['20%', '40%'],//定义宽和高
                    title: '编辑',//题目
                    shadeClose: true,//点击遮罩层关闭
                    content: $('#bianji') //打开的内容
                    /*content: 'index.jsp'//打开的内容 type为2*/
                });
            }else if(layEvent === 'del') {

                layer.confirm('真的提交', function (index) {
                    $.ajax({
                        url: "xxWageprojectDelete",
                        type: "post",
                        data: {
                            "wageProjectId":data.WageProjectId
                        },
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);//向服务端发送删除指令
                        }
                    })
                })
            }
        })
    }
    function baoxianjishu(){
    $.ajax({
        url: "xxCompantpersonageSelect",
        type: "post",
        data: {},
        dataType: "json",
        success: function (data){
            var a = [];
            a[0] = data.list[0].a0;a[1] = data.list[0].a1;
            a[2] = data.list[0].a2;a[3] = data.list[0].a3;
            a[4] = data.list[0].a4;a[5] = data.list[0].a5;
            a[6] = data.list[0].a6;a[7] = data.list[0].a7;
            a[8] = data.list[0].a8;a[9] = data.list[0].a9;
            for (i=0;i<10;i++){
                $(".bxtable"+i).val(a[i]);
            }
            $(".CompantPersonagId").val(data.list[0].CompantPersonagId);
        }
    })
    }
</script>
</html>
