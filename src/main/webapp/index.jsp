<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--弹出框--%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../static/layui/css/layui.css"  media="all">
</head>


<script type="text/javascript" src="../static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript" src="../static/layui/lay/modules/form.js"></script>
<link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css" media="all">
<script type="text/javascript" src="../static/bootstrap/js/bootstrap.min.js"></script>
<style>
    #xj {
        position: absolute;
        left: 900px;
        top:10px;
    }
#sj{
    right: 10px;
}
</style>
<body>
<!--添加的时候选择部门-->
<form class="layui-form" id="DepttreeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择部门</label>
        <div class="layui-input-inline">
            <div id="DeptLAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-form-item">
            <div class="layui-inline">
                <div id="LAY-auth-tree-submit"></div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline" id="DeptNames">

            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <button class="layui-btn" type="button" id="saveDept" lay-submit lay-filter="LAY-auth-tree-submit">确定
            </button>
        </div>
    </div>
</form>


<%--模糊搜索--%>
<div style="margin-top: 17px;margin-left: 100px;">
    <span>类型：</span>

<%--
    <input type="text" style="height: 27px;width: 200px;" id="chaxun" placeholder="请输入类型进行查询"/>
--%>
  <select style="height: 27px;width: 200px;" id="chaxun" >
      <option>请输入类型进行查询</option>
      <option>媒体关注</option>
      <option>公司动态</option>
      <option>行业资讯</option>
  </select>

    <!-- 按钮触发模态框 -->
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="xj">
        新闻添加
    </button>
    <!-- 模态框（Modal） -->
    <div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="height: 400px">
                <div class="modal-header">
                    <h4>添加新闻</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>

                </div>
                <center>
                <table id="table">
                    <tr>
                        <td>标题</td>
                        <td>
                            <input type="text" name="JL_Theme" class="jlTheme form-control" id="jlTheme">
                        </td>
                    </tr>
                    <tr>
                        <td>新闻类型</td>
                        <td>
                            <select name="jt_id" id="jtId" class="form-control">

                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>评论类型</td>
                        <td>
                            <select name="rt_id" id="rtId" class="form-control">

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>发布时间</td>
                        <td>
                            <input type="date" name="JL_Datetime" class="jlDatetime form-control" id="jlDatetime">
                        </td>
                    </tr>
                    <tr>
                        <td>终止时间</td>
                        <td>
                            <input type="date" value="" name="JL_Tov" class="jlTov form-control" id="jlTov">
                        </td>
                    </tr>
                    <tr>
                        <td>内容</td>
                        <td>
                            <input type="text" value="" name="JL_Content" class="jlContent form-control" id="jlContent">
                        </td>
                    </tr>
                    <tr>
                        <td>发布范围</td>
                        <td>
                            <input type="text" name="deptId" id="deptId">
                            <input type="text" name="deptname" class="deptId form-control" id="deptname">
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td>
                            是否发布:
                        </td>
                        <td>
                            <input type="text" value="1" name="JL_State" id="jlState">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" value="发布" id="tt" style="position: absolute;left: 260px">
                            <input type="button" data-dismiss="modal" value="关闭" id="gb" style="position: absolute;left: 300px">

                        </td>
                    </tr>
                </table>
                </center>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<%--数据的table--%>
<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="bianshan"></table>

</div>
<center>
<div id="tanchukuang" style="display:none;">
    <div>
        <table class="table" style="width: 700px;">
        <tbody>
        <tr class="success">
         <td>新闻标题:<input type="text" name="JLTheme" ></td>
        </tr>

        <tr>
            <td>类型
                <select name="journalismtype" id="journalismtype" >

                </select>
          </td>
        </tr>
        <tr>
            <td>评论类型
                <select name="reprtitiontype" id="reprtitiontype" >

                </select>
            </td>
        </tr>
        <tr class="danger">
            <td>发布时间:<input type="date" name="JLDatetime"></td>
        </tr>
        <tr class="danger1">
            <td>终止时间:<input type="date" name="JLTov"></td>
        </tr>
        <tr>
            <td>发布范围<input type="text" name="dept_Id"></td>
        </tr>
        <tr class="warning">
            <td colspan=2>内容
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
</div>

