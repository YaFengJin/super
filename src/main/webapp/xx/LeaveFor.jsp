<%-- 请假
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-27
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假申请</title>
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
<div id="motaikunag"  style="display: none;">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">设置人员</label>
            <div class="layui-input-block">
                <input type="text" name="title" value="${name}"  readonly="readonly" autocomplete="off" placeholder="人员"
                       class="layui-input ry">
                <input type="text" class="tjry" value="${id}" hidden>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请假原因：</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input qjyy">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始日期</label>
            <div class="layui-input-inline">
                <input type="text" name="datetime" id="date" lay-verify="datetime" placeholder="yyyy-MM-dd HH:mm:ss"
                       autocomplete="off" class="layui-input kssj">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束日期</label>
            <div class="layui-input-inline">
                <input type="text" name="datetime" id="date1" lay-verify="datetime" placeholder="yyyy-MM-dd HH:mm:ss"
                       autocomplete="off" class="layui-input jssj">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请假时长：</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input qjsc">
            </div>
        </div>
        <%--下拉框--%>
        <div class="layui-form-item">
            <label class="layui-form-label">请假类型</label>
            <div class="layui-input-block" style="width: 35%;">
                <select name="interest" class="qjlx" lay-filter="aihao" >
                    <option value="事假">事假</option>
                    <option value="病假">病假</option>
                    <option value="其它">其它</option>
                </select>
            </div>
        </div><br/>
        <div class="layui-form-item">
            <label class="layui-form-label">审批人</label>
            <div class="layui-input-block" style="width: 35%;">
                <select name="interest" class="spr" lay-filter="aihao" >
                    <option value="1">系统管理员</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="" id="panduan" value="1" style="display: none;">
                <button class="layui-btn tj" lay-submit="" value="1" lay-filter="demo1">申请</button>
                <button class="layui-btn bc" lay-submit="" value="2" lay-filter="demo1">保存</button>
            </div>
        </div>
    </form>
</div>




