<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-19
  Time: 16:02
  To change this template use File | Settings | File Templates.
  班次表
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<body>
<%--模糊搜索--%>
<div style="margin-top: 17px;margin-left: 100px;">
    <span>班次搜索：</span>
    <input type="text" style="height: 27px;width: 220px;" id="chaxun" placeholder="请输入班次进行模糊查询"/>
</div>

<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>

<%--添加模态框--%>
<div id="motaikunag"  style="display: none;">
<form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">班次说明</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="schedulingName" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第一次签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME1" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第一次最晚签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE1" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-inline">
            <label class="layui-form-label">第一次签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME2" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第一次最早签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE2" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-inline">
            <label class="layui-form-label">第二次签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME3" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第二次最晚签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE3" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-inline">
            <label class="layui-form-label">第二次签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME4" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第二次最早签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE4" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="" id="id" value="1" style="display: none;">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
</form>
</div>
<%--编辑模态框--%>
<div id="motaikunag1"  style="display: none;">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">班次说明</label>
            <div class="layui-input-block">
                <input type="text" name="username" id="schedulingName1" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第一次签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME11" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第一次最晚签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE11" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-inline">
            <label class="layui-form-label">第一次签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME21" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第一次最早签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE21" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-inline">
            <label class="layui-form-label">第二次签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME31" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第二次最晚签到时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE31" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-inline">
            <label class="layui-form-label">第二次签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="DUTY_TIME41" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">第二次最早签退时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="TIME_LATE41" lay-verify="date" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div><br/>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="" id="schedulingManagId" value="" style="display:none ;">
                <input type="text" name="" id="id1" value="2" style="display: none;">
                <button class="layui-btn" lay-submit="" lay-filter="demo2">保存</button>
            </div>
        </div>
    </form>
