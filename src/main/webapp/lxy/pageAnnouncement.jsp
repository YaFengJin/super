<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">

</head>
<%--模态框--%>
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="../static/layui/layui.js"></script>

<body>

<!-- 按钮触发模态框 -->
<button id="xjgg" class="btn btn-primary btn-lg" data-toggle="modal" style="position: absolute;left:1200px" data-target="#myModal" id="tj">
    新建公告
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <table id="table">
                <tr style="display: none">
                    <td>
                        是否发布:
                    </td>
                    <td>
                        <input type="text" value="1" name="AM_State" id="amState">
                    </td>
                </tr>

                <tr>
                    <td>类型:</td>
                    <td>
                        <select name="at_id" class="form-control" id="atId">
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>发布人</td>
                    <td>
                        <input type="text" class="form-control" name="AM_Person" value="${name}">
                        <input type="text" class="form-control" id="amPerson"  hidden value="${id}">
                    </td>
                </tr>
                <tr>
                    <td>标题</td>
                    <td>
                        <input type="text" class="form-control" name="AM_Theme" id="amTheme">
                    </td>
                </tr>
                <tr>
                    <td>发布范围</td>
                    <td>
                        <input type="text" class="form-control" name="DeptId" id="deptId">
                    </td>
                </tr>
                <tr>
                    <td>发布时间</td>
                    <td>
                        <input type="date" class="form-control" name="AM_Datetime" id="amDatetime">
                    </td>
                </tr>
                <tr>
                    <td>生效时间</td>
                    <td>
                        <input type="date" class="form-control" name="AM_Tovs" id="amTovs">
                    </td>
                </tr>
                <tr>
                    <td>终止时间</td>
                    <td>
                        <input type="date" class="form-control" name="AM_Tove" id="amTove">
                    </td>
                </tr>
                <tr>
                    <td>内容</td>
                    <td>
                        <input type="text" class="form-control" name="AM_Content" id="amContent">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="提交" id="bt">
                    </td>
                </tr>
            </table>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<%--模糊搜索--%>
<div style="margin-top: 20px;margin-left: 200px;">
    <span>标题：</span>
    <input type="text" style="height: 27px;width: 200px;" id="chaxun" placeholder="请输入标题进行模糊查询"/>
</div>
<center>
<%--数据的table--%>
<div class="layui-card-body" style="width: 1350px">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>
</div>
</center>
<div id="motaikunag" style="display:none;">
    <center>
        <div>
            <div>
                <table class="table" style="width:600px;">
                    <tbody>
                    <tr class="success">
                        <td>标题:<input type="text" name="AMTheme"></td>
                        <td>发布范围:<input type="text" name="Deptid"></td>
                        <td>类型:
                            <p>
                            <select name="announcementtype" id="announcementtype">
                            </select>
                            </p>
                        </td>
                    </tr>
                    <tr class="danger">
                        <td>发布时间:<input type="date" name="AMDatetime"></td>
                        <td>生效日期:<input type="date" name="AMTovs"></td>
                        <td>终止日期:<input type="date" name="AMTove"></td>
                    </tr>
                    <tr class="warning">
                        <td colspan=2>内容</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="layui-form-item layui-form-text">
                <div class="layui-input-block" style="width:600px;position:relative;bottom:18px;left:-55px">
                      <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
                </div>
            </div>
            <button class="site-demo-layedit" style="width:50px" data-type="content" id="btn">确定</button>
            <input type="hidden" id="content">
            <input type="hidden" id="lxy">
        </div>
    </center>

</div>


<input type="hidden" id="startFlag">

</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="upda">生效</a>
    <a class="layui-btn layui-btn-xs" lay-event="updat">终止</a>
</script>

