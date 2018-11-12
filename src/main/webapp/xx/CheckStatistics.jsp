<%--
  Created by IntelliJ IDEA.
  User: VULCAN
  Date: 2018-11-10
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考勤统计</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>
<script type="text/javascript" src="../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<body>
<%--模糊查询--%>
<div class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" class="layui-input renyuan" placeholder="人员编号">
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-inline">
                <select name="city" lay-verify="" id="select" class="select">
                    <option value="">请选择一个部门</option>
                </select>
            </div>
        </div>
        <button type="button" class="layui-btn layui-btn-warm chaxun">查询</button>
    </div>
</div>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
<%--明细--%>
<table class="layui-table t" style="display: none;" lay-even="" lay-skin="row">
    <thead>
    <tr>
        <th>人员编号</th>
        <th>人员姓名</th>
        <th>考勤时间</th>
        <th>第一次签到</th>
        <th>第一次签退</th>
        <th>第二次签到</th>
        <th>第二次签退</th>
    </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table>
</body>
<%--右边工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs jinyong" lay-event="mingxi">明细</a>
</script>
<script>
    layui.use(['form', 'table', 'laydate', 'layer'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            table = layui.table,
            $ = layui.jquery;
        $(".chaxun").click(function () {
            fall($(".select").val(),$(".renyuan").val());
        })
        fall();
        $(function () {
          $.ajax({
              url:"userdeptselect",
              type:"post",
              data:{},
              dataType:"json",
              success:function(all){
                  var option = "";
                  for (var i = 0; i < all.list.length; i++) {
                      option += "<option value='"+all.list[i].DeptName+"'>"+all.list[i].DeptName+"</option>";
                  }
                  $(".select").append(option);
                  form.render();
              }
          })
        })

    })
    //查询数据的分页 执行渲染
    function fall(kwx,uid){
        var table = layui.table //表格
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where: {"name": kwx,
                    "uid":uid},
            url: 'xxkaoqintongji',
            id: 'weiyi',
            limits: [1, 3, 7, 10, 50, 100],
            limit: 10,  //默认为10
            title: '考勤统计',
            totalRow: true,
            //加载表格内容
            cols: [[//标题栏
                {field: 'UserId', width: 100, title: '员工编号', sort: true, totalRowText: '合计：'},
                {field: 'CheckName', width: 150, title: '员工姓名', sort: true},  //sort：true页面可进行  排序操作
                {field: 'date', width: 150, title: '月份', sort: true},  //sort：true页面可进行排序操作
                {field: 'DeptName', width: 200, title: '员工部门', sort: true},
                {field: 'zhengchang', width: 200, title: '正常/次', sort: true, totalRow: true},
                {field: 'queqin', width: 200, title: '缺勤/次', sort: true, totalRow: true},
                {field: 'zaotui', width: 200, title: '早退/次', sort: true, totalRow: true},
                {field: 'qingjia', width: 200, title: '请假/次', sort: true, totalRow: true},
                {fixed: 'right', width: 100, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
            },
        })
        //监听行工具事件
        table.on('tool(bianshan)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'mingxi') {
                $.ajax({
                    url:"xxmingxi",
                    type:"post",
                    data:{"userId":data.UserId},
                    dataType:"json",
                    success:function(all){
                        var tr = "";
                        for (var i = 0; i <all.list.length ; i++) {
                            tr += "<tr>" +
                                "<td>"+all.list[i].UserId+"</td>" +
                                "<td>"+all.list[i].CheckName+"</td>" +
                                "<td>"+all.list[i].CheckTime+"</td>" +
                                "<td>"+all.list[i].GoTimeOneText+"</td>" +
                                "<td>"+all.list[i].DownTimeOneText+"</td>" +
                                "<td>"+all.list[i].GoTimeTwoText+"</td>" +
                                "<td>"+all.list[i].DownTimeTwoText+"</td>" +
                                "</tr>";
                        }
                        $("#tbody").html(tr);
                        layer.open({
                            type: 1,//类型
                            area: ['50%', '50%'],//定义宽和高
                            title: '考勤明细',//题目
                            shadeClose: false,//点击遮罩层关闭
                            content: $('.t') //打开的内容
                            /*content: 'index.jsp'//打开的内容 type为2*/
                        });
                    }
                })
            }
        })
    }
</script>
</html>
