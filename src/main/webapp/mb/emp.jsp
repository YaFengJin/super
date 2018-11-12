<%--
  Created by IntelliJ IDEA.
  User: mabo
  Date: 2018/10/29
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<form class="layui-form" id="saveTypeName" style="display: none" >

    <div class="layui-form-item">
        <label class="layui-form-label">员工类型</label>
        <div class="layui-input-block">
            <input name="empTypeName" class="layui-input"  type="text" placeholder="请输入员工类型" autocomplete="off">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="saveDemo" lay-submit="">立即提交</button>
        </div>
    </div>
</form>
<script src="../static/layui/layui.js"></script>
<script>
    layui.use(['form', 'layer', 'laydate', 'table'], function () {
        var table = layui.table;
        var form= layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var $=layui.$;


        //第一个实例
        table.render({
            elem: '#demo',
            limits: [1, 5, 7, 10],
            url: 'select1', //数据接口
            limit: 5,
            id: "queryPlan",
            toolbar: 'default',
            defaultToolbar: ['filter', 'print', 'exports'],
            title: '角色',
            page: true, //开启分页
            cols: [[ //表头
                {fixed: 'left', title: '选择',type:'checkbox'}
                ,{field: 'emp_typeId', title: 'ID',  sort: true, fixed: 'left'}
                , {field: 'emp_typename', title: '用户名', }
                ,{fixed: 'right', align:'center', toolbar: '#barDemo'}

            ]]
        });
        //监听事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    layer.open({
                        type: 1 //此处以iframe举例
                        ,title: '更新用户数据'
                        ,area: ['60%', '60%']
                        ,shadeClose: false//点击遮罩层关闭
                        ,content: $("#saveTypeName")
                    });
                    form.on('submit(saveDemo)',function () {
                        $.ajax({
                            url:"savetype"
                            ,type:"post"
                            ,data:$("#saveTypeName").serialize()
                            ,dataType:"json"
                            ,success:function (res) {
                                table.reload("queryPlan");
                                layer.close(layer.index);
                                layer.msg(res.message);
                            }
                        });
                        return false;
                    })
                    break;
                case 'delete':
                    layer.msg('删除');6
                    break;
                case 'update':
                    layer.msg('编辑');
                    break;
            };
        });
        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(layEvent === 'detail'){ //查看
                alert(data.emp_typeId);
                alert(data.emp_typename);
            } else if(layEvent === 'del'){ //删除
                layer.confirm('确定删除吗？', function(index){
                    $.ajax({
                        url: "deletetype",
                        type: "post",
                        data: {id: data.emp_typeId},
                        dataType: "json",
                        success: function (response) {
                            if (response.message = "删除成功") {
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(index);
                                //向服务端发送删除指令
                            }
                        }
                    });   });
            } else if(layEvent === 'edit'){ //编辑
                //do something

                //同步更新缓存对应的值
                obj.update({
                    ,title: 'xxx'
                    username: '123'
                });
            }
        });


    });
</script>
</body>
</html>