<center>
    <div id="tanchukuang1" style="display:none;">
        <div>
            <table class="table" style="width: 700px;">
                <tbody>
                <tr class="success">
                    <td>新闻标题:<input type="text" name="JLTheme" ></td>
                </tr>
                <tr class="warning">
                    <td colspan=2>新闻内容:
                        <textarea  class="layui-textarea" style="position: relative;left: 70px;top: -20px" name="JL_Content" lay-verify="content" id="con"></textarea>
                    </td>
                </tr>
                <tr class="warning">
                    <td colspan=2>评论内容:

                        <textarea  class="layui-textarea" style="position: relative;left: 70px;top: -20px" name="cm_name" lay-verify="content" id="plcon"></textarea>
                    </td>
                </tr>
                </tbody>
               <%-- <tbody id="dataList"></tbody>
            </table>--%>
        </div>
      <%-- <div class="layui-form-item layui-form-text">
            <div class="layui-input-block" style="width:700px;position:relative;bottom:18px;left:-55px">
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor1"></textarea>
            </div>
        </div>--%>

<%--
        <button class="site-demo-layedit" style="width:50px" data-type="content" id="bt">确定</button>
--%>

        <input type="hidden" id="content1">
        <input type="hidden" id="xmt1">
    </div>

    </div>
</center>
</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="pl" id="pll">管理评论</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs sc" lay-event="del" >删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="updat">终止</a>
    <a class="layui-btn layui-btn-xs" lay-event="upda">生效</a>
