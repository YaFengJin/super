<%--请假审核
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-28
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假审核</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<body>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
<div id="motaikunag1" style="display:none;">
    <table class="layui-table">
        <tr>
            <td>请填写拒绝理由:</td>
            <td><input type="text" id="text"></td>
        </tr>
        <tr style="text-align:center">
            <td colspan="2">
                <input type="button" value="确定" id="button">
            </td>
        </tr>
    </table>
</div>

</body>
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
    {{#  if(d.LeaveState == '未批准'){ }}
    <a class="layui-btn layui-btn-xs" lay-event="pz">批准</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="bpz">不批准</a>
    {{#  } else if(d.LeaveState == '已销假'){ }}
    <a class="layui-btn layui-btn-xs qiyong" lay-event="ckxj">详情</a>
    {{#  } else if(d.LeaveState == '已审核'){ }}
    {{#  } else if(d.LeaveState == '请求销假'){ }}
    <a class="layui-btn layui-btn-xs qiyong" lay-event="dxj">代销假</a>
    {{#  } else if(d.LeaveState == '不批准'){ }}
    <a class="layui-btn layui-btn-xs qiyong" lay-event="dxj">详情</a>
    {{#  } }}
</script>
<script>
    layui.use(['form', 'table', 'laydate', 'layer'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            $ = layui.jquery;
        fall(${id});
    })
    //查询数据的分页
    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where: {"leaveForId": kwx},
            url: 'xxLeaveForSelect',
            id: 'weiyi',
            limits: [1, 3, 7, 10, 50, 100],
            limit: 10,  //默认为10
            title: '班次表',
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', width: 80, fixed: 'left'},
                {field: 'LeaveState', width: 100, title: '类型'},  //sort：true页面可进行排序操作
                {field: 'useid', width: 100, title: '申请人'},
                {field: 'BeginTime', width: 180, title: '开始日期', sort: true},
                {field: 'OverTime', width: 180, title: '结束日期', sort: true},
                {field: 'LeaveNumber', width: 180, title: '时长(天)', sort: true},
                {field: 'ForCause', width: 180, title: '缘由', sort: true},
                {fixed: 'right', width: 200, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
                $("[data-field='LeaveState']").children().each(function () {
                    if ($(this).text() == "未批准") {
                        $(this).text("请假申请");
                    } if ($(this).text() == "已审核") {
                        $(this).text("代销假");
                    }
                })
            },
        })
        //监听行工具事件
        table.on('tool(bianshan)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'pz') {
                    $.ajax({
                        url: "xxLezveForUpdate",
                        type: "post",
                        data: {
                            "leaveForId": data.Leave_ForId,
                            "name": $(this).html()
                        },
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            table.reload(['weiyi'], function () {
                            })
                        }
                    })
            }else if (layEvent === 'bpz') {
                layer.open({
                    type: 1,//类型
                    area: ['40%', '70%'],//定义宽和高
                    title: '意见',//题目
                    shadeClose: false,//点击遮罩层关闭
                    content: $('#motaikunag') //打开的内容
                });
                /*$.ajax({
                    url: "xxLezveForUpdate",
                    type: "post",
                    data: {
                        "leaveForId": data.Leave_ForId,
                        "name": $(this).html()
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        table.reload(['weiyi'], function () {
                        })
                    }
                })*/
            }else if (layEvent === 'dxj') {
                $.ajax({
                    url: "xxLezveForUpdate",
                    type: "post",
                    data: {
                        "leaveForId": data.Leave_ForId,
                        "name": $(this).html()
                    },
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        table.reload(['weiyi'], function () {
                        })
                    }
                })
            }
        })

    }
</script>
</html>
