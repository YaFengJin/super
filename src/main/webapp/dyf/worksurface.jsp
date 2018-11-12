<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018-10-18
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品管理</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script type="text/javascript"  src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>
<h2 id="sp">办公用品</h2>
<center>
    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新建办公用品</button>
    </div>
</center>

<div style="margin-top: 17px;margin-left: 1103px;">
    <span>办公用品搜索：</span><input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入办公用品名称进行模糊查询"/>
</div>

<div class="layui-card-body">
    <table class="layui-hide" id="test" lay-filter="tab"></table>
</div>

<div id="upworksurface" style="display: none">
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">办公用品名称</label>
                <div class="layui-input-inline">
                    <input type="tel" name="work_name" readonly id="work_name" autocomplete="off" class="layui-input">
                    <input type="tel" name="work_id" id="work_id" style="display: none" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登记类型</label>
                <div class="layui-input-inline">
                    <select name="wj_id" id="wj_id" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">办公用品库</label>
                <div class="layui-input-inline">
                    <select name="b_id" id="b_id" lay-filter="aaa" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">办公用品类</label>
                <div class="layui-input-inline">
                    <select name="sort_id" id="sort_id" lay-verify="required">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">规格型号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="work_specification" readonly id="work_specification" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">计量单位</label>
                <div class="layui-input-inline">
                    <input type="tel" name="work_unit" readonly id="work_unit" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单价</label>
                <div class="layui-input-inline">
                    <input type="tel" name="work_sprice" lay-verify="required" id="work_sprice" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">供应商</label>
                <div class="layui-input-inline">
                    <input type="tel" name="work_supplier" lay-verify="required" id="work_supplier" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">创建人</label>
                <div class="layui-input-inline">
                    <input type="tel" name="setid"  id="setid" style="display: none" autocomplete="off" class="layui-input">
                    <input type="tel" name="UserName" readonly="readonly" lay-verify="required" id="UserName" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">审批权限</label>
                <div class="layui-input-inline">
                    <input type="tel" id="UserId" name="UserId" style="display: none" autocomplete="off" class="layui-input">
                    <input type="tel" id="UserIdName" lay-verify="required" name="UserIdName" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">当前库存</label>
                <div class="layui-input-inline">
                    <input type="tel" id="work_repertory" lay-verify="required" name="work_repertory" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">最低警戒库存</label>
                <div class="layui-input-inline">
                    <input type="tel" id="work_dline" lay-verify="required" name="work_dline" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">最高警戒库存</label>
                <div class="layui-input-inline">
                    <input type="tel" id="work_gline" lay-verify="required" name="work_gline" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-submit  lay-filter="updateworksurface">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
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
    <button class="layui-btn delete layui-btn-danger" lay-Event="del">删除</button>
    <button class="layui-btn update layui-btn-normal" lay-Event="upd">修改</button>
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
                    type: 2
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,content: 'saveworksurface.jsp'
                    ,area: ['60%', '80%']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        layer.closeAll();
                    }
                });
            },

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

    layui.use(['table','layer','form','authtree'], function(){
        var layer= layui.layer,
            form = layui.form;
        var $=layui.$;
        var authtree=layui.authtree;
        var kw='';
        addData(kw);

        form.on('submit(updateworksurface)', function(data){
            //发送ajax
            $.ajax({
                url:"/updateworksurface",
                type:"post",
                data:$("#form").serialize(),
                dataType:"json",
                success:function(data){
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

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
        //点击文本框弹出layer
        $("#UserIdName").click(function () {
            jQueryajax("/recruit/queryDept", null, "post", "json", function (data) {
                //生成树形菜单
                authtree.render('#LAY-auth-tree-index', data, {
                    autowidth: true,
                    layfilter: 'lay-check-auth',
                });
                var dept = layer.open({
                    type: 1,//类型
                    title: '选择部门',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#treeView') //打开的内容
                });
                authtree.on('change(lay-check-auth)', function () {
                    var a = [];
                    for (var i = 0; i < authtree.getChecked('#LAY-auth-tree-index').length; i++) {
                        a[a.length] = authtree.getChecked('#LAY-auth-tree-index')[i];
                    }
                    //数组拆分成字符串
                    var b = a.join(",");
                    //查询用户
                    var username = "";
                    var userid = "";
                    jQueryajax("/recruit/queryDeptUserNames", {deptid: b}, "post", "json", function (resp) {
                        username = resp.names.join(",");
                        userid = resp.ids.join(",");
                        $("#UserNames").html(username);
                        form.render();
                    });
                    $("#saveUser").click(function () {
                        $("#UserIdName").val(username);
                        $("#UserId").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });
    });

    function addData(kwx) {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '/quueryworksurface?keyWord=' + kwx
            , limit: 4 //默认为10
            , page: true
            , cols: [[
                {field: 'work_id', width: 150, title: '办公用品编号', sort: true} //sort：true页面可进行排序操作
                , {field: 'work_name', width: 150, title: '办公用品名称'}
                , {field: 'b_bankname', width: 150, title: '所属库'}
                , {field: 'sort_style', width: 150, title: '所属类'}
                , {field: 'name', width: 150, title: '审批权限'}
                , {field: 'work_specification', width: 150, title: '规格/型号'}
                , {field: 'wj_name', width: 150, title: '登记类型'}
                , {field: 'work_unit', width: 150, title: '计量单位'}
                , {field: 'work_sprice', width: 150, title: '单价'}
                , {field: 'work_supplier', width: 150, title: '供应商'}
                , {field: 'UserName', width: 150, title: '办公用品创建人'}
                , {field: 'work_repertory', width: 150, title: '当前库存'}
                , {field: 'work_dline', width: 150, title: '最低警戒库存'}
                , {field: 'work_gline', width: 156, title: '最高警戒库存'}
                , {fixed: 'right', width: 200, align: 'center', toolbar: '#barDemo', title: '操作'}
            ]]
            , done: function (res, curr, count) {
                //数据的回调用，可不写

            }
        });

        table.on('tool(tab)', function (obj) {
            var data = obj.data, LayEvent = obj.event;
            if (LayEvent === 'del') {
                var work_id = data.work_id;
                layer.confirm('你确定删除数据吗？', {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    $.ajax({
                        url: "/deleteworksurface",
                        type: "post",
                        data: {
                            "work_id": work_id
                        },
                        dataType: "json",
                        success: function (data) {
                            alert(data.message);
                            location.reload();
                        }
                    });

                });
            }
            ;
            if (LayEvent === 'upd') {
                var work_id = data.work_id;
                layer.open({
                    type:1,//类型
                    title:'修改办公用品',
                    area:['40%','80%'],//定义宽和高
                    shadeClose:false,//点击遮罩层关闭
                    content: $('#upworksurface') //打开的内容
                });
                layui.use(['form','util'], function() {
                    var form = layui.form;
                    $.ajax({
                        url:"/queryworksurfaceup",
                        type:"post",
                        data:{
                            "work_id":work_id
                        },
                        dataType:"json",
                        success:function(data){
                            var a = data.list1[0];
                            var b = data.list2;
                            var c = data.list3;
                            var d = data.list4;
                            $("#work_id").val(a.work_id);
                            $("#work_name").val(a.work_name);
                            $("#work_specification").val(a.work_specification);
                            $("#work_unit").val(a.work_unit);
                            $("#work_sprice").val(a.work_sprice);
                            $("#work_supplier").val(a.work_supplier);
                            $("#setid").val(a.setid);
                            $("#UserName").val(a.UserName);
                            $("#UserId").val(a.UserId);
                            $("#UserIdName").val(a.name);
                            $("#work_repertory").val(a.work_repertory);
                            $("#work_dline").val(a.work_dline);
                            $("#work_gline").val(a.work_gline);
                            for (var i=0;i<d.length;i++){
                                if (a.sort_id==d[i].sort_id){
                                    $("#sort_id").append("<option value='"+a.sort_id+"' selected='selected'>"+a.sort_style+"</option>");
                                }else if(d[i].b_id==a.b_id){
                                    $("#sort_id").append("<option value='"+d[i].sort_id+"'>"+d[i].sort_style+"</option>");
                                }
                                form.render('select');
                            }
                            $("#wj_id").html("");
                            for (var i=0;i<c.length;i++){
                                if (a.wj_id==c[i].wj_id){
                                    $("#wj_id").append("<option value='"+a.wj_id+"' selected='selected'>"+a.wj_name+"</option>");
                                }else{
                                    $("#wj_id").append("<option value='"+c[i].wj_id+"'>"+c[i].wj_name+"</option>");
                                }
                                form.render('select');
                            }
                            for (var i=0;i<b.length;i++){
                                if (a.b_id==b[i].b_id){
                                    $("#b_id").append("<option value='"+a.b_id+"' selected='selected'>"+a.b_bankname+"</option>");
                                }else{
                                    $("#b_id").append("<option value='"+b[i].b_id+"'>"+b[i].b_bankname+"</option>");
                                }
                                form.render('select');
                            }


                        }
                    });

                    form.on('select(aaa)', function (data) {
                        var b_id = data.value;
                        $(function () {
                            $("#sort_id").html("");
                            $.ajax({
                                url: "/querysortjin",
                                type: "post",
                                data: {
                                    "b_id": b_id
                                },
                                dataType: "json",
                                success: function (data) {
                                    var a = data.list;
                                    for (var i = 0; i < a.length; i++) {
                                        $("#sort_id").append("<option value='" + a[i].sort_id + "'>" + a[i].sort_style + "</option>");
                                    }
                                    form.render('select');
                                }
                            });
                        });
                    });

                })



            };
        });

    };
        $("#sear1").keyup(function(event){
            if(event.keyCode ==13){
                var keyWord=$("#sear1").val();
                addData(keyWord);
            }
        });
</script>