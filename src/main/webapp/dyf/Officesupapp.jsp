<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品申领</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<form class="layui-form" id="form">

    <div class="layui-form-item">
        <label class="layui-form-label">登记类型</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="wj_id" id="wj_id" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">办公用品库</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="b_id" id="b_id" lay-filter="aaa" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">办公用品类</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="sort_id" id="sort_id" lay-filter="bbb" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">办公用品</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="work_id" id="work_id" lay-filter="ccc" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">单价</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="tel" name="apply_price" id="apply_price" lay-verify="required" readonly autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">数量</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="button" id="jian" class="layui-btn" value="-">
            <input type="text" name="apply_number" id="apply_number" value="1" readonly>
            <input type="button" id="jia" class="layui-btn" value="+">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">申请时间</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="date" name="apply_date" id="apply_date" lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">申请人</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="tel" id="UserName" value="${name}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
            <input type="text" name="UserId" hidden value="${id}" id="UserId">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">审批权限</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="tel"  id="useName" lay-verify="required" autocomplete="off" class="layui-input">
            <input type="text" name="useid" hidden id="useid">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block" style="width: 400px">
            <textarea placeholder="请输入内容" class="layui-textarea" name="apply_comment" id="apply_comment"></textarea>
            <input type="tel" name="apply_state" id="apply_state" style="display: none" value="0" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block" style="width: 400px">
            <input type="button" class="layui-btn" lay-submit  lay-filter="saveApply" value="立即提交">
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
    layui.use(['form', 'layedit', 'laydate','authtree'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,authtree=layui.authtree
            ,$=layui.$;
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        form.on('submit(saveApply)', function(data){
            //发送ajax
            $.ajax({
                url:"/saveApply",
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
        $("#useName").click(function () {
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
                        $("#useName").val(username);
                        $("#useid").val(userid);
                        layer.close(dept);
                    })
                });
            });
        });
    });

    layui.use(['form','util'], function() {
        var form = layui.form;
        $.ajax({
            url:"/queryworkbank",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = data.list1;
                var b = data.list2;
                for(var i=0;i<a.length;i++){
                    $("#wj_id").append("<option value='"+a[i].wj_id+"'>"+a[i].wj_name+"</option>");
                }
                for(var i=0;i<b.length;i++){
                    $("#b_id").append("<option value='"+b[i].b_id+"'>"+b[i].b_bankname+"</option>");
                }
                form.render('select');
            }
        });

        form.on('select(aaa)', function (data) {
            var b_id = data.value;
            $("#sort_id").html("");
            $("#work_id").html("");
            $("#apply_price").val("");
            $(function () {
                $.ajax({
                    url: "/querysortjin",
                    type: "post",
                    data: {
                        "b_id": b_id
                    },
                    dataType: "json",
                    success: function (data) {
                        var a = data.list;
                        $("#sort_id").append("<option>请选择</option>");
                        for (var i = 0; i < a.length; i++) {
                            $("#sort_id").append("<option value='" + a[i].sort_id + "'>" + a[i].sort_style + "</option>");
                        }
                        form.render('select');
                    }
                });
            });
        });

        form.on('select(bbb)', function (data) {
            var sort_id = data.value;
            $(function () {
                $("#work_id").html("");
                $("#apply_price").val("");
                $.ajax({
                    url: "/queryworksurfacejin",
                    type: "post",
                    data: {
                        "sort_id": sort_id
                    },
                    dataType: "json",
                    success: function (data) {
                        var a = data.list;
                        $("#work_id").append("<option>请选择</option>");
                        for (var i = 0; i < a.length; i++) {
                            $("#work_id").append("<option value='" + a[i].work_id + "'>" + a[i].work_name + "/库存" +a[i].work_repertory+ "</option>");
                        }
                        form.render('select');
                    }
                });
            });
        });

        form.on('select(ccc)', function (data) {
            var work_id = data.value;
            $(function () {
                $.ajax({
                    url: "/queryworksurface",
                    type: "post",
                    data: {
                        "work_id": work_id
                    },
                    dataType: "json",
                    success: function (data) {
                        var a = data.list[0];
                        $("#apply_price").val(a.work_sprice);
                        form.render('select');
                    }
                });
            });
        });

    });

    $("#jian").click(function() {
        if ($("#apply_number").val()>1){
            $("#apply_number").val(parseInt($("#apply_number").val())-1);
        }else {
            alert("数量不可以小于1！");
        }
    });

    $("#jia").click(function() {
        var work_id = $("#work_id").val();
        if($("#apply_price").val()==""){
            alert("请选择办公物品");
        }else{
        $.ajax({
            url:"/queryworksurface",
            type:"post",
            data:{
                "work_id":work_id
            },
            dataType:"json",
            success:function(data){
                var a = data.list[0];
                if ($("#apply_number").val()<a.work_repertory){
                    $("#apply_number").val(parseInt($("#apply_number").val())+1);
                }else{
                    alert("数量不可以大于所选物品的当前库存！")
                }
            }
        });
        }

    });

</script>