</body>
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
        {{#  if(d.LeaveState == '未批准'){ }}
        <%--<a class="layui-btn layui-btn-xs" value="1" lay-event="pz">批准</a>--%>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        {{#  } else if(d.LeaveState == '已审核'){ }}
        <a class="layui-btn layui-btn-xs qiyong" lay-event="dxjia">销假</a>
        {{#  } else if(d.LeaveState == '已销假'){ }}
        <a class="layui-btn layui-btn-xs qiyong" lay-event="ckxj">查看</a>
        {{#  } else if(d.LeaveState == '请求销假'){ }}
        {{#  } else if(d.LeaveState == '不批准'){ }}
        <a class="layui-btn layui-btn-xs qiyong" lay-event="ckxj">查看</a>
        {{#  } }}
</script>
<script>
    layui.use(['form', 'table', 'laydate', 'layer'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            $ = layui.jquery;

        //日期
        laydate.render({
            elem: '#date',
            type: 'datetime'
        });
        laydate.render({
            elem: '#date1',
            type: 'datetime'
        });

        //异步提交添加
        form.on('submit(demo1)',function () {
            var timea = now;
            $.ajax({
                url:'xxLeaveForInsert',
                type:"post",
                data:{
                    "userId":$(".tjry").val(),
                    "ratyfyUser":$(".spr option").val(),
                    "beginTime":$(".kssj").val(),
                    "overTime":$(".jssj").val(),
                    "leaveNumber":$(".qjsc").val(),
                    "leaveTime":timea,
                    "forCause":$(".qjyy").val(),
                    "leaveType":$(".qjlx option").val(),
                    "id":$(this).val(),//判断编辑还是添加
                    "aid":$(this).attr("id")//获取需要更改的id
                },
                dateType:"json",
                success:function (data) {
                    alert(data.message);
                    window.location.reload();
                }
            })
            return false;
        })
        fall(1);//登陆人id
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
                {field: 'useid', width: 100, title: '请假人'},
                {field: 'ForCause', width: 100, title: '请假缘由'},  //sort：true页面可进行排序操作
                {field: 'LeaveType', width: 100, title: '请假类型'},
                {field: 'LeaveTime', width: 180, title: '请假日期', sort: true},
                {field: 'RatyUse', width: 180, title: '审批人', sort: true},
                {field: 'BeginTime', width: 180, title: '开始日期', sort: true},
                {field: 'OverTime', width: 180, title: '结束日期', sort: true},
                {field: 'LeaveNumber', width: 180, title: '请假天数', sort: true},
                {field: 'LeaveState', width: 180, title: '状态', sort: true},
                {fixed: 'right', width: 200, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
            },
        })
        //监听头工具栏事件
        table.on('toolbar(bianshan)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    /*$(".tjry").val("");*/
                    $(".qjyy").val("");
                    $(".kssj").val("");
                    $(".jssj").val("");
                    $(".qjsc").val("");
                    $(".spr").val("");
                    $(".qjlx").val("");
                    /*$(".ry").val("");*/
                    $(".tj").attr("id","0");
                    $('#panduan').val("1");
                    var p = $("#panduan").val();
                    if (p == "1") {
                        $(".tj").css("display", "block");
                        $(".bc").css("display", "none");
                    }
                    layui.use(['layer'],function () {
                        var layer = layui.layer,$=layui.$;
                        layer.open({
                            type:1,//类型
                            area:['40%','70%'],//定义宽和高
                            title:'添加',//题目
                            shadeClose:false,//点击遮罩层关闭
                            content: $('#motaikunag') //打开的内容
                            /*content: 'index.jsp'//打开的内容 type为2*/
                        });
                    })
                    break;
            };
        });
        //监听行工具事件
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'dxjia'){
                $.ajax({
                    url:"xxLezveForUpdate",
                    type:"post",
                    data:{
                        "leaveForId":data.Leave_ForId,
                        "name":$(this).html()
                    },
                    dataType:"json",
                    success:function(data){
                        alert(data.message);
                        table.reload(['weiyi'], function () {
                        })
                    }
                })
            }else if(layEvent === 'edit'){
                $(".tjry").val(data.UserId);$(".qjyy").val(data.ForCause);
                $(".kssj").val(data.BeginTime);$(".jssj").val(data.OverTime);
                $(".qjsc").val(data.LeaveNumber);$(".spr").val(data.RatyUse);
                $(".qjlx").val(data.LeaveType);$(".ry").val(data.useid);
                $(".bc").attr("id",data.Leave_ForId);
                $("#panduan").val("");
                $("#panduan").val("2");
                var p = $("#panduan").val();
                if (p == "2") {
                    $(".tj").css("display", "none");
                    $(".bc").css("display", "block");
                }
                layui.use(['layer'], function () {
                    var layer = layui.layer, $ = layui.$;
                    layer.open({
                        type: 1,//类型
                        area: ['40%', '70%'],//定义宽和高
                        title: '编辑',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#motaikunag') //打开的内容
                        /*content: 'index.jsp'//打开的内容 type为2*/
                    });
                })
            }else if(layEvent === 'del'){
                layer.confirm('真的提交', function (index) {
                    $.ajax({
                        url: "xxLezveForDelete",
                        type: "post",
                        data: {
                            "leaveForId":data.Leave_ForId
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
        });


    }

    $(function () {
        $(".qjsc").bind("click", function () {

            //判断开始时间和结束时间
            var strStartTime = $("#date").val();
            var endTime = $("#date1").val();

            if (strStartTime == "" || endTime == "") {
                $(".qjsc").val(0);
            }
            else {
                var startNum = parseInt(strStartTime.replace(/-/g, ''), 10);
                var endNum = parseInt(endTime.replace(/-/g, ''), 10);
                if (startNum > endNum) {
                    alert("结束时间不能在开始时间之前！");
                }
                else {
                    $(".qjsc").val(DateDiff(strStartTime, endTime));  //调用/计算两个日期天数差的函数，通用
                }
            }
        });
        function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式

            var aDate, oDate1, oDate2, iDays;
            aDate = sDate1.split("-");
            oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
            aDate = sDate2.split("-");
            oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
            iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
            return iDays;  //返回相差天数
        }
    })
    /*获取系统当前时间*/
    function getNow(s) {
        return s < 10 ? '0' + s: s;
    }
    var myDate = new Date();
    //获取当前年
    var year=myDate.getFullYear();
    //获取当前月
    var month=myDate.getMonth()+1;
    //获取当前日
    var date=myDate.getDate();
    var h=myDate.getHours();       //获取当前小时数(0-23)
    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    var s=myDate.getSeconds();
    var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
</script>
</html>
