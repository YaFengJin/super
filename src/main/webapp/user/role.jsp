<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>

<table class="layui-hide" id="demo" lay-filter="demo"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger" lay-event="edit">分配权限</a>
</script>
<form class="layui-form" id="form" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-block">
            <input type="text" name="postname" id="PostName" lay-verify="required" placeholder="请输入角色名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色说明</label>
        <div class="layui-input-block">
            <input type="text" name="duty" id="Duty" lay-verify="required" placeholder="请输入角色说明"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属部门</label>
        <div class="layui-input-block">
            <select id="deptName" name="dept.deptid">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="saveRole">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    <div id="postIds"></div>
</form>

<form class="layui-form" id="treeView" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">选择权限</label>
        <div class="layui-input-inline">
            <div id="LAY-auth-tree-index"></div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" type="button" id="treeChild" lay-submit lay-filter="LAY-auth-tree-submit">提交
            </button>
        </div>
    </div>
</form>
<script type="text/javascript" src="../static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.config({
        base: '../static/extends/',
    }).extend({
        authtree: 'authtree',
    });
    layui.use(['table', 'form', 'layer', 'authtree'], function () {
        var $ = layui.$;
        var table = layui.table;//表格
        var authtree = layui.authtree;
        var form = layui.form;
        var layer = layui.layer;

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
        }


        //执行渲染
        table.render({
            elem: '#demo',
            url: 'queryRole',
            limits: [5, 10, 15, 20],
            limit: 5,
            id: "saveRole",
            title: '角色',
            toolbar: 'default',
            defaultToolbar: [''],
            where: {postName: $("#chaxun").val()},
            //加载表格内容
            cols: [[//标题栏
                {type: 'checkbox', align: 'center'},
                {field: 'id', align: 'center', title: '角色编号'},
                {field: 'name', align: 'center', title: '角色名称'},
                {field: 'Duty', align: 'center', title: '角色说明', sort: true},
                {field: 'deptName', align: 'center', title: '所属部门', sort: true},
                {fixed: 'right', align: 'center', toolbar: '#barDemo'}
            ]],
            /*done:function(){
                     $("[data-field='id']").children().each(function(){
                              if($(thsis).text()=='1'){
                                 $(this).text("aaaaaaaa");
                              }
                     })
            },*/
            page: true//是否显示分页
        });


        //监听头工具栏事件
        var saveOrUpdateUrl = "";
        table.on('toolbar(demo)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    saveOrUpdateUrl = "saveRole";
                    layer.open({
                        type: 1,//类型
                        area: ['30%', '60%'],//定义宽和高
                        title: '添加角色',//标题
                        shadeClose: false,//点击遮罩层关闭
                        content: $('#form') //打开的内容
                        /*content: 'index.jsp'//打开的内容 type为2*/
                    });
                    break;
                case 'update':
                    saveOrUpdateUrl = "updateRole";
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.open({
                            type: 1,//类型
                            area: ['30%', '60%'],//定义宽和高
                            title: '添加角色',//标题
                            shadeClose: false,//点击遮罩层关闭
                            content: $('#form') //打开的内容
                            /*content: 'index.jsp'//打开的内容 type为2*/
                        });
                        $("#PostName").val(checkStatus.data[0].name);
                        $("#Duty").val(checkStatus.data[0].Duty);
                        $("#deptName option:contains('" + data[0].deptName + "')").attr("selected", true);
                        $("#postIds").html("<input type='text' name='postid' value='" + checkStatus.data[0].id + "' style='display: none'>");
                        form.render();
                    }
                    break;
                case 'delete':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除行么', function (index) {
                            jQueryajax("deleteRole", {id: checkStatus.data[0].id}, "post", "json", function (response) {
                                layer.msg(response.message);
                                obj.del();
                            });
                        });
                    }
                    break;
            }
            ;
        });
        //监听工具条
        var id=0;
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                id=data.id;
                jQueryajax("queryPostMenu", {id: data.id}, "post", "json", function (response) {
                    authtree.render('#LAY-auth-tree-index', response, {
                        openchecked:false,
                        openall:false,
                        layfilter: 'lay-check-auth',
                    });
                });
                layer.open({
                    type: 1,//类型
                    title: '分配权限',//标题
                    shadeClose: false,//点击遮罩层关闭
                    offset: 't',
                    content: $('#treeView') //打开的内容
                });

            }
        });

        //查询部门
        $(function () {
            jQueryajax("queryDept", null, "post", "json", function (response) {
                var dept = "";
                for (var i = 0; i < response.length; i++) {
                    dept += "<option value=" + response[i].id + ">" + response[i].name + "</option>";
                }
                $("#deptName").html(dept);
                form.render();
            });
        });

        //添加角色或者修改角色
        form.on('submit(saveRole)', function (data) {
            jQueryajax(saveOrUpdateUrl, $("#form").serialize(), "post", "json", function (response) {
                alert(response.message);
                table.reload('saveRole', {
                    where: { //设定异步数据接口的额外参数，任意设
                        postName: $("#chaxun").val()
                    }
                });
                layer.closeAll();
            });
            return false;
        });
        //分配权限
        $("#treeChild").click(function (response) {
            var arr = [];
            for (var i = 0; i < authtree.getChecked("#LAY-auth-tree-index").length; i++) {
                arr[arr.length] = authtree.getChecked("#LAY-auth-tree-index")[i];
            }
            var array = arr.join(",");
            jQueryajax("grantMenuforpost", {"menuid": array,"id": id}, "post", "json", function (successData) {
                alert(successData.message);
                layer.close(layer.index);
            })
        });

    });
</script>
</body>
</html>