<script type="text/javascript">
    layui.use(['form','table','laydate',], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery;
        var a = "";
        fall(a);
    });
    /*
    * 清空编辑后传入的值
    * */
    $("#xjgg").click(function () {
        $("input[name='AM_State']").val("1");
        $("input[name='AMTheme']").val("");
        $("input[name='Deptid']").val("");
        $("select[name='announcementtype']").val("");
        $("input[name='AMDatetime']").val("");
        $("input[name='AMTovs']").val("");
        $("input[name='AMTove']").val("");
        $("#LAY_demo_editor").val("");
    });

    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where:{"name":kwx},
            url: '/announcement/pageAnnouncement',
            limit: 2,  //默认为10(每页条数)
            title: '公告表',
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', fixed: 'left'},
                {field: 'at_id', width: 80, title: '类型号'},
                {field: 'AM_Id', width: 80, title: '公告号'},  //sort：true页面可进行排序操作
                {field: 'AM_Person', width: 100, title: '发布人'},
                {field: 'at_name', width: 150, title: '类型', sort: true},
                {field: 'DeptId', width: 180, title: '发布范围',sort: true},
                {field: 'AM_Theme', width: 100, title: '标题',sort: true},
                {field: 'AM_Datetime', width: 160, title: '发布时间', sort: true},
                {field: 'AM_Tovs', width: 160, title: '生效日期', sort: true},
                {field: 'AM_Tove', width: 160, title: '终止日期',sort: true},
                {field: 'AM_State', width: 100, title: '状态', sort: true},
                {field: 'AM_Content', width: 180,title: '内容', sort: true},
                {fixed: 'right', width: 250, align:'center', toolbar: '#barDemo'}
            ]],
            page: true,//是否显示   分页AM_Tovs
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                $(".layui-table-box").find("[data-field='at_id']").css("display","none");//隐藏列
                $(".layui-table-box").find("[data-field='AM_Tovs']").css("display","none");
                $(".layui-table-box").find("[data-field='AM_Tove']").css("display","none");
                //数据的回调用，可不写
                $("[data-field='AM_State']").children().each(function () {
                    if($(this).text()=='1'){
                        $(this).text("生效");
                    }else if($(this).text()=='2'){
                        $(this).text("终止");
                    }
                })
            }
        });



       // 编辑 删除 操作
        table.on('tool(bianshan)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            /*alert(data.AM_State);*/
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url:"/announcement/deleteAnnouncement",
                        type:"post",
                        data:{
                            "amId":data.AM_Id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);//向服务端发送删除指令
                        }
                    })
                });
            } else if(layEvent === 'edit'){
                $("#lxy").val(data.AM_Id);
                $("input[name='AMTheme']").val(data.AM_Theme);
                $("input[name='Deptid']").val(data.DeptId);
                $("select[name='announcementtype']").val(data.at_id);
                $("input[name='AMDatetime']").val(data.AM_Datetime);
                $("input[name='AMTovs']").val(data.AM_Tovs);
                $("input[name='AMTove']").val(data.AM_Tove);
                $("#LAY_demo_editor").val(data.AM_Content);
                layui.use(['layer','layedit'],function () {
                    var layer = layui.layer,
                        layedit = layui.layedit,
                        $=layui.jquery;
                    //创建一个编辑器
                    var editIndex = layedit.build('LAY_demo_editor');
                    $('.site-demo-layedit').on('mouseout', function () {
                        var type = $(this).data('type');
                        active[type] ? active[type].call(this) : '';
                    });
                    layer.open({
                        type:1,//类型
                        title:'公告修改信息',
                        area:['60%','60%'],//定义宽和高
                        shadeClose:false,//点击遮罩层关闭
                        content: $('#motaikunag') //打开的内容
                    });
                    $("#btn").click(function(){
                        $.ajax({
                            url:"/announcement/updateAnnouncement",
                            type:"post",
                            data:{
                                "amTheme":$("input[name='AMTheme']").val(),
                                "deptId":$("input[name='Deptid']").val(),
                                "announcementtype.atId":$("select[name='announcementtype']").val(),
                                "amDatetime":$("input[name='AMDatetime']").val(),
                                "amTovs":$("input[name='AMTovs']").val(),
                                "amTove":$("input[name='AMTove']").val(),
                                "amContent":layedit.getContent(editIndex),  //获取编辑器内容
                                "amId":$("#lxy").val()
                            },
                            dataType:"json",
                            success:function(data){
                                alert(data.message);
                                window.parent.location.reload();
                            }
                        });
                    }) ;
                });
            }else if(layEvent === 'upda'){
               /* var date=new Date();
                var a=date.toLocaleDateString();*/
                if(data.AM_State=='1'){
                    alert("公告生效中！！！！");
                }else{
                    $.ajax({
                        url:"/announcement/updateState",
                        type:"post",
                        data:{
                            "amId":data.AM_Id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            window.location.reload();
                        }
                    });
                }
            }else if(layEvent === 'updat'){
                /*var date=new Date();
                var a=date.toLocaleDateString();*/
                if(data.AM_State=='2'){
                    alert("公告终止中！！！！");
                }else{
                    $.ajax({
                        url:"/announcement/update",
                        type:"post",
                        data:{
                            "amId":data.AM_Id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            window.location.reload();
                        }
                    });
                }
            }








        })
    }
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
    /*
    * 查询公告类型
    * */
    $(function () {
        $.ajax({
            url:"/announcement/findAnnouncementtype",
            type:"post",
            dataType:"json",
            success:function(data) {
                $("#announcementtype").html("");
                var a ="";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].at_id+">"+data[i].at_name+"</option>";
                }
                $("#announcementtype").append(a);
                $("#atId").append(a);
            }
        });
    });




/*
* 增加
* */

    $(function() {
        $("#bt").click(function() {
            /*alert($("#amState").val());*/
            var AM_State=$("#amState").val();
            var at_id=$("#atId").val();
            var AM_Person=$("#amPerson").val();
            var AM_Theme=$("#amTheme").val();
            var DeptId=$("#deptId").val();
            var AM_Datetime=$("#amDatetime").val();
            var AM_Tovs=$("#amTovs").val();
            var AM_Tove=$("#amTove").val();
            var AM_Content=$("#amContent").val();
            $.ajax({
                url:"/announcement/saveAnnouncement",
                type:"post",
                data:{
                    "amState":AM_State,
                    "announcementtype.atId":at_id,
                    "amPerson":AM_Person,
                    "amTheme":AM_Theme,
                    "deptId":DeptId,
                    "amDatetime":AM_Datetime,
                    "amTovs":AM_Tovs,
                    "amTove":AM_Tove,
                    "amContent":AM_Content
                },
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    $("#table").css("display","none");
                    window.parent.location.reload();
                }
            });
        });
    });
   /*$(function(){
       var date=new Date();
       var a=date.toLocaleDateString();
       alert(a);
   })*/
</script>