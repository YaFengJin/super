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
    <title>新建办公用品</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<form class="layui-form" id="form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">办公用品名称</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_name" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">登记类型</label>
            <div class="layui-input-inline">
                <select name="wj_id" id="WJID">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">办公用品库</label>
            <div class="layui-input-inline">
                <select name="b_id" id="BID" lay-filter="aaa">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">办公用品类</label>
            <div class="layui-input-inline">
                <select name="sort_id" id="SORTID">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">规格型号</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_specification" lay-verify="required" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">计量单位</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_unit" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_sprice" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">供应商</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_supplier" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">创建人</label>
            <div class="layui-input-inline">
                <input type="tel" value="${name}" readonly="readonly" lay-verify="required" autocomplete="off"
                       class="layui-input">
                <input type="text" name="setid" hidden value="${id}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">审批权限</label>
            <div class="layui-input-inline">
                <input type="tel" id="UserName" lay-verify="required" autocomplete="off" class="layui-input">
                <input type="tel" name="UserId" hidden id="UserId">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">当前库存</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_repertory" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">最低警戒库存</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_dline" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">最高警戒库存</label>
            <div class="layui-input-inline">
                <input type="tel" name="work_gline" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="button" class="layui-btn" lay-submit lay-filter="saveworksurface" value="立即提交">
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

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
<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree'
    });
    layui.use(['form', 'layedit', 'laydate', 'authtree'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , authtree = layui.authtree
            , $ = layui.$;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

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
        form.on('submit(saveworksurface)', function (data) {
            //发送ajax
            $.ajax({
                url: "/saveworksurface",
                type: "post",
                data: $("#form").serialize(),
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    layer.closeAll();
                    location.reload();
                }
            });
            //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //点击文本框弹出layer
        $("#UserName").click(function () {
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
                        $("#UserName").val(username);
                        $("#UserId").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });

    });

    layui.use(['form', 'util'], function () {
        var form = layui.form;
        $.ajax({
            url: "/queryworkbank",
            type: "post",
            dataType: "json",
            success: function (data) {
                var a = data.list1;
                var b = data.list2;
                for (var i = 0; i < a.length; i++) {
                    $("#WJID").append("<option value='" + a[i].wj_id + "'>" + a[i].wj_name + "</option>");
                }
                for (var i = 0; i < b.length; i++) {
                    $("#BID").append("<option value='" + b[i].b_id + "'>" + b[i].b_bankname + "</option>");
                }
                form.render('select');

            }
        });

        form.on('select(aaa)', function (data) {
            var b_id = data.value;
            $(function () {
                $("#SORTID").html("");
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
                            $("#SORTID").append("<option value='" + a[i].sort_id + "'>" + a[i].sort_style + "</option>");
                        }
                        form.render('select');
                    }
                });
            });
        });

    });

</script>