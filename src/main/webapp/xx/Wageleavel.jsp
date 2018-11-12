<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-10-31
  Time: 20:32
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
<body>
<div class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" class="layui-input renyuan" placeholder="人员编号">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" class="layui-input yuefen" id="test1" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <button type="button" class="layui-btn layui-btn-warm chaxun">查询</button>
    </div>
</div>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
<div id="xinzijisuan" class="layui-form" style="display: none;">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>姓名</th>
            <th>基础工资</th>
            <th>保险项(保险项扣除)</th>
            <th>薪酬项目项(项目项增加)</th>
            <th>请假次数(40/次)</th>
            <th>缺勤次数(50/次)</th>
            <th>早退次数(40/次)</th>
            <th>考勤所扣项</th>
            <th>总工资</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan="2" class="b0"></td>
            <td rowspan="2" class="b1"></td>
            <td rowspan="2" class="b2"></td>
            <td rowspan="2" class="b3"></td>
            <td class="b4"></td>
            <td class="b5"></td>
            <td class="b6"></td>
            <td class="b7" rowspan="2"></td>
            <td class="b8" rowspan="2"></td>
        </tr>
        <tr>
            <td class="b9"></td>
            <td class="b10"></td>
            <td class="b11"></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="sel">查看</a>
</script>
<script>
    layui.use(['form', 'table', 'laydate', 'layer'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            $ = layui.jquery;
        //年月选择器
        laydate.render({
            elem: '#test1'
            ,type: 'month'
        });
        fall();
        $(".chaxun").click(function () {
            fall($(".renyuan").val(),$(".yuefen").val());
        })
    })
    //查询数据的分页
    function fall(userid,name) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where: {"userid": userid,
                    "name":name
            },
            url: 'xxWagelevelSelect',
            id: 'weiyi',
            limits: [1, 3, 7, 10, 50, 100],
            limit: 10,  //默认为10
            title: '班次表',
            //加载表格内容
            cols: [[//标题栏
                {field: 'WageLeveld', width: 100, title: '工资编号', sort: true},  //sort：true页面可进行排序操作
                {field: 'UserName', width: 80, title: '姓名'},
                {field: 'UserId',width: 60, title: '编号'},
                {field: 'BasePay',width: 100,  title: '底薪'},
                {field: 'Bonus',width: 120,  title: '养老保险(减项)'},
                {field: 'RoomSupplement',width: 120,  title: '医疗保险(减项)'},
                {field: 'CarSupplement',width: 120,  title: '失业保险(减项)'},
                {field: 'EndowmentIns',width: 120,  title: '住房公积金(减项)'},
                {field: 'MedicalIns',width: 100,  title: '8'},//1
                {field: 'HousingFund',width: 100,  title: '9'},//1
                {field: 'UnemploymentIns',width: 100,  title: '10'},//1
                {field: 'EmploymentIns',width: 100,  title: '11'},//1
                {field: 'Wone',width: 100,  title: '13'},//1
                {field: 'Wtwo',width: 100,  title: '14'},//1
                {field: 'MaternityIns',width: 100,  title: '12'},//1
                {field: 'Wthree',width: 100,  title: '15'},//1
                {field: 'Wfour',width: 100,  title: '16'},//1
                {field: 'Wfive',width: 100,  title: '17'},//1
                {field: 'Time',width: 100,  title: '月份'},
                {field: 'Subsidy',width: 100,  title: '总和'},
                {fixed: '', width: 200, toolbar: '#barDemo'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                var j = [];
                for (i=0;i<res.list.length;i++){
                    j[i] = res.list[i].ProjectName;
                }/*
                alert($('td').eq(1).next().text());*/
                //数据的回调用，可不写 15 16 17 18 19
                //alert(res.data[0].WageLeveld);
                $("[data-field='MedicalIns']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[0] == null) {
                        $(".layui-table-box").find("[data-field='MedicalIns']").css("display","none");
                    }else {
                        $('th').eq(8).text(j[0]+"(加项)");
                        $('th').eq(8).css("width","100");
                    }
                });
                $("[data-field='HousingFund']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[1] == null) {
                        $(".layui-table-box").find("[data-field='HousingFund']").css("display","none");
                    }else {
                        $('th').eq(9).text(j[1]+"(加项)");
                        $('th').eq(9).css("width","100");
                    }
                });
                $("[data-field='UnemploymentIns']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[2] == null) {
                        $(".layui-table-box").find("[data-field='UnemploymentIns']").css("display","none");
                    }else {
                        $('th').eq(10).text(j[2]+"(加项)");
                        $('th').eq(10).css("width","100");
                    }
                });
                $("[data-field='EmploymentIns']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[3] == null) {
                        $(".layui-table-box").find("[data-field='EmploymentIns']").css("display","none");
                    }else {
                        $('th').eq(11).text(j[3]+"(加项)");
                        $('th').eq(11).css("width","100");
                    }
                });
                $("[data-field='MaternityIns']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[4] == null) {
                        $(".layui-table-box").find("[data-field='MaternityIns']").css("display","none");
                    }else {
                        $('th').eq(12).text(j[4]+"(加项)");
                        $('th').eq(12).css("width","100");
                    }
                });
                $("[data-field='Wone']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[5] == null) {
                        $(".layui-table-box").find("[data-field='Wone']").css("display","none");
                    }else {
                        $('th').eq(13).text(j[5]+"(加项)");
                        $('th').eq(13).css("width","100");
                    }
                });
                $("[data-field='Wtwo']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[6] == null) {
                        $(".layui-table-box").find("[data-field='Wtwo']").css("display","none");
                    }else {
                        $('th').eq(14).text(j[6]+"(加项)");
                        $('th').eq(14).css("width","100");
                    }
                });
                $("[data-field='Wthree']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[7] == null) {
                        $(".layui-table-box").find("[data-field='Wthree']").css("display","none");
                    }else {
                        $('th').eq(15).text(j[7]+"(加项)");
                        $('th').eq(15).css("width","100");
                    }
                });
                $("[data-field='Wfour']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[8] == null) {
                        $(".layui-table-box").find("[data-field='Wfour']").css("display","none");
                    }else {
                        $('th').eq(16).text(j[8]+"(加项)");
                        $('th').eq(16).css("width","100");
                    }
                });
                $("[data-field='Wfive']").children().each(function () {
                    if ($(this).text() == 0 || $(this).text() == "" || j[9] == null) {
                        $(".layui-table-box").find("[data-field='Wfive']").css("display","none");
                    }else {
                        $('th').eq(17).text(j[9]+"(加项)");
                        $('th').eq(17).css("width","100");
                    }
                })
            },

        })
        //监听头工具栏事件
        table.on('toolbar(bianshan)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                        layer.open({
                            type: 2,//类型
                            area: ['80%', '90%'],//定义宽和高
                            title: '添加',//题目
                            shadeClose: false,//点击遮罩层关闭
                            content: 'PayrollSetup.jsp' //打开的内容
                            /*content: 'index.jsp'//打开的内容 type为2*/
                        });
                    break;
            };
        });
        //监听行工具事件
        table.on('tool(bianshan)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'sel') {
                var a0 = parseInt(data.MedicalIns);var a1 = parseInt(data.HousingFund);var a2 = parseInt(data.UnemploymentIns);
                var a3 = parseInt(data.EmploymentIns);var a4 = parseInt(data.Wone);var a5 = parseInt(data.Wtwo);
                var a6 = parseInt(data.MaternityIns);var a7 = parseInt(data.Wthree);var a8 = parseInt(data.Wfour);var a9 = parseInt(data.Wfive);
                var bao0 = parseInt(data.Bonus);var bao1 = parseInt(data.RoomSupplement);
                var bao2 = parseInt(data.CarSupplement);var bao3 = parseInt(data.EndowmentIns);
                if (a0==1){a0 = 0;}if (a1==1){a1 = 0;}if (a2==1){a2 = 0;}
                if (a3==1){a3 = 0;}if (a4==1){a4 = 0;}if (a5==1){a5 = 0;}
                if (a6==1){a6 = 0;}if (a7==1){a7 = 0;}if (a8==1){a8 = 0;}if (a9==1){a9 = 0;}
                $(".b0").text(data.UserName);$(".b1").text(data.BasePay);
                $(".b2").text(bao0+bao1+bao2+bao3);$(".b3").text(a0+a1+a2+a3+a4+a5+a6+a7+a8+a9);
                $.ajax({
                    url:"xxWageLeavelS",
                    type:"post",
                    data:{
                        "userId":data.UserId,
                        "time":data.Time
                    },
                    dataType:"json",
                    success:function (all) {
                        $(".b4").text(all.list.qingjia);$(".b5").text(all.list.queqin);$(".b6").text(all.list.zaotui);
                        $(".b9").text(parseInt(all.list.qingjia)*40);$(".b10").text(parseInt(all.list.queqin)*50);
                        $(".b11").text(parseInt(all.list.zaotui)*40);
                        $(".b7").text(parseInt($(".b9").text())+parseInt($(".b10").text())+parseInt($(".b11").text()));
                        $(".b8").text(parseInt($(".b1").text())-parseInt($(".b2").text())+parseInt($(".b3").text())-parseInt($(".b7").text()))
                        layer.open({
                            type: 1,//类型
                            area: ['80%', '30%'],//定义宽和高
                            title: '添加',//题目
                            shadeClose: false,//点击遮罩层关闭
                            content: $("#xinzijisuan") //打开的内容
                            /*content: 'index.jsp'*///打开的内容 type为2
                        });
                    }
                })
            }
        })
    }
    /*var tables = $("#t_sys_userGrid").next().find(".layui-table-box");// t_sys_userGrid 表id
    tables.find("[data-field='u_id']").css("display","none");*/
</script>
</html>
