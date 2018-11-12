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
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 模态框（Modal）插件</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta charset="utf-8">
    <title>Bootstrap 实例 - 水平表单</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<%--弹出框--%>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">


<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script src="<%=basePath %>/static/layui/layui.js"></script>
<script src="<%=basePath %>/static/layui/lay/modules/form.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<div style="margin-top: 17px;margin-left: 900px;">
    <span>文件查询：</span>
    <input type="text" style="height: 27px;width: 200px;" id="chaxun" placeholder="请输入文件名进行查询"/>
    <!-- 按钮触发模态框 -->
    <button class="btn btn-primary btn-lg" style="position: absolute;left: 50px;top: 10px" data-toggle="modal" data-target="#myModal" id="xj">
      新建文件
    </button>

</div>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test1" lay-filter="wj"></table>

</div>
<center>
    <div id="tanchukuang" style="display:none;">
        <div>
            <table class="table" style="width: 700px;">
                <tbody>
                <tr class="success">
                    <td>文件名称:<input type="text" name="documentName" ></td>
                </tr>



                <tr class="warning">
                    <td colspan=2>文件内容
                        <%-- <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>--%>
                    </td>
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
        <input type="hidden" id="xmt">
    </div>
</center>
<center>
    <div id="tanchukuang1" style="display:none;">
        <table class="table" style="width: 700px;">
            <tbody>
           <%--<tr class="warning">
                <td colspan=2>
                    <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
                </td>
            </tr>--%>

            </tbody>
            <tbody id="list"></tbody>
        </table>
    </div>
    </div>
</center>
</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>

    <a class="layui-btn layui-btn-danger layui-btn-xs sc" lay-event="del" >删除</a>
<%--
    <a class="layui-btn layui-btn-xs" lay-event="cx" >查看详情</a>
--%>
</script>
<script>
    layui.use(['form','table','laydate',], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery;
        var a = "";
        fall(a);

    });
    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test1',//制定原始表格元素选择器（id或者class）
            where: {"dname": kwx},
            url: 'journalism/pagefind1',
            limit: 1,  //默认为10(每页条数)
            title: '公共文件柜表',

            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', fixed: 'left'},
                {field: 'documentId', width: 50,title: 'ID'},  //sort：true页面可进行排序操作
                {field: 'documentName',width: 240, title: '文件名称'},
                {field: 'd_time', title: '发布时间', width: 240},
                {field: 'documentCon', title: '文件内容', width: 240},
                {field: 'Filing_cabinetName', width: 200, title: '文件柜名称', sort: true},
                {fixed: 'right', width: 300, align: 'center', toolbar: '#barDemo', title: '操作'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {

                $(".layui-table-box").find("[data-field='Filing_cabinetName']").css("display","none");

                $(".layui-table-box").find("[data-field='documentCon']").css("display","none");

                //数据的回调用，可不写
              /*  $("[data-field='JL_State']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text("生效");
                    } else if ($(this).text() == '2') {
                        $(this).text("终止");
                    }
                })*/
            }
        });
        //监听行工具事件
        table.on('tool(wj)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('确定删除行么', function (index) {
                    $.ajax({
                        url: "/journalism/ddelete",
                        type: "post",
                        async: true,
                        data: {"documentId": data.documentId},
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            window.location.reload();
                        }
                    })
                });
            }else if(layEvent === 'edit'){
                $("#xmt").val(data.documentId);
                $("input[name='documentName']").val(data.documentName);
              $("#LAY_demo_editor").val(data.documentCon);
                layui.use(['layer', 'layedit'], function () {
                    var layer = layui.layer,
                        layedit = layui.layedit,
                        $ = layui.jquery;
                    //创建一个编辑器
                    var editIndex = layedit.build('LAY_demo_editor');
                    $('.site-demo-layedit').on('mouseout', function () {
                        var type = $(this).data('type');
                        active[type] ? active[type].call(this) : '';
                    });
                    layer.open({
                        type: 1,//类型
                        area: ['40%', '50%'],//定义宽和高
                        title: '编辑',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#tanchukuang'), //打开的内容

                    });
                    $("#btn").click(function () {
                        $.ajax({
                            url: "journalism/dupdate",
                            type: "post",
                            data: {
                                "documentName": $("input[name='documentName']").val(),

                               "documentCon": layedit.getContent(editIndex),  //获取编辑器内容
                                "documentId": $("#xmt").val()
                            },
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                                window.parent.location.reload();
                            }
                        });
                    });
                })
                }else if(layEvent === 'cx'){
                layer.open({
                    type:1,//类型
                    title:'查看详情',
                    area:['60%','60%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#tanchukuang1') //打开的内容
                });
                    $.ajax({
                        url: "journalism/dquery",
                        type: "post",
                        async: true,
                        data: {"documentId": data.documentId},
                        dataType: "json",
                        success:function (data) {
                            var a = data;
                            var b = "";
                            for(var i=0;i<a.length;i++){
                            b+= "<textarea class=\"layui-textarea\">"+a[i].documentCon+"</textarea></center>";
                            }
                            $("#list").html(b);

                        }
                    });

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
</script>