<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <%--弹出框--%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script src="<%=basePath %>/static/layui/layui.js"></script>
<script src="<%=basePath %>/static/layui/lay/modules/form.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<center>
<div style="margin-top: 17px;margin-left: 900px;">
   <%-- <span>文件查询：</span>
    <input type="text" style="height: 27px;width: 200px;" id="chaxun" placeholder="请输入文件名进行查询"/>--%>
    <!-- 按钮触发模态框 -->
    <button class="btn btn-primary btn-lg" style="left: 500px" data-toggle="modal" data-target="#myModal" id="wjs">
       新建文件夹
    </button>
       <!-- 模态框（Modal） -->
       <div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content" style="height: 400px">
                   <div class="modal-header">
                       <h4>新建文件夹</h4>
                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                           &times;
                       </button>

                   </div>
                   <center>
                       <table id="table">
                           <tr>
                               <td>文件夹名称</td>
                               <td>
                                   <input type="text" name="Filing_cabinetName" class="filingCabinetName form-control" id="filingCabinetName">
                               </td>
                           </tr>

                           <tr>
                               <td>
                                   <input type="button" value="提交" id="wjsz" style="position: absolute;left: 270px;top: 200px">
                                   <input type="button" data-dismiss="modal" value="关闭" id="gb" style="position: absolute;left: 330px;top: 200px">

                               </td>
                           </tr>
                       </table>
                   </center>
               </div><!-- /.modal-content -->
           </div><!-- /.modal -->
       </div>
</div>
<%--数据的table--%>

<div class="layui-card-body" style="top:60px">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>

</div>
<center>
    <div id="tanchukuang" style="display:none;">
        <div>
            <table class="table" style="width: 700px;">
                <tbody>
                <tr class="success">
                    <td>文件夹名称:<input type="text" name="FilingcabinetName" ></td>
                </tr>
                <tr style="display: none">
                    <td>
                        父id:
                    </td>
                    <td>
                        <input type="text" value="0" name="Filing_cabinetFId" id="filingCabinetFId">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
      <%--  <div class="layui-form-item layui-form-text">
            <div class="layui-input-block" style="width:600px;position:relative;bottom:18px;left:-55px">
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
            </div>
        </div>--%>

        <button class="site-demo-layedit" style="width:50px" data-type="content" id="btn">确定</button>
        <input type="hidden" id="content">
        <input type="hidden" id="xmt">
    </div>
</center>
</center>
</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>

    <a class="layui-btn layui-btn-danger layui-btn-xs sc" lay-event="dele" >删除</a>
   <a class="layui-btn layui-btn-xs" lay-event="cx" >权限设置</a>
</script>
<script>
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
    $("#wjs").click(function () {

        $("input[name='Filing_cabinetName']").val("");

    })
    //查询
    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
        /*    where: {"dname": kwx},*/
            url: 'journalism/pagequery',
            limit: 2,  //默认为10(每页条数)
            title: '公共文件柜设置表',
            //加载表格内容
            cols: [[//标题栏
                /*{type: 'checkbox', fixed: 'left'},*/
                {field: 'Filing_cabinetId', width: 200,title: '排序号'},  //sort：true页面可进行排序操作
              /*  {field: 'documentName',width: 240, title: '文件名称'},
                {field: 'data', title: '发布时间', width: 240},*/
                {field: 'Filing_cabinetName', width: 300, title: '文件柜名称', sort: true},
                {fixed: 'right', width: 300, align: 'center', toolbar: '#barDemo', title: '操作'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {

            }
        });
        /*
* 删除
*
* */
        //监听行工具事件
        table.on('tool(bianshan)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'dele') {
                layer.confirm('确定删除行么', function (index) {
                    $.ajax({
                        url: "/journalism/fdelete",
                        type: "post",
                        async: true,
                        data: {"Filing_cabinetId": data.Filing_cabinetId},
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            window.location.reload();
                        }
                    })
                });
            }else if(layEvent === 'edit'){
                $("#xmt").val(data.Filing_cabinetId);
                $("input[name='FilingcabinetName']").val(data.Filing_cabinetName);
                layui.use(['layer', 'layedit'], function () {
                    var layer = layui.layer,
                        layedit = layui.layedit,
                        $ = layui.jquery;

                    layer.open({
                        type: 1,//类型
                        area: ['30%', '50%'],//定义宽和高
                        title: '编辑',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#tanchukuang'), //打开的内容

                    });
                    $("#btn").click(function () {
                        $.ajax({
                            url: "journalism/fupdate",
                            type: "post",
                            data: {
                                "filingCabinetName": $("input[name='FilingcabinetName']").val(),

                                "filingCabinetId": $("#xmt").val()
                            },
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                                window.parent.location.reload();
                            }
                        });
                    });
                })
            }
        })
    }

    /*
     * 增加
     * */

    $(function() {
        $("#wjsz").click(function() {

            var Filing_cabinetName=$("#filingCabinetName").val();
            var Filing_cabinetFId=$("#filingCabinetFId").val();
            $.ajax({
                url:"journalism/fsave",
                type:"post",
                data:{

                    "filingCabinetName":Filing_cabinetName,
                    "filingCabinetFId":Filing_cabinetFId
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

</script>