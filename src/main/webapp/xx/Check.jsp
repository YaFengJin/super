<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-30
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考勤</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
    <link rel="stylesheet" href="../static/bootstrap-3.3.7-dist/css/bootstrap.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<style>
    .file {
        position: relative;
        display: inline-block;
        background: #D0EEFF;
        border: 1px solid #99D3F5;
        border-radius: 4px;
        padding: 4px 12px;
        overflow: hidden;
        color: #1E88C7;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
    .file:hover {
        background: #AADFFD;
        border-color: #78C3F3;
        color: #004974;
        text-decoration: none;
    }
</style>
<body>
<%--统计--%>
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="请输入员工编号" autocomplete="off"
                   class="layui-input bianhao">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input begintime" id="test1" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input endtime"  id="test2" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">月份统计</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input yftj"  id="test3" placeholder="yyyy-MM">
            </div>
        </div>
        <button class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius tjkq">统计</button>
    </div>
<div class="layui-form-item">
</div>
    <div id="tongji" style="display: none;" class="layui-form" >
        <table class="layui-table">
            <colgroup>
                <col width="150"><col width="150"><col width="150">
                <col width="200"><col width="200"><col width="150">
                <col width="150"><col width="150"><col width="150">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>员工编号</th><th>员工姓名</th><th>总考勤</th>
                <th>开始时间</th><th>结束时间</th><th>正常/次</th>
                <th>缺勤/次</th><th>早退/次</th><th>请假/次</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="tj0"></td><td class="tj1"></td><td class="tj2"></td>
                <td class="tj3"></td><td class="tj4"></td><td class="tj5"></td>
                <td class="tj6"></td><td class="tj7"></td><td class="tj8"></td>
            </tr>
            </tbody>
        </table>
    </div>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
<div style="display: none" id="daorudiv">
    <form id="form"<%-- enctype="multipart/form-data"--%>>
        <a href="javascript:;" class="file"><i class="layui-icon"></i>上传文件
            <input type="file" name="file1" class="daoru1" id="daoru1" >
        </a>
    </form>
</div>
</body>
<script>
    layui.use(['form', 'table', 'laydate', 'layer'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            table = layui.table,
            $ = layui.jquery;

        $(function () {
            if ("${id}" != 1){
                $(".bianhao").val("${id}");
                $(".bianhao").attr("disabled","disabled");
            }
        })

        var index1 ="";
        laydate.render({
            elem: '#test1',
            type: 'date'
        });
        laydate.render({
            elem: '#test2',
            type: 'date'
        });
        laydate.render({
            elem: '#test3',
            type: 'month'
        });
        //监听头工具栏事件
        table.on('toolbar(bianshan)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    index1 = layer.open({
                        type: 1,//类型
                        area: ['auto', 'auto'],//定义宽和高
                        title: '导入考勤',//题目
                        shadeClose: true,//点击遮罩层关闭
                        content: $("#daorudiv"),//打开的内容
                        /*content: 'index.jsp'//打开的内容 type为2*/
                    });
                    break;
            };
        });
        $(".tjkq").click(function () {
            if($(".yftj").val()!=null&&$(".yftj").val()!=""){
                alert("1");
                fall(${id},$(".yftj").val());
            }else {
                alert("2");
                if ($(".bianhao").val() == "") {
                    layer.msg('请输入员工编号');
                } else {
                    $.ajax({
                        url: "gotime1",
                        type: "post",
                        data: {
                            "userId": $(".bianhao").val(),
                            "begin": $(".begintime").val(),
                            "end": $(".endtime").val(),
                        },
                        dataType: "json",
                        success: function (all) {
                            if (all.list.length > 0) {
                                $(".tj0").html(all.list[0].userId);
                                $(".tj1").html(all.list[0].checkName);
                                $(".tj2").html(all.zong);
                                $(".tj3").html($(".begintime").val());
                                $(".tj4").html($(".endtime").val());
                                $(".tj5").html(all.zhengchang);
                                $(".tj6").html(all.queqin);
                                $(".tj7").html(all.zaotui);
                                $(".tj8").html(all.qingjia);
                                layer.open({
                                    type: 1,//类型
                                    area: ['70%', '20%'],//定义宽和高
                                    title: '编辑',//题目
                                    shadeClose: true,//点击遮罩层关闭
                                    content: $('#tongji') //打开的内容
                                    /*/!*content: 'index.jsp'*///打开的内容 type为2*!/
                                });
                            } else {
                                layer.msg('输入的员工编号不正确或此人没有考勤数据');
                            }

                        }
                    })
                }
            }

        });
        //导入
        $("#daoru1").change(function () {
            var f = new FormData(document.getElementById("form"));
            $.ajax({
                url:"getAllByExcel",
                type:"post",
                data:f,
                /*/!***必须false才会自动加上正确的Content-Type*!/*/
                contentType: false,
                /*/!** 必须false才会避开jQuery对 formdata 的默认处理 XMLHttpRequest会对 formdata 进行正确的处理*!/*/
                processData: false,
                dataType:"json",
                success:function (all) {
                    layer.msg(all.message);
                    layer.close(index1);
                    fall(${id});
                    fall(${id});
                }
            })
        });
        fall(${id});
        fall(${id});
    })
    //查询数据的分页
    function fall(kwx,month) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where: {"sid": kwx,
                    "month":month
            },
            url: 'xxChecksurfaceSelect',
            id: 'weiyi',
            limits: [1, 3, 7, 10, 50, 100,10000000],
            limit: 10,  //默认为10
            title: '班次表',
            //加载表格内容
            cols: [[//标题栏
                {field: 'userId', width: 150, title: '员工编号', sort: true},  //sort：true页面可进行排序操作
                {field: 'checkName', width: 200, title: '员工姓名'},
                {field: 'checkTime', width: 200, title: '考勤时间', sort: true},
                {field: 'goTimeOneText', width: 200, title: '第一次签到', sort: true},
                {field: 'downTimeOneText', width: 200, title: '第一次签退', sort: true},
                {field: 'goTimeTwoText', width: 200, title: '第二次签到', sort: true},
                {field: 'downTimeTwoText', width: 200, title: '第二次签退', sort: true},
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
            },
        })
    }

</script>
</html>
