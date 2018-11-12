<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>办公用品库存管理</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <script src="../static/dyf_js/jquery-3.2.1.min.js"></script>
</head>
<body>

<form class="layui-form" id="form">

    <div class="layui-form-item">
        <label class="layui-form-label">登记类型</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="rgId" id="rg_id" lay-filter="sss" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">办公用品库</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="bId" id="b_id" lay-filter="aaa" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">办公用品类</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="sortId" id="sort_id" lay-filter="bbb" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">办公用品</label>
        <div class="layui-input-block" style="width: 400px">
            <select name="workId" id="work_id" lay-filter="ccc" lay-verify="required">
                <option value="">请选择</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">单价</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="tel" name="mtPrice" id="mt_price" lay-verify="required" readonly autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">申请数量</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="button" id="jian" class="layui-btn" value="-">
            <input type="text" name="mtNumber" id="mt_number" value="1" readonly>
            <input type="button" id="jia" class="layui-btn" value="+">
        </div>
    </div>

    <div class="layui-form-item mt_start" style="display:none;">
        <label class="layui-form-label">维护开始时间</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="Date" name="mtStart" id="mt_start" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item mt_end" style="display:none;">
        <label class="layui-form-label">维护结束时间</label>
        <div class="layui-input-block" style="width: 400px">
            <input type="Date" name="mtEnd" id="mt_end" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block" style="width: 400px">
            <textarea placeholder="请输入内容" class="layui-textarea" name="mtComment" id="mt_comment"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block" style="width: 400px">
            <input type="button" class="layui-btn" lay-submit  lay-filter="saveMaintain" value="立即提交">
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

</body>

</html>
<script src="../static/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        form.on('submit(saveMaintain)', function(data){
            var work_id=$("#work_id").val();
            var mt_number=$("#mt_number").val();
            var aaa = $.param({"work_id":work_id, "mt_number":mt_number}) + "&" + $("#form").serialize();
            if($("#rg_id").val()==1) {
                //发送ajax
                $.ajax({
                    url: "/MaintainCG",
                    type: "post",
                    data: aaa,
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        location.reload();
                    }
                });
                //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }else if($("#rg_id").val()==2) {
                //发送ajax
                $.ajax({
                    url: "/MaintainWH",
                    type: "post",
                    data: aaa,
                    dataType: "json",
                    success: function (data) {
                        alert(data.message);
                        location.reload();
                    }
                });
                //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            }
                });

    });

    layui.use(['form','util'], function() {
        var form = layui.form;
        $.ajax({
            url:"/queryworkbank",
            type:"post",
            dataType:"json",
            success:function(data){
                var a = data.list3;
                var b = data.list2;
                for(var i=0;i<a.length;i++){
                    $("#rg_id").append("<option value='"+a[i].rg_id+"'>"+a[i].rg_name+"</option>");
                }
                for(var i=0;i<b.length;i++){
                    $("#b_id").append("<option value='"+b[i].b_id+"'>"+b[i].b_bankname+"</option>");
                }
                form.render('select');
            }
        });

        form.on('select(sss)', function (data) {
            var rg_id = data.value;
            if(rg_id==1){
                $(".mt_start").css('display','none');
                $(".mt_end").css('display','none');
            }else if(rg_id==2){
                $(".mt_start").css('display','block');
                $(".mt_end").css('display','block');
            }

        });

        form.on('select(aaa)', function (data) {
            var b_id = data.value;
            $("#sort_id").html("");
            $("#work_id").html("");
            $("#mt_price").val("");
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
                $("#mt_price").val("");
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
                            $("#work_id").append("<option value='" + a[i].work_id + "'>" + a[i].work_name + "/库存" +a[i].work_repertory + "</option>");
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
                        $("#mt_price").val(a.work_sprice);
                        form.render('select');
                    }
                });
            });
        });

    });

    $("#jian").click(function() {
        if ($("#mt_number").val()>1){
            $("#mt_number").val(parseInt($("#mt_number").val())-1);
        }else {
            alert("数量不可以小于1！");
        }
    });

    $("#jia").click(function() {
        var work_id = $("#work_id").val();
        if($("#mt_price").val()==""){
            alert("请选择办公物品");
        }else{
            $("#mt_number").val(parseInt($("#mt_number").val())+1);
        }

    });

</script>