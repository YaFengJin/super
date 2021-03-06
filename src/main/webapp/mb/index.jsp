<%--
  Created by IntelliJ IDEA.
  User: mabo
  Date: 2018/10/24
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<body>
<table class="layui-hide" id="demo" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>



<form class="layui-form" id="form" style="display: none" >
    <div class="layui-form-item">
        <label class="layui-form-label">用户账号</label>
        <div class="layui-input-block">
            <input type="hidden" name="userId" id="userId">
            <input name="useraccount" class="layui-input" id="userAccount" type="text"  placeholder="请输入用户账号" autocomplete="off" lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-block">
            <input name="userpassword" class="layui-input" id="password" type="password" placeholder="请输入密码" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select name="dept.deptid" id="deptname" lay-filter="aihao">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="demo1" lay-submit="">立即提交</button>
        </div>
    </div>
</form>

<form class="layui-form" id="saveUser" style="display: none" >
    <div class="layui-form-item">
        <label class="layui-form-label">用户账号</label>
        <div class="layui-input-block">
            <input name="useraccount" class="layui-input"  type="text"  placeholder="请输入用户账号" autocomplete="off" lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-block">
            <input name="userpassword" class="layui-input"  type="password" placeholder="请输入密码" autocomplete="off">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input name="username" class="layui-input"  type="text" placeholder="请输入姓名" autocomplete="off">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select name="dept.deptid" id="user" lay-filter="aihao">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="saveDemo" lay-submit="">立即提交</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript">
 layui.use(['table','form','layer'],function () {
     var table=layui.table;
     var form=layui.form;
     var layer=layui.layer;
     var $=layui.$;
     //渲染表格
     table.render({
         elem:"#demo",
         url:"queryUser",
         id:"demo",
         title:"用户数据",
         limit:1,
         limits:[1,3,5,7],
         page: true, //开启分页
         toolbar: 'default', //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
         cols: [[ //表头
             {type: 'checkbox', fixed: 'left'}
             ,{field: 'id', title: 'ID', fixed: 'left'}
             ,{field: 'name', title: '用户名' }
             ,{field: 'account', title: '用户账号' }
             ,{field: 'password', title: '密码'}
             ,{field: 'deptname', title: '所属部门'}
             ,{fixed: 'right',  align:'center', toolbar: '#barDemo'}
         ]]
     });

     //监听头事件
     table.on('toolbar(demo)', function(obj){
         var checkStatus = table.checkStatus(obj.config.id);
         switch(obj.event){
             case 'add':
                    layer.open({
                         type: 1 //此处以iframe举例
                         ,title: '更新用户数据'
                         ,area: ['30%', '60%']
                         ,shadeClose: false//点击遮罩层关闭
                         ,content: $("#saveUser")
                     });
                 break;
         };
     });

     //监听行工具事件
     table.on('tool(demo)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
         var data = obj.data //获得当前行数据
             ,layEvent = obj.event; //获得 lay-event 对应的值
         if(layEvent === 'detail'){
             layer.msg('查看操作');
         } else if(layEvent === 'del'){
             layer.confirm('确定要删除吗?', function(index){
                 $.ajax({
                     url:"deleteUser",
                     type:"post",
                     data:{id:data.id},
                     dataType:"json",
                     success:function (response) {
                         if(response.message="删除成功"){
                             alert(response.message);
                             obj.del(); //删除对应行（tr）的DOM结构
                             table.reload('demo', { });
                             layer.close(layer.index);
                         }else{
                             alert(response.message);
                         }
                     }
                 });
             });
         } else if(layEvent === 'edit'){
             layer.open({
                 type: 1 //此处以iframe举例
                 ,title: '更新用户数据'
                 ,area: ['30%', '60%']
                 ,shadeClose: false//点击遮罩层关闭
                 ,content: $("#form")
             });
                 $("#userId").val(data.userId);
                 $("#userAccount").val(data.account);
                 $("#password").val(data.password);
                 $("#userId").val(data.id);
                 $("#deptname option:contains('" + data.deptname + "')").attr("selected", true);
                 form.render();
         }
     });

     //监听提交
     //修改用户
     form.on('submit(demo1)', function(data){
             $.ajax({
                 url:"updateUser",
                 type:"post",
                 data:$("#form").serialize(),
                 dataType:"json",
                 success:function (response) {
                     alert(response.message);
                     table.reload('demo', { });
                     layer.close(layer.index);
                 }
             });
         return false;
     });

     //添加用户
     form.on('submit(saveDemo)', function(data){
         $.ajax({
             url:"saveUser",
             type:"post",
             data:$("#saveUser").serialize(),
             dataType:"json",
             success:function (response) {
                 alert(response.message);
                 table.reload('demo', { });
                 layer.close(layer.index);
             }
         });
         return false;
     });

     //查询部门
     $(function () {
          $.ajax({
              url:"queryDept",
              type:"post",
              dataType:"json",
              success:function (data) {
                  var dept="";
                  for (var i=0;i<data.length;i++){
                      dept+="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
                  }
                  $("#deptname").html(dept);
                  $("#user").html(dept);
                  form.render();
              }
          });
     })

 })
</script>
</body>
</html>