</div>
</body>
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>

    layui.use(['form','table','laydate','layer'], function () {
        var form = layui.form,
        laydate = layui.laydate,
            layer = layui.layer,
        $=layui.jquery;
        //日期
        for(i=1;i<5;i++){
            laydate.render({
                elem: '#DUTY_TIME'+i,
                type: 'time'
            });
            laydate.render({
                elem: '#TIME_LATE'+i,
                type: 'time'
            });
            laydate.render({
                elem: '#DUTY_TIME'+i+'1',
                type: 'time'
            });
            laydate.render({
                elem: '#TIME_LATE'+i+'1',
                type: 'time'
            });
        }
        //自定义时间验证规则
        form.verify({
            date:[/^(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,'错误']
        });
        //异步提交添加
        form.on('submit(demo1)',function () {
            $.ajax({
                url:'xxinsert',
                type:"post",
                data:{
                    "schedulingName":$('#schedulingName').val(),
                    "dutyTime1":$('#DUTY_TIME1').val(),
                    "dutyTime2":$('#DUTY_TIME2').val(),
                    "dutyTime3":$('#DUTY_TIME3').val(),
                    "dutyTime4":$('#DUTY_TIME4').val(),
                    "timeLate1":$('#TIME_LATE1').val(),
                    "timeLate2":$('#TIME_LATE2').val(),
                    "timeLate3":$('#TIME_LATE3').val(),
                    "timeLate4":$('#TIME_LATE4').val(),
                    "id":$('#id').val()
                },
                dateType:"json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            })
            return false;
        })
        //异步班次更改
        form.on('submit(demo2)',function () {
            $.ajax({
                url:'xxinsert',
                type:"post",
                data:{
                    "schedulingManagId":$('#schedulingManagId').val(),
                    "schedulingName":$('#schedulingName1').val(),
                    "dutyTime1":$('#DUTY_TIME11').val(),
                    "dutyTime2":$('#DUTY_TIME21').val(),
                    "dutyTime3":$('#DUTY_TIME31').val(),
                    "dutyTime4":$('#DUTY_TIME41').val(),
                    "timeLate1":$('#TIME_LATE11').val(),
                    "timeLate2":$('#TIME_LATE21').val(),
                    "timeLate3":$('#TIME_LATE31').val(),
                    "timeLate4":$('#TIME_LATE41').val(),
                    "id":$('#id1').val()
                },
                dateType:"json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            })
            return false;
        })
        var a = "";
        fall(a);
    });
    //查询数据的分页
    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where:{"schedulingName":kwx},
            url: 'select',
            limits:[1,3,7,10,50,100],
            limit: 10,  //默认为10
            title: '班次表',
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', width:80, fixed: 'left'},
                {field: 'SchedulingManagId', width: 100, title: '班次编号'},  //sort：true页面可进行排序操作
                {field: 'SchedulingName', width: 100, title: '班次说明'},
                {field: 'DUTYTIME1', width: 180, title: '第一次签到时间', sort: true},
                {field: 'DUTYTIME2', width: 180, title: '第一次签退时间',sort: true},
                {field: 'TIMELATE1', width: 200, title: '第一次最晚签到时间',sort: true},
                {field: 'TIMELATE2', width: 200, title: '第一次最早签退时间', sort: true},
                {field: 'DUTYTIME3', width: 180, title: '第二次签到时间', sort: true},
                {field: 'DUTYTIME4', width: 180, title: '第二吃签退时间',sort: true},
                {field: 'TIMELATE3', width: 200, title: '第二次最晚签到时间', sort: true},
                {field: 'TIMELATE4', width: 200, title: '第二次最早签退时间', sort: true},
                {fixed: 'right', width: 130, align:'center', toolbar: '#barDemo'}
            ]],
             page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
            }
        });
        //监听头工具栏事件
        table.on('toolbar(bianshan)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layui.use(['layer'],function () {
                        var layer = layui.layer,$=layui.$;
                        layer.open({
                            type:1,//类型
                            area:['40%','60%'],//定义宽和高
                            title:'添加',//题目
                            shadeClose:false,//点击遮罩层关闭
                            content: $('#motaikunag') //打开的内容
                            /*content: 'index.jsp'//打开的内容 type为2*/
                        });
                    })
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].SchedulingManagId);
                    }
                    break;
                case 'delete':
                    if(data.length > 0){
                        layer.msg('删除');
                    }
                    break;
            };
        });
        //监听行工具事件
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url:"xxdelete",
                        type:"post",
                        data:{
                            "schedulingManagId":data.SchedulingManagId
                        },
                        dataType:"json",
                        success:function(data){
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);//向服务端发送删除指令
                        }
                    })
                });
            } else if(layEvent === 'edit'){
                $('#schedulingManagId').val(data.SchedulingManagId);
                $('#schedulingName1').val(data.SchedulingName);
                    $('#DUTY_TIME11').val(data.DUTYTIME1);
                    $('#DUTY_TIME21').val(data.DUTYTIME2);
                    $('#DUTY_TIME31').val(data.DUTYTIME3);
                    $('#DUTY_TIME41').val(data.DUTYTIME4);
                    $('#TIME_LATE11').val(data.TIMELATE1);
                    $('#TIME_LATE11').val(data.TIMELATE1);
                    $('#TIME_LATE21').val(data.TIMELATE2);
                    $('#TIME_LATE31').val(data.TIMELATE3);
                    $('#TIME_LATE41').val(data.TIMELATE4);
                            layer.open({
                                type:1,//类型
                                area:['40%','60%'],//定义宽和高
                                title:'编辑',//题目
                                shadeClose:false,//点击遮罩层关闭
                                content: $('#motaikunag1') //打开的内容
                                /*content: 'index.jsp'//打开的内容 type为2*/
                        })
            }
        });
    }
    //模糊查询的时间
    $(document).ready(function(){
        $("#chaxun").on("keyup",function(cha){
            if (cha.keyCode==13){
                var keyWord=$("#chaxun").val();
                fall(keyWord);
            }
        });
        $("#chaxun").on("blur",function(cha){
                var keyWord=$("#chaxun").val();
                fall(keyWord);
        });
    });
</script>
</html>
