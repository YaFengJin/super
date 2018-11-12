<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>离职管理</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="lywp" style="display: none">
    <table class="layui-hide" id="test2" lay-filter="tab"></table>
</div>

<div id="queryidleaveapply" style="display: none">

    <center>
    <button class="layui-btn layui-btn-normal" id="cklywp">查看领用物品</button>
    </center>

    <table class="layui-hide" id="test1" lay-filter="tab"></table>

    <center>
        <button class="layui-btn layui-btn-lg layui-btn-normal" id="sptg">批准</button>
        <button class="layui-btn layui-btn-lg layui-btn-danger" id="spbtg">不批准</button>
    </center>
</div>

<div style="display: none" id="spyj">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                    <input type="tel" id="Leave_AppLyId" hidden>
                    <textarea class="layui-textarea" lay-verify="required" id="sply" name="spyj" placeholder="请输入不给予通过审核的理由！"></textarea>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button" class="layui-btn" lay-submit lay-filter="updateleaveapplylg" value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

</body>

</html>
  <script type="text/html" id="barDemo">
        {{#  if(d.LeaveGo == "待审核" || "审核未通过"){ }}
        <button class="layui-btn layui-btn-normal" lay-Event="queryApplyid">审批</button>
        {{#  } }}
        {{#  if(d.LeaveGo == "审核已通过"){ }}
        <button class="layui-btn layui-btn-normal" lay-Event="ff">查看</button>
        {{#  } }}
</script>
<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.use(['table','layer','form','layedit', 'laydate'], function(){
        var layer= layui.layer
            ,form = layui.form
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        var kw='';
        addData(kw);

        $("#cklywp").click(function() {
            var UserId = $(this).parent().parent().find("table").find("tbody").find("div").eq(1).html();
            var table = layui.table;
            layer.open({
                    type:1,//类型
                    title:'查看领用物品',
                    area:['40%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#lywp')
            });
            table.render({
                elem: '#test2'
                ,url:'/queryapplyjl?UserId='+UserId
                ,cols: [[
                    ,{field:'work_name', width:150, title: '办公用品名称'}
                    ,{field:'b_bankname', width:150,  title: '所属库'}
                    ,{field:'sort_style', width:150, title: '所属类'}
                    ,{field:'apply_price', width:150, title: '价格'}
                    ,{field:'apply_date', width:150, title: '申请日期'}
                    ,{field:'apply_number',width:150, title: '数量'}
                ]]
                ,done:function(res, curr, count){
                    //数据的回调用，可不写

                }
            })
        });

        form.on('submit(updateleaveapplylg)', function(data){
            var spyj=$("#sply").val();
            var Leave_AppLyId=$("#Leave_AppLyId").val();
            layer.confirm('你确定提交意见吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "/updateleaveapplyleavego",
                    type: "post",
                    data: {
                        "spyj":spyj,
                        "Leave_AppLyId": Leave_AppLyId
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
            ,url:'/queryLeaveApply'
            ,limit:1 //默认为10
            ,page: true
            ,cols: [[
                {field:'Leave_AppLyId'}
                ,{field:'UserName', width:150, title: '离职人员'}
                ,{field:'DeptName', width:200, title: '离职部门'}
                ,{field:'YLeaveTime', width:200, title: '拟离职日期'}
                ,{field:'SleaveTime', width:200, title: '实际离职日期'}
                ,{field:'WageUpTime', width:200, title: '工资截止日期'}
                ,{field:'Leave_AppLyRemak', width:200, title: '备注'}
                ,{field:'leaveAtWage', width:200, title: '离职当月薪资'}
                ,{fixed: 'right', width: 330,align:'center',toolbar: '#barDemo',title: '操作'}
            ]]
            ,done:function(res, curr, count){
                //数据的回调用，可不写
                $("[data-field='Leave_AppLyId']").css('display','none');

            }
        });

        table.on('tool(tab)', function (obj) {
            var data = obj.data, LayEvent = obj.event;
            if (LayEvent === 'queryApplyid'){
                var Leave_AppLyId = data.Leave_AppLyId;
                layer.open({
                    type:1,//类型
                    title:'申请详细',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#queryidleaveapply') //打开的内容
                });
                table.render({
                    elem: '#test1'
                    ,url:'/updatequeryLeaveApply?Leave_AppLyId='+Leave_AppLyId
                    ,cols: [[
                         {field:'Leave_AppLyId'}
                        ,{field:'UserId'}
                        ,{field:'UserName', width:150, title: '离职人员'}
                        ,{field:'DeptName', width:200, title: '离职部门'}
                        ,{field:'YLeaveTime', width:200, title: '拟离职日期'}
                        ,{field:'Leave_AppLyRemak', width:200, title: '备注'}
                        ,{field:'leaveAtWage', width:200, title: '离职当月薪资'}
                    ]]
                    ,done:function(res, curr, count){
                        //数据的回调用，可不写
                        $("[data-field='Leave_AppLyId']").css('display','none');
                        $("[data-field='UserId']").css('display','none');

                    }
                })
            }

        })


    }

    $("#sptg").click(function() {
        var Leave_AppLyId = $(this).parent().parent().find("table").find("tbody").find("div").eq(0).html();
        var UserId = $(this).parent().parent().find("table").find("tbody").find("div").eq(1).html();
        layer.confirm('你确定通过这个申请吗？', {
            btn: ['确定','取消'] //按钮
        },function () {
            $.ajax({
                url: "/LeaveApplyshtg",
                type: "post",
                data: {
                    "Leave_AppLyId": Leave_AppLyId,
                    "UserId":UserId
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
        var Leave_AppLyId = $(this).parent().parent().find("table").find("tbody").find("div").html();
        $("#Leave_AppLyId").val(Leave_AppLyId);
        layer.open({
            type: 1
            ,closeBtn: true
            ,area:['50%','50%']//定义宽和高
            ,shade: 0.8
            ,btnAlign: 'c'
            ,content: $('#spyj')
        });
    });

</script>