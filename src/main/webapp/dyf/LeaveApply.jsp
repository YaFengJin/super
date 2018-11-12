<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>离职申请</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<center>
    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新建离职申请</button>
    </div>
</center>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="saveleaveapply" style="display: none">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">离职人员:*</label>
                <div class="layui-input-inline">
                    <input type="tel" lay-verify="required" value="${name}" readonly autocomplete="off" class="layui-input">
                    <input type="tel" name="userId" id="userId" value="${id}" hidden>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">离职部门:*</label>
                <div class="layui-input-inline">
                    <input type="tel" id="DeptName" lay-verify="required" readonly autocomplete="off" class="layui-input">
                    <input type="tel" name="leaveDept" id="DeptId" style="display: none">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">申请日期*:</label>
                <div class="layui-input-inline">
                    <input type="date" name="appLyTime" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">拟离职日期:</label>
                <div class="layui-input-inline">
                    <input type="date" name="yLeaveTime" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">附件:</label>
                <div class="layui-input-inline">
                    <input type="file" name="leaveAppLyAccess" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline enddate">
                <label class="layui-form-label">离职当月薪资:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="leaveAtWage" id="leaveAtWage" readonly lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注:</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="leaveAppLyRemak"></textarea>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">离职原因:</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" lay-verify="required" name="leaveCause"></textarea>
                </div>
            </div>
        </div>

                <input type="tel" name="leaveGo" hidden value="待审核"></input>

        <center>
            <button type="button" class="layui-btn" lay-submit  lay-filter="saveLeaveApply">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </center>
    </form>
</div>

<div id="updleaveapply" style="display: none">
    <form class="layui-form" id="form1">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">离职人员:*</label>
                <div class="layui-input-inline">
                    <input type="tel" id="Leave_AppLyId" name="leaveAppLyId" hidden>
                    <input type="tel" id="UserName1" readonly lay-verify="required" autocomplete="off" class="layui-input">
                    <input type="tel" id="userId1" name="userId" hidden>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">离职部门:*</label>
                <div class="layui-input-inline">
                    <input type="tel" id="DeptName1" readonly lay-verify="required" autocomplete="off" class="layui-input">
                    <input type="tel" name="leaveDept" id="DeptId1" hidden>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">申请日期*:</label>
                <div class="layui-input-inline">
                    <input type="date" name="appLyTime" id="appLyTime1" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">拟离职日期:</label>
                <div class="layui-input-inline">
                    <input type="date" name="yLeaveTime" id="yLeaveTime1" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">附件:</label>
                <div class="layui-input-inline">
                    <input type="file" name="leaveAppLyAccess" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">离职当月薪资:</label>
                <div class="layui-input-inline">
                    <input type="tel" name="leaveAtWage" id="leaveAtWage1" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">备注:</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="leaveAppLyRemak" id="leaveAppLyRemak1"></textarea>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">离职原因:</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="leaveCause" id="leaveCause1"></textarea>
                </div>
            </div>
        </div>

        <input type="tel" name="leaveGo" hidden value="待审核"></input>

        <center>
            <button type="button" class="layui-btn" lay-submit  lay-filter="updateLeaveApply">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </center>
    </form>
</div>

<form class="layui-form" id="treeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-input-block" id="UserNames">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="saveUser" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>

</body>

</html>

<script type="text/html" id="barDemo">
    {{#  if(d.LeaveGo == "待审核" || d.LeaveGo == "审核未通过"){ }}
    <button class="layui-btn layui-btn-normal" lay-Event="updleaveapply">修改</button>
    {{#  } }}
    {{#  if(d.LeaveGo == "审核已通过"){ }}
    <button class="layui-btn layui-btn-normal" lay-Event="ff">查看</button>
    {{#  } }}
</script>

<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>

    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });

    layui.use('layer', function(){
        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type:1,//类型
                    title:'新建离职申请',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#saveleaveapply') //打开的内容
                });
            },

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });

    layui.use(['table','layer','form','layedit', 'laydate','authtree'], function(){
        var layer= layui.layer
            ,form = layui.form
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,authtree=layui.authtree
            ,$=layui.$;
        var kw='';
        addData(kw);

        $(function(){
            var userId = $("#userId").val();
            $.ajax({
                url:"/queryUserSurFace",
                type:"post",
                data:{
                    "userId":userId
                },
                async : false,
                dataType:"json",
                success:function(data){
                    var a = data.list[0];
                    $("#DeptName").val(a.DeptName);
                    $("#DeptId").val(a.DeptId);
                }
            });
            $.ajax({
                url:"/querycontractmoney",
                type:"post",
                data:{
                    "UserId":userId
                },
                async : false,
                dataType:"json",
                success:function(data){
                    var a = data.list[0];
                    $("#leaveAtWage").val(a.ContractMoney);
                }
            });
        })

        form.on('submit(saveLeaveApply)', function(data){
            //发送ajax
            $.ajax({
                url:"/saveLeaveApply",
                type:"post",
                data:$("#form").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        form.on('submit(updateLeaveApply)', function(data){
            //发送ajax
            $.ajax({
                url:"/updateLeaveApply",
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
        var UserId=${id};
        table.render({
            elem: '#test'
            ,url:'/queryLeaveApplyjl?UserId='+UserId
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
                ,{field:'LeaveGo', width:200, title: '状态'}
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
            if (LayEvent === 'updleaveapply'){
                var Leave_AppLyId = data.Leave_AppLyId;
                layer.open({
                    type:1,//类型
                    title:'修改离职申请',
                    area:['60%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#updleaveapply') //打开的内容
                });
                layui.use(['form','util'], function() {
                    var form = layui.form;
                    $.ajax({
                        url:"/updatequeryLeaveApply",
                        type:"post",
                        data:{
                            "Leave_AppLyId":Leave_AppLyId
                        },
                        dataType:"json",
                        success:function(data){
                            var a = data.data[0];
                            $("#Leave_AppLyId").val(a.Leave_AppLyId);
                            $("#UserName1").val(a.UserName);
                            $("#userId1").val(a.LeaveDept);
                            $("#DeptName1").val(a.DeptName);
                            $("#DeptId1").val(a.DeptId);
                            $("#appLyTime1").val(a.AppLyTime);
                            $("#yLeaveTime1").val(a.YLeaveTime);
                            $("#leaveAtWage1").val(a.leaveAtWage);
                            $("#leaveGo1").val(a.LeaveGo);
                            $("#leaveAppLyRemak1").val(a.Leave_AppLyRemak);
                            $("#leaveCause1").val(a.LeaveCause);

                        }
                    });


                })
            }

        })


    }

</script>