</script>
<script type="text/javascript">
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });

    layui.use(['form','table','laydate','authtree'], function () {
        var form = layui.form,
            laydate = layui.laydate,
            $=layui.jquery;
           var authtree=layui.authtree;
        //封装ajax
        function jQueryajax(url, data, type, dataType, response) {
            $(function () {
                $.ajax({
                    url: url,
                    type: type,
                    data: data,
                    dataType: dataType,
                    success: function (res) {
                        response(res);
                    }
                });
            });
        };

        var a = "";
        fall(a);

        //查询部门
        $("#deptname").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (response) {
                //生成树形菜单
                authtree.render('#DeptLAY-auth-tree-index', response, {
                    autowidth: true,
                    layfilter: 'Deptlay-check-auth',
                });
                //获取选中的改变事件,通过id串去查询部门的名称并显示在页面上
                authtree.on('change(Deptlay-check-auth)', function (trees) {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#DeptLAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#DeptLAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    jQueryajax("/recruit/queryDeptName", {"deptid": b}, "post", "json", function (resp) {
                        var a = resp.join(",");
                        $("#DeptNames").html(a);
                    });
                });
                $("#saveDept").click(function () {
                    $("#deptname").val($("#DeptNames").html());
                    $("#deptId").val(authtree.getChecked('#DeptLAY-auth-tree-index'));
                    layer.close(layer.index);
                });
            });
            layer.open({
                type: 1,//类型
                title: '选择部门',//标题
                shadeClose: false,//点击遮罩层关闭
                offset: 't',
                content: $('#DepttreeView') //打开的内容
            });
        });

    });
    /*
      * 清空编辑后传入的值
      * */
    $("#xj").click(function () {
        $("input[name='JL_State']").val("1");
        $("input[name='JL_Theme']").val("");
        $("select[name='journalismtype']").val("");
        $("select[name='reprtitiontype']").val("");
        $("input[name='JL_Datetime']").val("");
        $("input[name='JL_Tov']").val("");
        $("input[name='DeptId']").val("");
        $("#LAY_demo_editor").val("");
    })

    function fall(kwx) {
        var table = layui.table //表格
        //执行渲染
        table.render({
            elem: '#test',//制定原始表格元素选择器（id或者class）
            where: {"name": kwx},
            url: 'journalism/pagefind',
            limit: 2,  //默认为10(每页条数)
            title: '新闻表',
            where:{
                "person":2
            },
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', fixed: 'left'},
                {field: 'JL_Id', width: 80, title: '新闻编号'},  //sort：true页面可进行排序操作
                 {field: 'person', width: 100, title: '发布人'},
                {field: 'jt_name', width: 100, title: '类型', sort: true},
                {field: 'rt_name', width: 100, title: '评论类型', sort: true},
                {field: 'deptId', width: 100, title: '发布范围'},
                /*{field: 'DeptId', width: 180, title: '发布范围',sort: true},*/
                {field: 'JL_Theme', width: 80, title: '标题', sort: true},
                {field: 'JL_Content', width: 100,title: '内容', sort: true},
                {field: 'JL_Datetime', width: 110, title: '发布时间', sort: true},
                {field: 'JL_Tov', width: 110, title: '终止时间', sort: true},

                /*{field: 'jt_id', width: 80, title: '类型编号'},
                {field: 'rt_id', width: 80, title: '评论类型编号'},*/
                /*{field: 'AM_Tovs', width: 180, title: '生效日期', sort: true},
                {field: 'AM_Tove', width: 180, title: '终止日期',sort: true},*/
              /*  {field: 'count', width: 80, title: '点击数', sort: true},*/
                {field: 'JL_State', width: 80, title: '状态', sort: true},
                {fixed: 'right', width: 300, align: 'center', toolbar: '#barDemo',title: '操作'}
            ]],
            page: true,//是否显示分页
            toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            done: function (res, curr, count) {
                //数据的回调用，可不写
                $("[data-field='JL_State']").children().each(function () {
                    if ($(this).text() == '1') {
                        $(this).text("生效");
                    } else if ($(this).text() == '2') {
                        $(this).text("终止");
                    }
                })
            }
        });
        //监听行工具事件
        table.on('tool(bianshan)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data, //获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
                layer.confirm('确定删除行么', function (index) {
                    $.ajax({
                        url: "/journalism/delete",
                        type: "post",
                        async: true,
                        data: {"JL_Id": data.JL_Id},
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            window.location.reload();
                        }
                    })
                });
            } else if (layEvent === 'edit') {
                $("#xmt").val(data.JL_Id);
                $("input[name='JLTheme']").val(data.JL_Theme);
                $("input[name='dept_Id']").val(data.deptId);
                $("select[name='journalismtype']").val(data.jt_id);
                $("select[name='reprtitiontype']").val(data.rt_id);
                $("input[name='JLDatetime']").val(data.JL_Datetime);
                $("input[name='JLTov']").val(data.JL_Tov);
                /* $("input[name='AM_Tove']").val(data.AM_Tove);*/
                $("#LAY_demo_editor").val(data.JL_Content);
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
                        area: ['80%', '80%'],//定义宽和高
                        title: '编辑',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#tanchukuang'), //打开的内容

                    });
                    $("#btn").click(function () {
                        $.ajax({
                            url: "journalism/update",
                            type: "post",
                            data: {
                                "jlTheme": $("input[name='JLTheme']").val(),
                                "deptId": $("input[name='dept_Id']").val(),
                                "journalismtype.jtId": $("select[name='journalismtype']").val(),
                                "reprtitiontype.rtId": $("select[name='reprtitiontype']").val(),
                                "jlDatetime": $("input[name='JLDatetime']").val(),
                             /*   "amTovs": $("input[name='AM_Tovs']").val(),*/
                                "jlTov": $("input[name='JLTov']").val(),
                                "jlContent": layedit.getContent(editIndex),  //获取编辑器内容
                                "jlId": $("#xmt").val()
                            },
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                                window.parent.location.reload();
                            }
                        });
                    });
                });
            }else if(layEvent === 'upda'){
                /* var date=new Date();
                 var a=date.toLocaleDateString();*/
                if(data.JL_State=='1'){
                    alert("公告生效中！！！！");
                }else{
                    $.ajax({
                        url:"journalism/State",
                        type:"post",
                        data:{
                            "jlId":data.JL_Id
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
                if(data.JL_State=='2'){
                    alert("公告终止中！！！！");
                }else{
                    $.ajax({
                        url:"journalism/State1",
                        type:"post",
                        data:{
                            "jlId":data.JL_Id
                        },
                        dataType:"json",
                        success:function(data){
                            alert(data.message);
                            window.location.reload();
                        }
                    });
                }
            }else if(layEvent === 'pl'){
               $("#xmt").val(data.JL_Id);

                $("input[name='JLTheme']").val(data.JL_Theme);
                $("#con").val(data.JL_Content);
                $.ajax({
                    url:"journalism/Comquery",
                    type:"post",

                    dataType:"json",
                  /*  success:function(data) {
                        $("#dataList").append("<tr>"+
                          /!*  "<td id='id'>"+data[i].id+"</td>"+*!/
                            "<textarea value='cm_id'>"+data[i].cm_name+"</textarea>"+

                            "</tr>"

                        );

                    }*/

                });
             layui.use(['layer', 'layedit'], function () {
                    var layer = layui.layer,
                        layedit = layui.layedit,
                        $ = layui.jquery;
/*
                    //创建一个编辑器
                    var editIndex = layedit.build('LAY_demo_editor');
                    $('.site-demo-layedit').on('mouseout', function () {
                        var type = $(this).data('type');
                        active[type] ? active[type].call(this) : '';
                    });*/
                    layer.open({
                        type: 1,//类型
                        area: ['80%', '80%'],//定义宽和高
                        title: '新闻评论',//题目
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#tanchukuang1'), //打开的内容

                    });

                    /*$("#btn").click(function () {
                        $.ajax({
                            url: "journalism/update",
                            type: "post",
                            data: {
                                "jlTheme": $("input[name='JLTheme']").val(),
                                "deptId": $("input[name='dept_Id']").val(),
                                "journalismtype.jtId": $("select[name='journalismtype']").val(),
                                "reprtitiontype.rtId": $("select[name='reprtitiontype']").val(),
                                "jlDatetime": $("input[name='JLDatetime']").val(),
                                /!*   "amTovs": $("input[name='AM_Tovs']").val(),*!/
                                "jlTov": $("input[name='JLTov']").val(),
                                "jlContent": layedit.getContent(editIndex),  //获取编辑器内容
                                "jlId": $("#xmt").val()
                            },
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                                window.parent.location.reload();
                            }
                        });
                    });*/
               });
            }
        })
    }
  //查询评论表


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
     * 查询新闻类型
     * */
    $(function () {
        $.ajax({
            url:"journalism/findtype",
            type:"post",
            dataType:"json",
            success:function(data) {
                $("#journalismtype").html("");
                var a ="";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].jt_id+">"+data[i].jt_name+"</option>";
                }
              $("#journalismtype").append(a);
                $("#jtId").append(a);
            }
        });
    });

    /*
    * 查询评论类型
    * */
    $(function () {
        $.ajax({
            url:"journalism/findtype1",
            type:"post",
            dataType:"json",
            success:function(data) {
                $("#reprtitiontype").html("");
                var a ="";
                for(var i=0;i<data.length;i++){
                    a+="<option value="+data[i].rt_id+">"+data[i].rt_name+"</option>";
                }
                $("#reprtitiontype").append(a);
                $("#rtId").append(a);
            }
        });
    });

    /*
    * 增加
    * */

    $(function() {
        $("#tt").click(function() {
            var JL_State=$("#jlState").val();
            var JL_Theme=$("#jlTheme").val();
            var jt_id=$("#jtId").val();
            var rt_id=$("#rtId").val();
            var JL_Datetime=$("#jlDatetime").val();
            var JL_Tov=$("#jlTov").val();
            var JL_Content=$("#jlContent").val();
            var deptId=$("#deptId").val();
            $.ajax({
                url:"journalism/save",
                type:"post",
                data:{
                    "jlState":JL_State,
                    "jlTheme":JL_Theme,
                    "journalismtype.jtId":jt_id,
                    "reprtitiontype.rtId":rt_id,
                    "jlDatetime":JL_Datetime,
                    "jlTov":JL_Tov,
                    "jlContent":JL_Content,
                    "deptId":deptId
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